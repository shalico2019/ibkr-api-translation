# 账户与持仓（Account Summary）

> 原文：[TWS API – Account Summary](https://interactivebrokers.github.io/tws-api/account_summary.html)
> 翻译：Mavis

TWS API 提供两种账户数据查询方式：

1. **`reqAccountSummary`** —— 订阅式，按指定 tag 列表推送（3 分钟更新一次）
2. **`reqAccountUpdates`** —— 全量推送账户和持仓变化

本章讲 `reqAccountSummary`，因为它更适合**多账户结构**和**只关心特定字段**的场景。

!!! warning "限制"
    - **Introducing broker（IBroker）账户**：超过 50 个子账户或开启 on-demand account lookup 的，**不能用 `group="All"`**。
    - **TWS 983+**：group 字段也接受 profile 名（不是只有 group 名）。详见 [Unification of Groups and Profiles](https://ibkr.com/campus)。

!!! danger "同时只能有 2 个活跃订阅"
    同时只能有 **2 个** `reqAccountSummary` 订阅处于活跃状态。超过会报错。

---

## 请求方式

调用 `reqAccountSummary(reqId, group, tags)`：

- **`reqId`**：客户端自定义的请求 ID
- **`group`**：`"All"` 或具体 group 名
- **`tags`**：要订阅的 tag 列表，逗号分隔

??? example "订阅所有常见 tag"

    === "Python"

        ```python
        self.reqAccountSummary(9001, "All", AccountSummaryTags.AllTags)
        ```

    === "Java"

        ```java
        client.reqAccountSummary(9001, "All",
            "AccountType,NetLiquidation,TotalCashValue,SettledCash,AccruedCash," +
            "BuyingPower,EquityWithLoanValue,PreviousEquityWithLoanValue," +
            "GrossPositionValue,ReqTEquity,ReqTMargin,SMA," +
            "InitMarginReq,MaintMarginReq,AvailableFunds,ExcessLiquidity,Cushion," +
            "FullInitMarginReq,FullMaintMarginReq,FullAvailableFunds,FullExcessLiquidity," +
            "LookAheadNextChange,LookAheadInitMarginReq,LookAheadMaintMarginReq," +
            "LookAheadAvailableFunds,LookAheadExcessLiquidity," +
            "HighestSeverity,DayTradesRemaining,Leverage");
        ```

首次调用会立即返回所有 tag 的当前值，之后每 **3 分钟**推送一次变化的字段（这个频率和 TWS Account Window 一致，**不能改**）。

---

## LEDGER tag（TWS Build 956+）

TWS 956+ / IB Gateway 956+ 支持用 `$LEDGER` 系列 tag 按币种查询：

| Tag | 含义 |
|-----|------|
| `$LEDGER` | 仅返回 **BASE CURRENCY（基础币种）** 数据 |
| `$LEDGER:USD` | 仅返回 USD 数据（CashBalance / TotalCashBalance 严格按 USD） |
| `$LEDGER:EUR` | 仅返回 EUR 数据 |
| `$LEDGER:ALL` | 所有账户所有币种数据合计 |

??? example "按币种查询"

    === "Python"

        ```python
        self.reqAccountSummary(9003, "All", "$LEDGER:EUR")
        ```

    === "Java"

        ```java
        client.reqAccountSummary(9003, "All", "$LEDGER:EUR");
        ```

---

## 接收回调

实现 `EWrapper.accountSummary` 和 `EWrapper.accountSummaryEnd` 接收数据：

??? example "accountSummary 回调"

    === "Python"

        ```python
        def accountSummary(self, reqId, account, tag, value, currency):
            print(f"ReqId={reqId} Acct={account} Tag={tag} "
                  f"Value={value} Currency={currency}")

        def accountSummaryEnd(self, reqId):
            print(f"AccountSummaryEnd. ReqId={reqId}")
        ```

---

## 取消订阅

不需要时调用 `cancelAccountSummary(reqId)` 取消：

```python
self.cancelAccountSummary(9001)
self.cancelAccountSummary(9002)
self.cancelAccountSummary(9003)
self.cancelAccountSummary(9004)
```

---

## 实战示例：用 `ib_insync` 拿账户汇总

```python
from ib_insync import IB

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

# 订阅账户汇总
summary = ib.accountSummary()
ib.sleep(3)  # 等首推

for item in summary:
    print(f"{item.tag}: {item.value} {item.currency}")

ib.disconnect()
```

输出示例：

```
AccountType: INDIVIDUAL USD
NetLiquidation: 102345.67 USD
TotalCashValue: 50000.00 USD
BuyingPower: 200000.00 USD
...
```

---

## 下一步

- [市场数据](market_data.md) —— 拿实时行情
- [下单](orders.md) —— 下单 + 监听状态