# 下单（Placing Orders）

> 原文：[TWS API – Placing Orders](https://interactivebrokers.github.io/tws-api/order_submission.html)
> 翻译：Mavis

## 下一个有效 Order ID（Next Valid Identifier）

成功连接 TWS 之后收到的最重要的事件是 **`nextValidId`**。这个事件也在调用 `reqIds` 之后触发。顾名思义，它给你**下一个可用的 order ID**——就是一个递增序列号。

- **单一客户端**：可以直接把上一次收到的 ID 加 1 当作下一个，不用每次都请求。比如首次 ID 是 1，下一个就是 2、3、4...
- **多个客户端连同一账户**：必须使用一个**比所有已知 order ID 都大**的新 ID。包括 `openOrder` 和 `orderStatus` 回调里返回的、其它客户端产生的订单 ID。
- **Master 客户端**：会自动收到其它客户端下单的状态和成交回调，必须保证 `placeOrder` 用到的 ID 大于这些回调里出现过的 ID。
- **调用了 `reqAllOpenOrders`**：后续下的单 ID 必须大于这次调用返回的所有订单的 ID。

如果你搞乱了 ID 序列，可以随时调用 **`reqIds(-1)`** 重新请求下一个合法 ID：

??? example "reqIds 调用示例"

    === "Python"

        ```python
        self.reqIds(-1)  # 参数被忽略，写啥都行
        ```

    === "Java"

        ```java
        client.reqIds(-1);
        ```

    === "C++"

        ```cpp
        m_pClient->reqIds(-1);
        ```

调完之后会触发 `EWrapper.nextValidId(orderId)` 回调：

??? example "nextValidId 回调"

    === "Python"

        ```python
        def nextValidId(self, orderId: int):
            self.nextValidOrderId = orderId
            print("NextValidId:", orderId)
        ```

    === "Java"

        ```java
        @Override
        public void nextValidId(int orderId) {
            System.out.println("NextValidId: " + orderId);
            currentOrderId = orderId;
        }
        ```

!!! info "Order ID 持久化"
    Next Valid ID 在 **TWS 会话之间持久保存**。如果你想重置，需要在 API Settings 对话框里操作——但**只有没有任何活跃 API 订单时**才能重置。

---

## 下单

下单通过 `EClient.placeOrder` 方法。注意下面代码里 **`nextOrderId++`** 自动递增的写法：

??? example "placeOrder 调用示例"

    === "Python"

        ```python
        self.simplePlaceOid = self.nextOrderId()
        self.placeOrder(self.simplePlaceOid, ContractSamples.USStock(),
                        OrderSamples.LimitOrder("SELL", 1, 50))
        ```

    === "Java"

        ```java
        client.placeOrder(nextOrderId++, ContractSamples.USStock(),
                          OrderSamples.LimitOrder("SELL", Decimal.ONE, 50));
        ```

    === "C#"

        ```csharp
        client.placeOrder(nextOrderId++, ContractSamples.USStock(),
                          OrderSamples.TrailingStopLimit("BUY", 1, 5, 5, 110));
        ```

    === "C++"

        ```cpp
        m_pClient->placeOrder(m_orderId++, ContractSamples::USStock(),
                              OrderSamples::LimitOrder("SELL",
                                  DecimalFunctions::stringToDecimal("1"), 50));
        ```

下单成功后，TWS 会立即开始通过 `openOrder` 和 `orderStatus` 回调推送订单状态变化。

!!! tip "Advisor 分配订单"
    Advisor 执行 allocation 订单时，会收到分配订单本身的成交明细和佣金。要拿到具体子账户的分配明细和佣金，需要调用 `reqExecutions`。

### Transmit 标志（暂存订单）

把 `Order.Transmit` 设为 `False`，订单会**发送到 TWS 但不提交到 IB 服务器**：

- 只在当前 TWS 会话里有效（其它用户看不到）
- TWS 重启后会被清掉
- 可以从 API 取消或提交（transmit）
- 在"暂存"状态下不能查看

### 高级订单拒绝（Advanced Order Rejection）

TWS 10.14+ 引入了两个新字段处理高级订单被拒：

| 字段 | 方向 | 作用 |
|------|------|------|
| `Order.advancedErrorOverride` | API → IB | 逗号分隔的 error tag 列表，**跳过**这些错误继续下单 |
| `EWrapper.error.advancedOrderRejectJson` | IB → API | 订单被拒的 JSON 描述，可以从中提取 tag 加到 `advancedErrorOverride` |

后端拒绝消息会带 FIX Tag `8230`，例如 `8229=IBDBUYTX` 可以原样填到 `advancedErrorOverride` 字段：

```
8229=IBDBUYTX,MOBILEPH
```

!!! note "新 API Setting"
    TWS 设置里新增了 "Show advanced order reject in UI always"——勾上后，被拒信息只显示在 TWS UI，不再推送到 API。

---

## `openOrder` 回调

`EWrapper.openOrder(orderId, contract, order, orderState)` 推送系统中的活跃订单。

如果 `placeOrder` 时把 `Order.WhatIf` 设为 `True`，`orderState` 里会返回**预估的保证金和佣金**（用于模拟试算），详见 [Account Summary](account_portfolio.md)。

??? example "openOrder 回调示例"

    === "Python"

        ```python
        def openOrder(self, orderId, contract, order, orderState):
            print("OpenOrder. OrderId:", orderId,
                  "Symbol:", contract.symbol, "SecType:", contract.secType,
                  "Action:", order.action, "OrderType:", order.orderType,
                  "TotalQty:", order.totalQuantity, "LmtPrice:", order.lmtPrice,
                  "AuxPrice:", order.auxPrice, "Status:", orderState.status)
            order.contract = contract
            self.permId2ord[order.permId] = order
        ```

---

## `orderStatus` 回调

`EWrapper.orderStatus` 推送订单执行层面的所有状态变化：成交数量、未成交数量、成交均价等。

参数说明：

| 参数 | 含义 |
|------|------|
| orderId | 订单 ID |
| status | 状态（见下表） |
| filled | 已成交数量 |
| remaining | 未成交数量 |
| avgFillPrice | 成交均价 |
| permId | TWS 分配的永久 ID（重启后不变） |
| parentId | 父订单 ID（附加订单时用） |
| lastFillPrice | 最近一次成交价 |
| clientId | 下单客户端 ID |
| whyHeld | 被挂起的原因（"locate"等待等） |
| mktCapPrice | 价格上限（API v973.04+） |

### 可能的订单状态

| Status | 含义 |
|--------|------|
| `ApiPending` | 订单还没发给 IB 服务器（例如在等证券定义）。**很少收到** |
| `PendingSubmit` | 已从 TWS 发出，但还没收到目的地的确认（多为交易所休市） |
| `PendingCancel` | 已发出取消请求，但还没收到取消确认 |
| `PreSubmitted` | 模拟单已被 IB 系统接受，等触发条件满足后转发到交易所 |
| `Submitted` | 订单已被目的地接受，工作正常 |
| `ApiCancelled` | 订单已提交但还没被确认时，API 请求取消，会产生这个状态 |
| `Cancelled` | 订单余额已被 IB 系统确认取消（也可能因被拒而意外触发） |
| `Filled` | 订单全部成交 |
| `Inactive` | 订单不工作。可能原因：触发错误、做空时在 locate 等待、休市时人工下单、被 TWS 阻止（如未提交的暂存状态） |

### 谁会收到 orderStatus 回调

| 客户端 | 收到的回调 |
|--------|------------|
| 下单的客户端 | 自己订单的状态变化 |
| Master Client ID | **所有**客户端的订单状态 |
| Client ID 0 | 自己的 + TWS 界面人工下的订单 |

!!! warning "重复和缺失回调"
    - **可能有重复的 orderStatus**：同一条状态可能从 TWS、IB 服务器、交易所多次发出
    - **market order 可能没回调**：市价单如果立即成交，常常不会有任何 orderStatus 回调
    - **最佳实践**：除了 `orderStatus`，**还要监听 `execDetails`**

!!! info "API v973.04+ 新字段"
    `orderStatus` 多了 `mktCapPrice` 字段。如果订单触发了价格上限（price cap），这里会显示上限价。

---

## 附加订单（Attaching Orders）

Bracket（括号）、Hedging（对冲）等高级订单类型，都是把**子订单附加到父订单**上。

实现方式：把**子订单的 `Order.ParentId`** 设为**父订单的 `Order.OrderId`**。

父订单完全成交后，子订单会自动激活。在父订单成交前，子订单一直处于 `on hold` 状态。

!!! danger "关键提醒"
    **附加订单时务必用 `Transmit` 标志**——把每条附加订单的 transmit 设为 `False`，只在**最后一条**设为 `True`，可以避免"父订单还没成交、子订单先被送出去"的意外执行。详见 [Available Orders / Bracket Orders](order_types.md#bracket-orders)。

---

## 实战示例：用 `ib_insync` 下单

`ib_insync` 把 placeOrder / orderStatus / openOrder 这些回调包装成更顺手的写法：

```python
from ib_insync import IB, Stock, MarketOrder, LimitOrder

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)  # 补全 conId 等字段

# 市价买单 100 股
market_order = MarketOrder('BUY', 100)
trade = ib.placeOrder(aapl, market_order)

# 阻塞等待成交
trade.waitUntilFilled(timeout=30)
print(f"成交均价：{trade.orderStatus.avgFillPrice}, 成交量：{trade.orderStatus.filled}")
```

`ib_insync` 提供的便利：

- `trade` 对象 = 一组 `order` + `orderStatus` + `fills` + `log`，所有信息聚合在一个对象上
- `waitUntilFilled` / `waitUntilTraded` / `waitUntilCancelled` 等异步等待方法
- 自动管理 order ID（你不用手动 ++）

---

## 下一步

- [订单类型详解](order_types.md) —— MKT / LMT / STP / STP LMT / TRAIL 等各种订单类型
- [订单生效条件](order_conditions.md) —— 价格条件、时间条件等
- [市场数据](market_data.md) —— 拿实时行情