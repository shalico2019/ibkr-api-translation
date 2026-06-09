# 历史数据（Historical Market Data）

> 原文：[TWS API – Historical Market Data](https://interactivebrokers.github.io/tws-api/historical_data.html)
> 翻译：Mavis

通过 API 获取历史数据**和实时行情的订阅要求一样**——必须订阅 Level 1 实时行情。

!!! warning "API 永远要订阅"
    TWS 在没有订阅时，大多数标的能创建"delayed charts"（延迟 10-15 分钟）。
    但 **API 永远需要 Level 1 实时行情订阅**才能返回历史数据，没有"延迟模式"。

!!! info "Smart-routed 历史数据"
    如果某个标的有多个交易所上市，smart-routed 历史数据请求会**要求所有相关交易所都有订阅**。

    比如粉单（OTC）股票在 ARCAEDGE 交易，请求它的历史数据除了常规订阅外，还要订阅 "OTC Global Equities" 或 "Global OTC Equities and OTC Markets" for ARCAEDGE。

---

## 可用的历史数据类型

1. **历史 K 线（Historical Bar Data）**
2. **直方图（Histograms）**
3. **历史逐笔成交（Historical Time and Sales）**

---

## 时间格式变更

TWS 10.17 / TWS API 10.18 起，API 支持更多时间格式：

| 格式 | 含义 | 示例 |
|------|------|------|
| UTC | 标准 UTC 时间 | `20220930-15:00:00` |
| 带时区 | 用交易所/操作员所在时区 | `IBM 20220930-15:00:00 US/Eastern` |

!!! note "时区适用规则"
    - **非 operator 字段**（如行情查询）：用合约所在交易所的时区
    - **operator 字段**（如订单时间条件）：用操作员所在时区

---

## 历史数据的过滤逻辑

IB 的历史数据**会过滤掉远离 NBBO 的成交类型**，包括：

- 组合腿（combo legs）
- 大宗交易（block trades）
- 衍生品交易（derivative trades）

因此：

- 历史数据的**成交量会比实时数据小**（实时是未过滤的）
- 实时和历史的 **VWAP 等字段** 也会不一样——别用实时数据校准历史策略

---

## 实战示例：用 `ib_insync` 拉历史 K 线

```python
from ib_insync import IB, Stock, util

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

# 拉 30 天日 K
bars = ib.reqHistoricalData(
    aapl,
    endDateTime='',         # 空字符串 = 到现在
    durationStr='30 D',
    barSizeSetting='1 day',
    whatToShow='TRADES',    # TRADES / MIDPOINT / BID / ASK 等
    useRTH=True,            # 只用常规交易时段数据
)

df = util.df(bars)  # 转成 pandas DataFrame
print(df.head())
print(f"共 {len(df)} 根 K 线")

ib.disconnect()
```

**常用参数对照**：

| 参数 | 常用值 |
|------|--------|
| `durationStr` | `60 S` / `30 D` / `1 Y` |
| `barSizeSetting` | `1 min` / `5 mins` / `1 hour` / `1 day` |
| `whatToShow` | `TRADES` / `MIDPOINT` / `BID` / `ASK` / `BID_ASK` / `ADJUSTED_LAST` / `HISTORICAL_VOLATILITY` / `OPTION_IMPLIED_VOLATILITY` |
| `useRTH` | `True` 仅常规时段，`False` 含盘前盘后 |

---

## 下一步

- [账户与持仓](account_portfolio.md) —— 看账户余额、保证金、持仓、盈亏
- [错误处理](error_handling.md) —— 各种 error code 含义