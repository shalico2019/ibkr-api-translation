# 通道突破策略

## 策略思想

Donchian 通道突破是**海龟交易法则**的核心信号之一，由 Richard Dennis 在 1980 年代推广。逻辑：

- **Donchian 通道上轨** = 最近 N 日的**最高价**
- **Donchian 通道下轨** = 最近 N 日的**最低价**
- 收盘价**突破上轨** → 视为新趋势启动 → 买入
- 收盘价**跌破下轨** → 趋势反转 → 平仓（这里也可以同时开反头寸做反转）

本策略叠加 **ATR（Average True Range）动态止损**：买入价下方 `2 * ATR` 处挂止损单。这样止损距离**根据波动率自适应**——震荡市 ATR 小、止损紧；趋势市 ATR 大、止损宽。

## 适用场景

- ✅ **波动率扩张**的标的：趋势启动初期最容易捕捉
- ✅ **期货、商品、外汇**等趋势性强的市场（Donchian 本来就是为期货设计的）
- ✅ **加密币 4h / 日线**：BTC/ETH 这种纯趋势品种效果显著
- ❌ **长时间震荡**：会被反复止损打掉
- ❌ **财报日跳空**：跳空后下一根 K 线可能直接打到止损位
- ❌ **流动性差**的标的：突破信号易被假突破/假跌破欺骗

回测常见结论：TSLA 这种高波动标的在 20 日通道上效果较好；AAPL 这种低波动股建议用 50 日通道。

## 参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| `symbol` | `TSLA` | 交易标的 |
| `donchian_period` | `20` | Donchian 通道周期（天） |
| `atr_period` | `14` | ATR 周期 |
| `atr_multiplier` | `2.0` | 止损距离 = ATR × 此系数 |
| `bar_size` | `1 day` | K 线周期 |
| `duration` | `120 D` | 历史长度（> donchian + atr） |
| `quantity` | `100` | 单次下单股数 |
| `poll_interval` | `300` | 主循环 sleep 秒数（日线策略 5 分钟轮询一次足够） |

!!! tip "调参建议"
    - 短周期（5-10 日）→ 高换手，趋势牛市中捕捉更早
    - 长周期（50-55 日，海龟原始参数）→ 假突破少，但信号滞后
    - `atr_multiplier` 调到 3.0 以上可减少被震出，但单笔亏损会变大

## 代码

```python
"""
Donchian 通道突破策略（TSLA 20 日通道 + ATR 止损）

依赖：
    pip install ib_insync pandas
运行：
    1. 启动 TWS / IB Gateway（端口 7497 模拟 / 7496 实盘）
    2. python breakout.py
"""
from datetime import datetime
import pandas as pd
from ib_insync import IB, Stock, MarketOrder, StopOrder


# ---------- 策略参数 ----------
SYMBOL = 'TSLA'
EXCHANGE = 'SMART'
CURRENCY = 'USD'
DONCHIAN = 20
ATR_PERIOD = 14
ATR_MULT = 2.0
BAR_SIZE = '1 day'
DURATION = '120 D'
QUANTITY = 100
POLL_INTERVAL = 300  # 秒


def to_df(bars):
    from ib_insync import util
    return util.df(bars)


def compute_signals(df: pd.DataFrame) -> pd.DataFrame:
    """在 df 上加 Donchian 上下轨、ATR、上轨突破 / 下轨跌破标记。"""
    df['prev_high'] = df['high'].shift(1).rolling(DONCHIAN).max()
    df['prev_low'] = df['low'].shift(1).rolling(DONCHIAN).min()

    # ATR
    prev_close = df['close'].shift(1)
    tr = pd.concat([
        df['high'] - df['low'],
        (df['high'] - prev_close).abs(),
        (df['low'] - prev_close).abs(),
    ], axis=1).max(axis=1)
    df['atr'] = tr.rolling(ATR_PERIOD).mean()

    # 信号：今天收盘 > 昨日 N 日最高 → 突破；今天收盘 < 昨日 N 日最低 → 跌破
    df['break_up'] = df['close'] > df['prev_high']
    df['break_dn'] = df['close'] < df['prev_low']
    return df


def fetch_df(ib: IB, contract: Stock) -> pd.DataFrame:
    bars = ib.reqHistoricalData(
        contract,
        endDateTime='',
        durationStr=DURATION,
        barSizeSetting=BAR_SIZE,
        whatToShow='TRADES',
        useRTH=True,
    )
    if not bars:
        raise RuntimeError('未拉到 K 线')
    df = to_df(bars)
    return compute_signals(df)


def current_position(ib: IB, contract: Stock) -> int:
    for pos in ib.positions():
        if pos.contract.conId == contract.conId:
            return int(pos.position)
    return 0


def has_open_stop(ib: IB, contract: Stock) -> bool:
    """检查是否已挂出针对该合约的 STP 单。"""
    for t in ib.openTrades():
        if t.contract.conId == contract.conId and isinstance(t.order, StopOrder):
            return True
    return False


def cancel_stops(ib: IB, contract: Stock):
    """撤销该合约上所有未成交的 Stop 单。"""
    for t in list(ib.openTrades()):
        if t.contract.conId == contract.conId and isinstance(t.order, StopOrder):
            ib.cancelOrder(t.order)
            print(f'    撤销旧止损单 orderId={t.order.orderId}')


def submit_market(ib: IB, contract: Stock, action: str, qty: int):
    order = MarketOrder(action, qty)
    trade = ib.placeOrder(contract, order)
    print(f'[{datetime.now():%H:%M:%S}] 市价单 {action} {qty}')
    trade.waitUntilFilled(timeout=30)
    print(f'    成交均价 {trade.orderStatus.avgFillPrice}')
    return trade


def submit_stop(ib: IB, contract: Stock, qty: int, stop_price: float):
    order = StopOrder('SELL', qty, stop_price)  # 简化：只做多头方向
    order.transmit = True
    ib.placeOrder(contract, order)
    print(f'    挂止损单 SELL {qty} @ {stop_price:.2f}')


def main():
    ib = IB()
    ib.connect('127.0.0.1', 7497, clientId=2)

    contract = Stock(SYMBOL, EXCHANGE, CURRENCY)
    ib.qualifyContracts(contract)
    print(f'合约已确认：{contract.symbol} (conId={contract.conId})')

    entry_price = None
    while ib.isConnected():
        df = fetch_df(ib, contract)
        row = df.iloc[-1]
        pos = current_position(ib, contract)
        sig = 'HOLD'
        if row['break_up'] and pos == 0:
            sig = 'BUY'
        elif row['break_dn'] and pos > 0:
            sig = 'SELL'

        print(f'[{datetime.now():%H:%M:%S}] price={row["close"]:.2f} '
              f'up={row["prev_high"]:.2f} dn={row["prev_low"]:.2f} '
              f'atr={row["atr"]:.2f} pos={pos} sig={sig}')

        if sig == 'BUY':
            cancel_stops(ib, contract)
            trade = submit_market(ib, contract, 'BUY', QUANTITY)
            entry_price = trade.orderStatus.avgFillPrice
            stop = entry_price - ATR_MULT * row['atr']
            submit_stop(ib, contract, QUANTITY, stop)
        elif sig == 'SELL' and pos > 0:
            cancel_stops(ib, contract)
            submit_market(ib, contract, 'SELL', pos)
            entry_price = None

        ib.sleep(POLL_INTERVAL)

    print('连接断开，策略退出。')


if __name__ == '__main__':
    main()
```

## 风险提示

- **跳空风险**：止损单只在常规时段内有效。盘后跳空开盘可能直接低于止损价，按开盘价成交而非止损价。
- **ATR 滞后**：ATR 是历史波动率均值，**黑天鹅事件**（财报雷、监管突袭）时 ATR 反而偏低，止损过紧。
- **单边持仓**：本例只做多头方向的突破；如果想做空，要把 `StopOrder('SELL')` 改为 'BUY'（反头寸的止损方向），并考虑美股做空的融券成本。
- **手续费模型缺失**：本例未扣除 IB 佣金、回扣、回转限制（PDT 等）。
- **冷启动期**：前 20 + 14 ≈ 35 根 K 线是预热期，信号无效。
- **同一标的重复止损**：示例用 `cancel_stops` 撤销旧单，但实盘前要在 `ib.openTrades()` 之后强制 sleep 0.5s 让 TWS 处理。

## 改进方向

1. **多周期过滤**：用日线做信号、4h 线做确认（共振才入场）
2. **波动率过滤器**：当 ATR 处于历史 20% 分位以下时不开新仓（避免低波震荡）
3. **跟踪止损（Chandelier Exit）**：把硬止损改为 `highest_close - 3*ATR`，跟踪锁定利润
4. **仓位与波动率反比**：单笔风险 = 账户 1% / (entry - stop) → 波动大时自动减仓
5. **多市场组合**：TSLA + BTC + 黄金期货，相关性低，组合夏普更高
6. **海龟原版改进**：原版还包含 "skip 1 个 55 日突破" 的过滤规则（避免在第 1 次假突破后接飞刀），可加
7. **完整回测**：用 `backtrader` 框架重写，跑 10 年样本 + 5 年样本外验证
