# 订单类型详解（Available Orders）

> 原文：[TWS API – Available Orders](https://interactivebrokers.github.io/tws-api/available_orders.html)
> 翻译：Mavis

TWS API 支持 TWS 界面里**绝大多数**订单类型。本章按"基本单 / 高级单和算法单"两大类列出。

## 基本订单（Basic Orders）

TWS API 支持的全部基础订单类型如下。每种订单类型都通过设置 `Order.orderType` 字段，再配合 `Order.lmtPrice`、`Order.auxPrice` 等字段来定义。

| OrderType | 含义 | 必填字段 |
|-----------|------|----------|
| `MKT` | 市价单 | - |
| `LMT` | 限价单 | `lmtPrice` |
| `STP` | 止损单 | `auxPrice` |
| `STP LMT` | 止损限价单 | `auxPrice`（止损价）、`lmtPrice`（限价） |
| `REL` | 相对单 | `auxPrice`、`lmtPrice`（可选） |
| `TRAIL` | 跟踪止损单 | `auxPrice`（跟踪金额） |
| `TRAIL LIMIT` | 跟踪止损限价单 | `auxPrice`、`lmtPrice` |
| `TRAIL MIT` | 跟踪止损市价单（MIT = Market If Touched） | `auxPrice` |
| `MIT` | 市价触发单 | `auxPrice` |
| `MOC` | 收盘市价单（Market on Close） | - |
| `LOC` | 收盘限价单（Limit on Close） | `lmtPrice` |
| `MOO` | 开盘市价单（Market on Open） | - |
| `LOO` | 开盘限价单（Limit on Open） | `lmtPrice` |
| `AON` | 全部成交否则撤销（All-or-None） | 配合 `lmtPrice` 等 |
| `IOC` | 立即成交否则撤销（Immediate-or-Cancel） | 配合其它类型 |
| `GTC` | 撤销前有效（Good-Till-Cancel） | 通过 `tif` 字段 |
| `DAY` | 当日有效 | `tif = "DAY"` |
| `GTD` | 到期前有效 | `tif = "GTD"` + `goodTillDate` |

!!! note "时间条件 (Time in Force)"
    通过 `Order.tif` 字段控制订单在交易所内的有效时间：`DAY` / `GTC` / `GTD` / `IOC` / `FOK` / `DTP` 等。

### 经典示例：限价买单 100 股 AAPL @ 150

=== "Python"

    ```python
    from ib_insync import LimitOrder
    order = LimitOrder('BUY', 100, 150.0)
    ```

### 经典示例：跟踪止损单

```python
from ib_insync import Order

order = Order()
order.action = 'SELL'
order.totalQuantity = 100
order.orderType = 'TRAIL'
order.auxPrice = 5.0   # 跟踪 5 美元（高点回落 5 美元触发）
```

---

## 高级订单与算法（Advanced Orders and Algos）

TWS API 同样支持 TWS 里所有高级订单类型。常见的：

| 类型 | OrderType | 关键字段 |
|------|-----------|----------|
| **Adaptive 限价单** | `LMT` | `Order.adaptivePriority` |
| **Adaptive 止损单** | `STP` | `Order.adaptivePriority` |
| **Bracket 括号单** | `STP` + `LMT` × 2 | 用 `Order.parentId` 串联 |
| **Hedging 对冲单** | `LMT` 等 | `Order.parentId`、`hedgeType`、`hedgeParam` |
| **VWAP 算法** | `VWAP` | `Order.algoStrategy = "VWAP"` + `algoParams` |
| **TWAP 算法** | `TWAP` | `Order.algoStrategy = "TWAP"` + `algoParams` |
| **POV 算法**（Percent of Volume） | `POV` | `Order.algoStrategy = "POV"` + `algoParams` |
| **Iceberg 冰山单** | `LMT` 等 | `Order.displaySize` |
| **Discretionary 自主定价** | `LMT` | `Order.discretionaryAmt` |
| **Sniper 狙击手** | `LMT` | `Order.solverParams` |
| **Pegged-to-Benchmark** | `PEG BENCH` | `Order.startingBenchmark`、`Order.benchmarkDelta` |
| **Pegged-to-Midpoint** | `PEG MID` | - |
| **Pegged-to-Market** | `PEG MKT` | `Order.marketOffset` |
| **Combo / Spread** | `LMT` 等 | 用 `Contract.comboLegs` 定义 leg |
| **Scale** | `LMT` 等 | `Order.scaleInitLevelSize`、`Order.scaleSubsLevelSize`、`Order.scalePriceIncrement` |

### Bracket Orders 括号订单

**经典用法**：以一个**父单 + 一个止损 + 一个止盈**构成完整风控结构。

```python
from ib_insync import IB, Stock, LimitOrder, StopOrder

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)
aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

# 1. 父单：限价买入
parent = LimitOrder('BUY', 100, 150.0)
parent.transmit = False
parent_trade = ib.placeOrder(aapl, parent)

# 2. 止损子单（父单成交后激活）
stop = StopOrder('SELL', 100, 145.0)
stop.parentId = parent_trade.order.orderId
stop.transmit = False
stop_trade = ib.placeOrder(aapl, stop)

# 3. 止盈子单（最后 transmit=True 才真正激活整组）
take = LimitOrder('SELL', 100, 160.0)
take.parentId = parent_trade.order.orderId
take.transmit = True  # 最后一条 transmit=True 才把整组送出去
take_trade = ib.placeOrder(aapl, take)

ib.sleep(60)
```

!!! warning "关键时序"
    **前 N-1 条订单 `transmit=False`**，**最后一条 `transmit=True`**。否则父单还没成交，子单就先被激活并可能被立即执行。

### VWAP 算法单

```python
from ib_insync import IB, Stock, Order

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)
aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

order = Order()
order.action = 'BUY'
order.totalQuantity = 1000
order.orderType = 'MKT'
order.algoStrategy = 'VWAP'
order.algoParams = [
    ('startTime', '20260101 09:30:00 US/Eastern'),
    ('endTime',   '20260101 16:00:00 US/Eastern'),
    ('allowPastEndTime', 0),
    ('noTakeLiq', 0),
]

trade = ib.placeOrder(aapl, order)
ib.disconnect()
```

---

## 下一步

- [订单生效条件](order_conditions.md) —— 价格/时间/成交量等触发条件
- [市场数据](market_data.md) —— 下单前先拿行情