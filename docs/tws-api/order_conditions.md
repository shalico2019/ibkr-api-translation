# 订单生效条件（Order Conditioning）

> 原文：[TWS API – Order Conditioning](https://interactivebrokers.github.io/tws-api/order_conditions.html)
> 翻译：Mavis

条件订单允许你**先下达订单**，但只有在**预设条件被满足时**才激活。常见用途：价差触发、风控自动减仓、定时撤单等。

把 `Order.conditions` 列表填充好之后调用 `placeOrder` 即可：

```python
mkt = OrderSamples.MarketOrder("BUY", 100)

# 多个条件会按顺序 AND/OR 组合
mkt.conditions.append(
    OrderSamples.PriceCondition(PriceCondition.TriggerMethodEnum.Default,
                                208813720, "SMART", 600, False, False))
mkt.conditions.append(OrderSamples.ExecutionCondition("EUR.USD", "CASH", "IDEALPRO", True))
mkt.conditions.append(OrderSamples.MarginCondition(30, True, False))
mkt.conditions.append(OrderSamples.PercentageChangeCondition(15.0, 208813720, "SMART", True, True))
mkt.conditions.append(OrderSamples.TimeCondition("20160118 23:59:59 US/Eastern", True, False))
mkt.conditions.append(OrderSamples.VolumeCondition(208813720, "SMART", False, 100, True))

self.placeOrder(self.nextOrderId(), ContractSamples.EuropeanStock(), mkt)
```

!!! tip "反向使用：条件触发时取消"
    把 `Order.conditionsCancelOrder = True`，订单变成"已激活，但条件满足时**自动取消**"——常用于止损/止盈的简单实现：

    ```python
    lmt = OrderSamples.LimitOrder("BUY", 100, 20)
    lmt.conditionsCancelOrder = True
    lmt.conditions.append(
        OrderSamples.PriceCondition(PriceCondition.TriggerMethodEnum.Last,
                                    208813720, "SMART", 600, False, False))
    ```

---

## 支持的条件类型

| 条件 | 类名 | 触发场景 |
|------|------|----------|
| **价格条件** | `PriceCondition` | 某合约价格高于/低于某值 |
| **执行条件** | `ExecutionCondition` | 另一合约已成交 |
| **保证金条件** | `MarginCondition` | 账户保证金超过/低于某百分比 |
| **百分比变化条件** | `PercentChangeCondition` | 相对昨日收盘价涨/跌超 X% |
| **时间条件** | `TimeCondition` | 到了指定时间之后/之前 |
| **成交量条件** | `VolumeCondition` | 某合约成交量超过/低于某值 |

### 价格条件（PriceCondition）

```python
priceCondition = order_condition.Create(OrderCondition.Price)
priceCondition.conId = 208813720          # 监控的标的
priceCondition.exchange = "SMART"         # 监控的交易所
priceCondition.isMore = True              # True=高于触发，False=低于触发
priceCondition.triggerMethod = PriceCondition.TriggerMethodEnum.Default
priceCondition.price = 600.0              # 触发价
priceCondition.isConjunctionConnection = True  # 与下一个条件 AND(True)/OR(False)
```

### 执行条件（ExecutionCondition）

```python
execCondition = order_condition.Create(OrderCondition.Execution)
execCondition.symbol = "EUR.USD"
execCondition.exchange = "IDEALPRO"
execCondition.secType = "CASH"
execCondition.isConjunctionConnection = True
```

### 保证金条件（MarginCondition）

```python
marginCondition = order_condition.Create(OrderCondition.Margin)
marginCondition.percent = 30       # 百分比阈值
marginCondition.isMore = True      # True=高于阈值触发
marginCondition.isConjunctionConnection = True
```

### 百分比变化条件（PercentChangeCondition）

```python
pctChangeCondition = order_condition.Create(OrderCondition.PercentChange)
pctChangeCondition.isMore = True
pctChangeCondition.changePercent = 15.0   # 涨/跌幅度
pctChangeCondition.conId = 208813720
pctChangeCondition.exchange = "SMART"
pctChangeCondition.isConjunctionConnection = True
```

### 时间条件（TimeCondition）

```python
timeCondition = order_condition.Create(OrderCondition.Time)
timeCondition.isMore = True
timeCondition.time = "20260118 23:59:59 US/Eastern"  # 时区可加可不加
timeCondition.isConjunctionConnection = True
```

### 成交量条件（VolumeCondition）

```python
volCond = order_condition.Create(OrderCondition.Volume)
volCond.conId = 208813720
volCond.exchange = "SMART"
volCond.isMore = True     # 高于/低于
volCond.volume = 100      # 阈值
volCond.isConjunctionConnection = True
```

---

## 实战示例：用 `ib_insync` 设置价差触发买单

```python
from ib_insync import IB, Stock, MarketOrder
from ib_insync.order_condition import PriceCondition

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

order = MarketOrder('BUY', 100)
order.conditions.append(
    PriceCondition(conId=aapl.conId, exchange='SMART',
                   isMore=False, price=150.0)  # AAPL 跌到 150 触发
)

trade = ib.placeOrder(aapl, order)
ib.sleep(60)
print(f"订单状态：{trade.orderStatus.status}")
ib.disconnect()
```

---

## 下一步

- [订单类型详解](order_types.md) —— MKT / LMT / STP / STP LMT / TRAIL 等各种订单类型
- [错误处理](error_handling.md) —— 条件没触发、订单异常等