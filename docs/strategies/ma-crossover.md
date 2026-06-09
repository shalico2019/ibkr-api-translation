# 均线交叉策略

## 策略思想

均线交叉（Moving Average Crossover）是趋势跟踪里最经典的入门策略之一。核心逻辑：

- **快线**对价格变化更敏感，**慢线**更平滑。
- 当**快线上穿慢线**（金叉）→ 视为上涨趋势启动 → 买入。
- 当**快线下穿慢线**（死叉）→ 视为上涨趋势结束 → 卖出/平仓。

这里选用 **5 日均线** 作为快线、**20 日均线** 作为慢线，参数最经典，调参空间也最大。

## 适用场景

- ✅ **强趋势行情**（单边上涨/下跌的指数或个股）：表现最好
- ✅ **流动性好**的标的（大盘股、ETF），避免滑点和跳空
- ❌ **震荡市**：反复金叉/死叉会被左右打脸，频繁止损
- ❌ **低流动性**标的：信号延迟、滑点大
- ❌ **财报/重大事件**前后：单日跳空可能造成假信号

回测常见结论：AAPL 这种趋势性好的大盘股效果优于小盘股；BTC/ETH 这种 7×24 小时、高波动品种参数需要重调。

## 参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| `symbol` | `AAPL` | 交易标的 |
| `exchange` | `SMART` | 智能路由 |
| `currency` | `USD` | 计价货币 |
| `fast_period` | `5` | 快线周期（天） |
| `slow_period` | `20` | 慢线周期（天） |
| `bar_size` | `1 day` | K 线周期（日线 / `1 min` / `5 mins` 等） |
| `duration` | `60 D` | 拉取历史长度（要够慢线 + 预热） |
| `quantity` | `100` | 单次下单股数 |
| `poll_interval` | `60` | 主循环 sleep 秒数 |

!!! tip "调参建议"
    - 震荡市把 `fast_period` 调大（如 10/30），过滤掉噪声
    - 期货/加密币改用 `bar_size='4 hours'` + `fast_period=20, slow_period=80`
    - 一定要用 `useRTH=True` 拿常规时段数据，避免盘前盘后噪声

## 代码

```python
"""
均线交叉策略（AAPL 5/20 日均线）

依赖：
    pip install ib_insync pandas
运行：
    1. 启动 TWS / IB Gateway，启用 API 连接（端口 7497 / 7496）
    2. python ma-crossover.py
"""
from datetime import datetime
import pandas as pd
from ib_insync import IB, Stock, MarketOrder


# ---------- 策略参数 ----------
SYMBOL = 'AAPL'
EXCHANGE = 'SMART'
CURRENCY = 'USD'
FAST_PERIOD = 5
SLOW_PERIOD = 20
BAR_SIZE = '1 day'
DURATION = '60 D'
QUANTITY = 100
POLL_INTERVAL = 60  # 秒


def fetch_bars(ib: IB, contract: Stock) -> pd.DataFrame:
    """拉取日线历史数据，转成 pandas DataFrame 并加均线列。"""
    bars = ib.reqHistoricalData(
        contract,
        endDateTime='',
        durationStr=DURATION,
        barSizeSetting=BAR_SIZE,
        whatToShow='TRADES',
        useRTH=True,
    )
    if not bars:
        raise RuntimeError('未拉到任何 K 线，请检查 TWS 连接与合约')

    df = util_df(bars)
    df[f'ma{FAST_PERIOD}'] = df['close'].rolling(FAST_PERIOD).mean()
    df[f'ma{SLOW_PERIOD}'] = df['close'].rolling(SLOW_PERIOD).mean()
    return df


def util_df(bars):
    """兼容 ib_insync 的 util.df（避免顶层 import 出错时整段失败）。"""
    from ib_insync import util
    return util.df(bars)


def current_signal(df: pd.DataFrame) -> str:
    """
    返回当前信号：
        - 'BUY'   ：金叉
        - 'SELL'  ：死叉
        - 'HOLD'  ：无新信号
    通过比较"昨天"和"今天"的均线相对位置来判断：
    - 昨天 ma5 <= ma20 且今天 ma5 > ma20 → 今天发生金叉 → BUY
    - 昨天 ma5 >= ma20 且今天 ma5 < ma20 → 今天发生死叉 → SELL
    """
    if len(df) < SLOW_PERIOD + 2:
        return 'HOLD'  # 数据还不够

    today = df.iloc[-1]
    yesterday = df.iloc[-2]
    fast_t, slow_t = today[f'ma{FAST_PERIOD}'], today[f'ma{SLOW_PERIOD}']
    fast_y, slow_y = yesterday[f'ma{FAST_PERIOD}'], yesterday[f'ma{SLOW_PERIOD}']

    if pd.isna(fast_t) or pd.isna(slow_t) or pd.isna(fast_y) or pd.isna(slow_y):
        return 'HOLD'

    if fast_y <= slow_y and fast_t > slow_t:
        return 'BUY'
    if fast_y >= slow_y and fast_t < slow_t:
        return 'SELL'
    return 'HOLD'


def current_position(ib: IB, contract: Stock) -> int:
    """查询当前账户在 contract 上的净持仓（正=多，负=空，0=无）。"""
    for pos in ib.positions():
        if pos.contract.conId == contract.conId:
            return int(pos.position)
    return 0


def submit(ib: IB, contract: Stock, action: str, qty: int):
    """下市价单并阻塞等待成交或超时。"""
    order = MarketOrder(action, qty)
    trade = ib.placeOrder(contract, order)
    print(f'[{datetime.now():%H:%M:%S}] 下单 {action} {qty} 股 ...')
    trade.waitUntilFilled(timeout=30)
    status = trade.orderStatus.status
    print(f'    → 状态 {status}，成交均价 {trade.orderStatus.avgFillPrice}')
    return trade


def main():
    ib = IB()
    ib.connect('127.0.0.1', 7497, clientId=1)

    contract = Stock(SYMBOL, EXCHANGE, CURRENCY)
    ib.qualifyContracts(contract)
    print(f'合约已确认：{contract.symbol} (conId={contract.conId})')

    last_signal = 'HOLD'
    while ib.isConnected():
        df = fetch_bars(ib, contract)
        sig = current_signal(df)
        pos = current_position(ib, contract)
        price = df['close'].iloc[-1]
        fast = df[f'ma{FAST_PERIOD}'].iloc[-1]
        slow = df[f'ma{SLOW_PERIOD}'].iloc[-1]
        print(f'[{datetime.now():%H:%M:%S}] price={price:.2f} '
              f'ma{FAST_PERIOD}={fast:.2f} ma{SLOW_PERIOD}={slow:.2f} '
              f'pos={pos} signal={sig}')

        # 仅在信号变化时执行，避免重复下单
        if sig != last_signal and sig in ('BUY', 'SELL'):
            if sig == 'BUY' and pos <= 0:
                submit(ib, contract, 'BUY', QUANTITY)
            elif sig == 'SELL' and pos >= 0:
                # 持有多头则卖出；如做空策略要改为 SELL 时允许 -QUANTITY
                submit(ib, contract, 'SELL', max(pos, QUANTITY))
            last_signal = sig
        elif sig == 'HOLD':
            last_signal = 'HOLD'

        ib.sleep(POLL_INTERVAL)

    print('连接断开，策略退出。')


if __name__ == '__main__':
    main()
```

## 风险提示

- **回测≠实盘**：回测里看不到的滑点、手续费、跳空，实盘都会发生。本策略无手续费模型。
- **金叉/死叉滞后**：信号在均线**已经拐头**之后才发出，趋势末段可能接到最后一棒。
- **无止损**：本示例未实现硬止损，遇到单边下跌会持续亏损。建议配合 ATR 或固定百分比止损。
- **重复下单风险**：示例只在"信号变化"时下单，但实盘前要加 `clientId` 唯一性、防重入锁、日志持久化。
- **盘前盘后噪声**：若用分钟线且 `useRTH=False`，要把开盘/收盘两个时段的尖峰数据清洗掉。

## 改进方向

1. **加 ATR 止损**：买入后以 `entry - 2*ATR` 作为硬止损
2. **趋势过滤**：叠加 200 日均线过滤，只在价格站上 200 日线时才允许做多
3. **仓位管理**：用凯利公式或固定风险百分比（如单笔风险 = 账户 1%）
4. **多标的组合**：跑 10-20 个相关性低的标的，分散单只黑天鹅
5. **事件过滤**：财报日（BlackoutPeriod）跳过当日信号
6. **回测框架**：用 `backtrader` / `vectorbt` 重写同一逻辑做参数扫描和样本外测试
7. **Paper 账户先跑**：用 IBKR Paper Account（默认端口 7497）至少跑 1-3 个月再考虑实盘
