# 网格交易策略

## 策略思想

网格交易（Grid Trading）的核心是**"在震荡市中反复赚取波动"**：

- 把价格区间 `[lower, upper]` 等分成 N 格（如 10 格，每格 1%）
- 在每个格子上**预挂买卖单**：
    - 价格下方各格 → 挂买单（价格越低挂得越多）
    - 价格上方各格 → 挂卖单（价格越高挂得越多）
- 当价格穿越一格 → 对应买单成交 → 立刻在上方一格挂卖单锁价差
- 适合**波动率稳定、方向不明确**的震荡行情

关键参数是**区间上下沿**的确定：本例用最近 30 日的最高/最低作为动态区间，并叠加**单边行情保护**——价格突破上沿或下沿时，自动撤销所有挂单、停止开新仓，避免在单边行情里持续加仓/亏损。

## 适用场景

- ✅ **震荡市 / 区间行情**的标的（BABA、港股、ETF、商品期货）
- ✅ **手动设定区间**：用支撑位/压力位作为上下沿
- ✅ **手续费低**的账户（网格要频繁成交）
- ❌ **强趋势行情**：会被单边套牢（虽然有"单边保护"，突破后追空/追多的损失仍然不小）
- ❌ **点差大**的标的：每格利润覆盖不了手续费和点差
- ❌ **小市值 / 流动性差**：每格挂单量超过日成交量 1% 时会成"挂单墙"

回测常见结论：BTC 在 2020-2022 区间震荡期网格年化 30-50%；强趋势期（2024 Q4 BTC 破前高）网格大幅跑输趋势策略。

## 参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| `symbol` | `BABA` | 交易标的 |
| `range_lookback` | `30` | 动态区间用最近 N 日 high/low |
| `grid_count` | `10` | 网格数量 |
| `grid_step_pct` | `0.01` | 每格间距（1%） |
| `order_qty` | `100` | 每格下单股数 |
| `poll_interval` | `30` | 主循环 sleep 秒数 |
| `rebuild_threshold` | `0.05` | 价格突破区间 5% 时停止网格 |

!!! warning "区间确定是关键"
    - **固定区间**（手动给 `lower=70, upper=90`）：更稳，但需要定期人工调
    - **动态区间**（本例用 30 日 high/low）：自适应，但区间漂移时网格会跟随，错过反转抄底
    - 生产环境建议两者结合：固定区间为主，动态区间为辅

## 代码

```python
"""
网格交易策略（BABA 10 格 1% 网格 + 单边保护）

依赖：
    pip install ib_insync pandas
运行：
    1. 启动 TWS / IB Gateway（端口 7497）
    2. python grid.py
"""
from datetime import datetime
import pandas as pd
from ib_insync import IB, Stock, LimitOrder


# ---------- 策略参数 ----------
SYMBOL = 'BABA'
EXCHANGE = 'SMART'
CURRENCY = 'USD'
RANGE_LOOKBACK = 30      # 用最近 30 日 high/low 当区间
GRID_COUNT = 10          # 网格数
GRID_STEP_PCT = 0.01     # 每格 1%
ORDER_QTY = 100
POLL_INTERVAL = 30
STOP_TRIGGER_PCT = 0.05  # 价格突破区间 5% → 停止开仓
BAR_SIZE = '1 day'
DURATION = '60 D'


def to_df(bars):
    from ib_insync import util
    return util.df(bars)


def compute_range(ib: IB, contract: Stock):
    """拉日线，返回 (lower, upper, mid, last_price)。"""
    bars = ib.reqHistoricalData(
        contract,
        endDateTime='',
        durationStr=DURATION,
        barSizeSetting=BAR_SIZE,
        whatToShow='TRADES',
        useRTH=True,
    )
    df = to_df(bars)
    window = df.tail(RANGE_LOOKBACK)
    upper = window['high'].max()
    lower = window['low'].min()
    last = float(df['close'].iloc[-1])
    return float(lower), float(upper), float(last)


def build_grid_prices(lower: float, upper: float):
    """把 [lower, upper] 等分成 GRID_COUNT 格，返回网格价格列表。"""
    step = (upper - lower) * GRID_STEP_PCT / (GRID_STEP_PCT * GRID_COUNT) * GRID_COUNT
    # 上面 step 写法和 (upper-lower)/GRID_COUNT 等价；这里显式公式方便读
    step = (upper - lower) / GRID_COUNT
    prices = [lower + step * i for i in range(GRID_COUNT + 1)]
    return prices, step


def current_position(ib: IB, contract: Stock) -> int:
    for pos in ib.positions():
        if pos.contract.conId == contract.conId:
            return int(pos.position)
    return 0


def cancel_all(ib: IB, contract: Stock):
    """撤销该合约所有未成交挂单。"""
    for t in list(ib.openTrades()):
        if t.contract.conId == contract.conId:
            ib.cancelOrder(t.order)
    print(f'    已撤销 {len(ib.openTrades())} 条旧挂单')


def place_grid(ib: IB, contract: Stock, last: float, lower: float, upper: float):
    """在 last 上下各挂 LIMIT 单。"""
    prices, step = build_grid_prices(lower, upper)
    placed = 0
    for p in prices:
        if p <= last and p >= lower:
            # 下方：买入挂单
            order = LimitOrder('BUY', ORDER_QTY, round(p, 2))
            order.transmit = True
            ib.placeOrder(contract, order)
            placed += 1
        elif p > last and p <= upper:
            # 上方：卖出挂单
            order = LimitOrder('SELL', ORDER_QTY, round(p, 2))
            order.transmit = True
            ib.placeOrder(contract, order)
            placed += 1
    print(f'    新挂 {placed} 条 LIMIT 单，步长 {step:.2f}')


def in_stop_zone(last: float, lower: float, upper: float) -> bool:
    """价格是否突破区间超过阈值 → 单边行情保护。"""
    if last > upper * (1 + STOP_TRIGGER_PCT):
        return True
    if last < lower * (1 - STOP_TRIGGER_PCT):
        return True
    return False


def main():
    ib = IB()
    ib.connect('127.0.0.1', 7497, clientId=3)

    contract = Stock(SYMBOL, EXCHANGE, CURRENCY)
    ib.qualifyContracts(contract)
    print(f'合约：{contract.symbol} (conId={contract.conId})')

    while ib.isConnected():
        lower, upper, last = compute_range(ib, contract)
        pos = current_position(ib, contract)
        stop = in_stop_zone(last, lower, upper)
        print(f'[{datetime.now():%H:%M:%S}] last={last:.2f} '
              f'range=[{lower:.2f}, {upper:.2f}] pos={pos} stop={stop}')

        if stop:
            print('    ⚠️ 价格突破区间阈值 → 撤销所有挂单，停止开新仓')
            cancel_all(ib, contract)
        else:
            # 简化：每个轮询都重新铺一次（实盘应判断"区间是否显著漂移"才重铺）
            cancel_all(ib, contract)
            place_grid(ib, contract, last, lower, upper)

        ib.sleep(POLL_INTERVAL)

    print('连接断开，策略退出。')


if __name__ == '__main__':
    main()
```

!!! danger "示例简化"
    - 每个轮询都 `cancel_all` + 重新铺一遍 → 实盘会有"挂单闪烁"，浪费 TWS 请求
    - 正确做法：只在新单成交、网格区间显著漂移（>1%）时才重铺
    - 实盘前必加 `clientId` 幂等、日志持久化、挂单数量限制

## 风险提示

- **单边行情是最大风险**：网格策略在 5% 以上的单边行情里可能爆亏。本例的"单边保护"只撤单不平仓——若已有反向持仓，仍会浮亏扩大。**生产版本必须加方向性止损**（如跌破区间 + 1% 全平）。
- **手续费侵蚀利润**：10 格网格如果每格利润 0.5%，但双边手续费 + 点差占 0.2%，实际每笔只剩 0.3%。**手续费率必须事先核对 IB 佣金表**。
- **挂单量与流动性**：单次挂单量 ≤ 该价位日均成交量的 1%，否则成"挂单墙"自己砸自己。
- **区间漂移**：用动态区间时，每天高低点都在变，网格跟着漂移，等于"追涨杀跌"，可能错过反转抄底。
- **回测陷阱**：网格策略在回测里看着"高胜率低回撤"很漂亮，但实盘里**滑点 + 部分成交 + 拒单**会让胜率大打折扣。
- **复利 / 杠杆**：网格不自带杠杆，但很多人会加 2-3 倍杠杆，震荡市爆赚、单边市爆亏。
- **税务**：美股每笔网格都可能产生应税事件，频繁交易账户税务复杂。

## 改进方向

1. **动态区间 + ATR 加宽**：用 `range = mid ± k*ATR` 而非简单 high/low，避免单根 K 线极值破坏区间
2. **不对称网格**：上涨趋势时买单密、卖单疏；下跌趋势反之（用 MA 斜率判断）
3. **马丁/反马丁**：亏损加仓（马丁）vs 盈利加仓（反马丁）——风险/收益特征完全不同
4. **手续费模型**：用 `commission_report` 字段回填实际成本，做真实 PnL
5. **挂单去重**：维护本地字典 `{(side, price): orderId}`，避免 TWS 一侧已成交时本地还在等
6. **重铺触发条件**：只在 `区间漂移 > 1%` 或 `已成交笔数 >= 5` 时才重铺
7. **多币种/多市场**：BTC 网格 + 黄金网格 + 货币对网格，组合相关性低
8. **监控告警**：Telegram / 邮件 / Lark 通知关键事件（突破区间、累计亏损、撤单失败等）
