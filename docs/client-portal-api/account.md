# 账户（Account）

> **英文原文**：[Endpoints Explorer → Account](https://interactivebrokers.github.io/cpwebapi/endpoints)（搜索 Account / PortfolioAnalyst 分组）+ [Use Cases → Account Data & Reports](https://interactivebrokers.github.io/cpwebapi/use-cases)
> **翻译版本**：v1
> **译者**：@shalico2019

## 概述

Client Portal API 中"账户"分组负责两件事：

1. **列出/切换可用账户** —— `/iserver/accounts`、`/iserver/account`。
2. **账户级 PnL（Profit and Loss，盈亏）** —— `/iserver/account/pnl/partitioned`。
3. **PortfolioAnalyst 报表**（绩效、交易历史） —— `/pa/performance`、`/pa/transactions`。

> ⚠️ **重要前提**：在调用任何 `/iserver/...` 接口之前，必须先调用 `POST /iserver/auth/status` 确认已认证；多数接口还要求先调用 `POST /iserver/account` 切换到目标账户。详细流程见 [Session](./session.md)。

下面分别介绍每个端点。

## 1. `GET /iserver/accounts` — 列出可用 Brokerage 账户

**作用**：返回当前登录用户的所有 IBKR 账户（含模拟盘 `DU*` 和真实账户）。

```python
import requests
BASE = "https://localhost:5000/v1/api"

resp = requests.get(f"{BASE}/iserver/accounts", verify=False, timeout=5)
resp.raise_for_status()
for acct in resp.json():
    print(acct["accountId"], acct["accountStatus"], acct["accountTitle"])
```

典型响应：

```json
[
  {
    "accountId": "DU1234567",
    "accountStatus": "DUPLICATE",   /* 仅供示意，真实值见官方文档 */
    "currency": "USD",
    "type": "DEMO",
    "tradingCapabilities": {
      "stock": true,
      "options": true,
      "futures": false
    }
  },
  {
    "accountId": "U1234567",
    "type": "LIVE",
    ...
  }
]
```

字段说明：

| 字段 | 含义 |
| --- | --- |
| `accountId` | 账户唯一标识，后续 `/portfolio/{accountId}/...`、`/iserver/account/{accountId}/orders` 都会用到 |
| `type` | `LIVE`（真实）或 `DEMO`（模拟盘） |
| `accountStatus` | 账户状态码（如 `MIGRATED` 等） |
| `tradingCapabilities` | 是否允许股票 / 期权 / 期货等 |

> 注意：账户 ID 在 IBKR 文档中常被称为 **conid（Contract Identifier，合约标识符）** 的"账户级版本"。下单时如果传错 `accountId` 会立刻返回 4xx。

## 2. `POST /iserver/account` — 切换活动账户

**作用**：当用户有多个账户时，**同一时间只能有一个处于"active"状态**。调用此接口会把后续所有 `/iserver/...` 的请求路由到指定账户。

```python
import requests
BASE = "https://localhost:5000/v1/api"

resp = requests.post(
    f"{BASE}/iserver/account",
    params={"acctId": "DU1234567"},
    verify=False,
    timeout=5,
)
print(resp.status_code, resp.json())
```

不需要请求体。响应通常为空对象 `{}`。

> **常见错误码**：
>
> - `400 Bad Request` —— `acctId` 不属于当前用户，或拼写错误。
> - `503 Service Unavailable` —— Gateway 正在初始化账户缓存，等 1-2 秒重试。

## 3. `GET /iserver/account/pnl/partitioned` — 按账户分组的当日 PnL

**作用**：返回**当日**（session 范围内累计）的 PnL，按账户 ID 分组。多数策略日报里"今日盈亏"这一列就是它。

```python
import requests
BASE = "https://localhost:5000/v1/api"

resp = requests.get(
    f"{BASE}/iserver/account/pnl/partitioned",
    verify=False,
    timeout=5,
)
resp.raise_for_status()
print(resp.json())
```

典型响应：

```json
{
  "DU1234567": {
    "dailyPnL": 1234.56,
    "unrealizedPnL": 789.0,
    "realizedPnL": 445.56,
    "excluded": false
  },
  "U7654321": {
    "dailyPnL": -50.25,
    "unrealizedPnL": 0.0,
    "realizedPnL": -50.25,
    "excluded": false
  }
}
```

字段含义：

| 字段 | 含义 |
| --- | --- |
| `dailyPnL` | 当日盈亏（含未实现） |
| `unrealizedPnL` | 当前持仓的浮动盈亏 |
| `realizedPnL` | 当日已平仓盈亏 |
| `excluded` | `true` 表示该账户已被排除在统计之外 |

> **限频**：`/iserver/account/pnl/partitioned` 是 **1 req/5 secs**，轮询时请务必加 sleep。
> **常见错误码**：
>
> - `503 Service Unavailable` —— 账户尚未切换，先调 `/iserver/account`。

## 4. `POST /pa/performance` — PortfolioAnalyst 绩效报表

**作用**：通过 PortfolioAnalyst 拉取账户在某段时间范围内的**绩效快照**（NAV 曲线、总收益率、CAGR、最大回撤等）。

请求体示例：

```python
import requests
BASE = "https://localhost:5000/v1/api"

payload = {
    "acctIds": ["DU1234567"],
    "frequency": "D",        # D / W / M / Q / Y
    "start": "2025-01-01",
    "end":   "2025-06-01",
    "currency": "USD",
}

r = requests.post(f"{BASE}/pa/performance",
                  json=payload, verify=False, timeout=15)
print(r.json())
```

字段含义：

| 字段 | 说明 |
| --- | --- |
| `acctIds` | 数组，账户 ID 列表 |
| `frequency` | 取样频率：`D`=日、`W`=周、`M`=月、`Q`=季、`Y`=年 |
| `start` / `end` | ISO 日期 `YYYY-MM-DD` |
| `currency` | 输出货币 |

返回结构形如：

```json
{
  "total": {
    "nav": 125000.0,
    "twr": 0.0735,
    "mtm": 8500.0,
    "id": "DU1234567"
  },
  "snap": [
    { "date": "2025-01-01", "nav": 100000.0 },
    { "date": "2025-01-02", "nav": 100500.0 }
  ],
  "rcrd": { "start": "2025-01-01", "end": "2025-06-01", "baseCurrency": "USD" }
}
```

> ⚠️ **限频**：`/pa/performance` 是 **1 req/15 mins**，远超此频率会触发 IP 惩罚。
>
> ⚠️ **文档站提醒**：`/pa/...` 在 deprecated 文档中的字段命名在不同版本间略有差异（如 `rcrd` / `record`），实际业务请以新版 IBKR Campus 文档或 Gateway 实际响应为准。

## 5. `POST /pa/transactions` — 持仓交易历史

**作用**：拉取某个 **conid**（合约 ID）在一段时间内的成交记录，常用于做"为什么这个持仓是这个数字"对账。

请求体示例：

```python
import requests
BASE = "https://localhost:5000/v1/api"

payload = {
    "acctIds": ["DU1234567"],
    "conid":   265598,                 # AAPL 的 conid 仅作示意
    "currency": "USD",
    "days": 30,                        # 也可用 start/end
}

r = requests.post(f"{BASE}/pa/transactions",
                  json=payload, verify=False, timeout=15)
print(r.json())
```

返回示例：

```json
{
  "rcrd": {
    "contractDescription": "AAPL",
    "assetCategory": "STK",
    "currency": "USD"
  },
  "trades": [
    { "tradeID": "...", "tradeDate": "2025-05-10", "quantity": 10, "tradePrice": 178.50 },
    { "tradeID": "...", "tradeDate": "2025-05-15", "quantity": -10, "tradePrice": 180.20 }
  ]
}
```

> **限频**：同样是 **1 req/15 mins**。如果需要批量拉多个 conid，请间隔调用或合并日期范围。
>
> **常见错误码**：
>
> - `400 Bad Request` —— `conid` 非法或未订阅行情。
> - `404 Not Found` —— 该账户在指定时间无成交。

## 6. 账户相关端点速查表

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| GET | `/iserver/accounts` | 列出 brokerage 账户 | 默认 10 req/s |
| POST | `/iserver/account?acctId=` | 切换活动账户 | 默认 |
| GET | `/iserver/account/pnl/partitioned` | 当日 PnL（按账户分组） | **1 req/5 secs** |
| POST | `/pa/performance` | 绩效报表（NAV/TWR） | **1 req/15 mins** |
| POST | `/pa/transactions` | 单 conid 交易历史 | **1 req/15 mins** |

## 与 TWS API 的差异

| 维度 | Client Portal API Account | TWS API Account |
| --- | --- | --- |
| 账户切换 | 必须显式 `POST /iserver/account` | 通过 `clientId` + EWrapper 回调区分 |
| 账户元数据 | `accountId`, `type`, `tradingCapabilities` | 通过 `reqAccountSummary()` 拉取，多个 tag（`NetLiquidation`, `AvailableFunds` …） |
| PnL | `/iserver/account/pnl/partitioned` | 通过 `reqPnL()` + `reqPnLSingle()` 订阅实时 PnL |
| 历史绩效 | `/pa/performance` | 没有内置等价接口；需用 Flex Query（另一套独立 API） |
| 历史交易 | `/pa/transactions` | `reqExecutions()` + ExecutionFilter |

> **常见迁移坑**：TWS API 里大量 `updateAccountValue(tag, value, currency)` 回调，到了 Client Portal API 是"一次性拉取"——这是同步请求 vs 异步订阅的范式差异，业务逻辑里要相应改写。

## 常见错误码

| HTTP Code | 含义 | 建议处理 |
| --- | --- | --- |
| `400 Bad Request` | 请求体含换行 / `acctId` 拼错 | 清理 JSON、检查路径参数 |
| `401 Unauthorized` | session 失效 | 重新 `/iserver/reauthenticate` |
| `404 Not Found` | 账户不存在或 conid 错误 | 用 `/iserver/accounts` 重新拉取 |
| `429 Too Many Requests` | 触发限频 | 严格按限频表 sleep |
| `503 Service Unavailable` | Gateway 正在切换账户或重启 | 等待 1-2 秒重试 |

## 下一节

- [持仓（Portfolio）](./portfolio.md) — 拉取每个账户的持仓、汇总、分配。

---

## 参考链接

- [Endpoints Explorer](https://interactivebrokers.github.io/cpwebapi/endpoints)
- [Use Cases → Account Data & Reports](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [PortfolioAnalyst 官方说明](https://www.interactivebrokers.com/en/software/portfolioanalyst.htm)
- [Session](./session.md)
- [持仓](./portfolio.md)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 |