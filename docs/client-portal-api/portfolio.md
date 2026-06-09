# 持仓（Portfolio）

> **英文原文**：[Endpoints Explorer → Portfolio](https://interactivebrokers.github.io/cpwebapi/endpoints) + [Use Cases → Portfolio discrepancies](https://interactivebrokers.github.io/cpwebapi/use-cases)
> **翻译版本**：v1
> **译者**：@shalico2019

## 概述

Client Portal API 中"持仓（Portfolio）"分组面向**组合层面**的查询，回答"我这个账户现在有什么、赚了/亏了多少、风险敞口如何"。它和 [账户（Account）](./account.md) 的 `/iserver/...` 端点有功能重叠，但分工很清晰：

- **Account（`/iserver/...`）**：账户级 PnL、当日盈亏、账户切换。
- **Portfolio（`/portfolio/...`）**：详细持仓、分页、分配、汇总、台账（Ledger）。

| 端点 | 方法 | 用途 |
| --- | --- | --- |
| `/portfolio/accounts` | GET | 列出所有 portfolio 账户 |
| `/portfolio/subaccounts` | GET | 列出子账户（Financial Advisor 结构） |
| `/portfolio/subaccounts2` | GET | 子账户（大账户优化版） |
| `/portfolio/{accountId}/meta` | GET | 账户基础元数据 |
| `/portfolio/{accountId}/allocation` | GET | 单账户资产分配 |
| `/portfolio/allocation` | POST | 多账户资产分配 |
| `/portfolio/{accountId}/positions/{pageId}` | GET | 分页持仓列表 |
| `/portfolio/{accountId}/position/{conid}` | GET | 单 conid 持仓 |
| `/portfolio/positions/{conid}` | GET | 跨账户某 conid 的持仓 |
| `/portfolio/{accountId}/positions/invalidate` | POST | 清空后端缓存 |
| `/portfolio/{accountId}/summary` | GET | 账户汇总（NAV / 现金 / 保证金） |
| `/portfolio/{accountId}/ledger` | GET | 台账（出入金 / 利息 / 费用） |

## 1. `GET /portfolio/accounts` — 列出所有组合账户

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/accounts", verify=False, timeout=5)
print(r.json())
```

典型响应：

```json
["DU1234567", "U7654321"]
```

只返回账户 ID 数组。如果想看账户元数据（类型、币种等），请用上一节的 [GET /iserver/accounts](./account.md)。

> **限频**：`/portfolio/accounts` 是 **1 req/5 secs**。

## 2. `GET /portfolio/subaccounts` 与 `/portfolio/subaccounts2`

**FA（Financial Advisor，财务顾问）账户结构** 会有多级子账户。`/subaccounts` 返回的是普通结构，`/subaccounts2` 在账户持有数量极多时性能更好。

```python
import requests
BASE = "https://localhost:5000/v1/api"

# 普通子账户
r1 = requests.get(f"{BASE}/portfolio/subaccounts", verify=False, timeout=5)
print(r1.json())

# 大账户优化版
r2 = requests.get(f"{BASE}/portfolio/subaccounts2", verify=False, timeout=5)
print(r2.json())
```

返回示例（`/subaccounts`）：

```json
[
  {
    "accountId": "DU1234567",
    "currency": "USD",
    "name": "Demo Sub-Account",
    "subAccounts": [
      { "accountId": "DU1111111", "currency": "USD" },
      { "accountId": "DU2222222", "currency": "USD" }
    ]
  }
]
```

> 限频：`/portfolio/subaccounts` **1 req/5 secs**。

## 3. `GET /portfolio/{accountId}/meta` — 账户元数据

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/DU1234567/meta", verify=False, timeout=5)
print(r.json())
```

返回形如：

```json
{
  "accountId": "DU1234567",
  "currency": "USD",
  "name": "Primary",
  "type": "DEMO",
  "tradingCapabilities": {
    "stock": true,
    "options": true,
    "futures": false,
    "forex": false
  }
}
```

## 4. `GET /portfolio/{accountId}/positions/{pageId}` — 分页持仓列表

**这是最常用的端点之一**。持仓多时需要分页，`pageId` 从 `0` 开始递增。

```python
import requests
BASE = "https://localhost:5000/v1/api"

pageId = 0
while True:
    r = requests.get(
        f"{BASE}/portfolio/DU1234567/positions/{pageId}",
        verify=False, timeout=10,
    )
    positions = r.json()
    if not positions:
        break
    for p in positions:
        print(
            p["conid"], p["ticker"], p["position"],
            "avgCost=", p.get("avgCost"), "mktPrice=", p.get("mktPrice")
        )
    pageId += 1
```

每条 position 关键字段：

| 字段 | 含义 |
| --- | --- |
| `conid` | 合约 ID |
| `ticker` | 代码（如 `AAPL`） |
| `position` | 持仓数量（正数 = 多头，负数 = 空头） |
| `avgCost` | 平均成本（按 IBKR 内部口径，含佣金调整） |
| `mktPrice` | 上一笔行情快照价 |
| `mktValue` | 当前市值 |
| `unrealizedPnL` | 浮动盈亏 |
| `realizedPnL` | 当日已实现盈亏 |
| `currency` | 计价货币 |
| `assetCategory` | 资产类别：`STK` / `OPT` / `FUT` / `CASH` / `BOND` |

> ⚠️ **数据准确性提醒**：[Use Cases → Portfolio discrepancies](https://interactivebrokers.github.io/cpwebapi/use-cases) 明确写到——"由于平台过滤口径差异，Client Portal API 拉到的持仓可能与对账单 / Flex Query 略有差异。**做对账时以 Client Portal 网页或 Flex Query 为准**。"

## 5. `GET /portfolio/{accountId}/position/{conid}` — 单个 conid 持仓

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/DU1234567/position/265598",
                 verify=False, timeout=5)
print(r.json())
```

返回结构与分页接口一致，只是只返回一条记录。

## 6. `GET /portfolio/positions/{conid}` — 跨账户同一 conid 持仓

想知道"AAPL 在我所有账户里一共持多少"，用这个端点：

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/positions/265598",
                 verify=False, timeout=5)
print(r.json())
```

返回形如：

```json
[
  { "accountId": "DU1234567", "position": 100, "mktValue": 18000.0 },
  { "accountId": "U7654321", "position": 50,  "mktValue": 9000.0 }
]
```

## 7. `POST /portfolio/{accountId}/positions/invalidate` — 清缓存

IBKR 后端的 portfolio 数据有缓存层，**如果你刚下了单 / 刚成交，立即拉持仓可能会看到旧数据**。这时调一下 invalidate，强制后端重算：

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.post(
    f"{BASE}/portfolio/DU1234567/positions/invalidate",
    verify=False, timeout=10,
)
print(r.status_code, r.json())
```

随后再去拉 `/positions` 就能拿到最新值。

## 8. `GET /portfolio/{accountId}/allocation` — 资产分配

**单账户**：

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/DU1234567/allocation",
                 verify=False, timeout=5)
print(r.json())
```

返回结构示意：

```json
{
  "assetClass": {
    "STK": { "long": { "value": 80000, "percent": 0.72 }, "short": { ... } },
    "OPT": { ... }
  },
  "sector": { "Technology": { "STK": { "long": { "value": 60000 } } } },
  "group": { ... }
}
```

字段含义：按**资产类别 / 行业 / 分组**给出多头 / 空头市值与占比。

## 9. `POST /portfolio/allocation` — 多账户资产分配

请求体包含账户列表：

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.post(
    f"{BASE}/portfolio/allocation",
    json={"acctIds": ["DU1234567", "U7654321"]},
    verify=False, timeout=10,
)
print(r.json())
```

适合做"组合视角的资产配置再平衡"。

## 10. `GET /portfolio/{accountId}/summary` — 账户汇总

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/DU1234567/summary", verify=False, timeout=5)
print(r.json())
```

返回形如：

```json
{
  "totalcashvalue": {
    "amount": 10000.0,
    "currency": "USD",
    "isForex": false
  },
  "netliquidationvalue": {
    "amount": 125000.0,
    "currency": "USD"
  },
  "availablefunds": {
    "amount": 80000.0,
    "currency": "USD"
  },
  "buyingpower": {
    "amount": 320000.0,
    "currency": "USD"
  },
  "equity": { "amount": 125000.0, "currency": "USD" },
  "margin": {
    "row": 25000.0,
    "maintenance": 12500.0,
    "excess": 112500.0,
    "currency": "USD"
  }
}
```

> 字段命名规律：
>
> - `totalcashvalue` —— 现金余额
> - `netliquidationvalue` —— 总资产 NAV
> - `availablefunds` —— 可用资金
> - `buyingpower` —— 购买力（Reg T 默认 4 倍）
> - `equity` —— 权益
> - `margin` —— 保证金（`row`=初始，`maintenance`=维持，`excess`=剩余）

## 11. `GET /portfolio/{accountId}/ledger` — 台账

台账包括出入金、利息、佣金等"非交易"账目：

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/portfolio/DU1234567/ledger",
                 verify=False, timeout=10)
print(r.json())
```

返回结构示意：

```json
{
  "USD": {
    "commoditymarketvalue": 115000.0,
    "futuremarketvalue": 0.0,
    "stockmarketvalue": 115000.0,
    "optionsmarketvalue": 0.0,
    "cashbalance": 10000.0,
    "realizedpnl": 8500.0,
    "unrealizedpnl": 2200.0,
    "interest": -50.0,
    "dividends": 150.0
  }
}
```

## 12. Flex Query —— 对账的"金标准"

[Use Cases → Flex Queries](https://interactivebrokers.github.io/cpwebapi/use-cases) 写得很清楚：

> Client Portal API 当前**不支持**生成复杂报表。IBKR 提供另一套独立 API——**Flex Web Service**——通过 HTTPS 从 Client Portal 拉取预先配置好的 **Flex Query** 报表。请参考 [Flex Web Service API 文档](https://guides.interactivebrokers.com/am/am/reports/using_the_flex_web_service.htm)。

简单来说：如果你的报表口径与 IBKR 对账单有微小差异，**永远以 Flex Query 为准**。

## 13. 持仓接口限频速查

| 端点 | 限频 |
| --- | --- |
| `/portfolio/accounts` | **1 req/5 secs** |
| `/portfolio/subaccounts` | **1 req/5 secs** |
| `/portfolio/{accountId}/positions/{pageId}` | 默认 10 req/s |
| `/portfolio/{accountId}/summary` | 默认 |
| `/portfolio/{accountId}/allocation` | 默认 |

## 与 TWS API 的差异

| 维度 | Client Portal API Portfolio | TWS API Portfolio |
| --- | --- | --- |
| 持仓 | 分页 `GET /positions/{pageId}` | `reqPositions()` 回调 |
| 账户汇总 | `GET /portfolio/{accountId}/summary` | `reqAccountSummary()` + `accountSummary` 回调 |
| 资产分配 | `/allocation` 端点内置 | 需要自己用 `reqPositions` 数据聚合 |
| 出入金 / 利息 | `/ledger` 端点内置 | `accountSummary` 中逐个 tag 拼接 |
| 对账 | 推荐用 Flex Web Service | 同样推荐 Flex Web Service |

## 常见错误码

| HTTP Code | 含义 | 建议处理 |
| --- | --- | --- |
| `400 Bad Request` | `accountId` 拼错 / `pageId` 非整数 | 检查路径参数 |
| `401 Unauthorized` | session 失效 | 重新 `/iserver/reauthenticate` |
| `404 Not Found` | 账户或 conid 不存在 | 用 `/portfolio/accounts` / `/trsv/secdef` 重取 |
| `429 Too Many Requests` | 触发限频 | sleep 5s 后重试 |
| `503 Service Unavailable` | 后端正在刷新缓存 | 调 `invalidate` 后等 1-2 秒再试 |

## 下一节

- [行情（Market Data）](./market_data.md) — 给持仓做估值离不开行情。

---

## 参考链接

- [Endpoints Explorer → Portfolio](https://interactivebrokers.github.io/cpwebapi/endpoints)
- [Use Cases → Portfolio discrepancies](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [Use Cases → Flex Queries](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [Flex Web Service API](https://guides.interactivebrokers.com/am/am/reports/using_the_flex_web_service.htm)
- [账户](./account.md)
- [行情](./market_data.md)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 |