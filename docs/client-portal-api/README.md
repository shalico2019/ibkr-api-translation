# Client Portal API 文档翻译

!!! info "所属平台"
    本模块属于 [**Client Portal 平台**](../client-portal-platform.md)。Client Portal 平台下还有 [Client Portal 使用手册](../client-portal-manual/README.md)（给交易员用，占位中）。

> **英文原文**：[Client Portal API Documentation](https://interactivebrokers.github.io/cpwebapi/)（站点已标记 **deprecated**；新文档见 [IBKR Campus](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/)）
> **本节维护**：@shalico2019
> **翻译版本**：v1

## 1. 简介

Client Portal API 是盈透证券（Interactive Brokers，下文简称 **IBKR**）提供的 **RESTful Web API**——通过 HTTPS + WebSocket 暴露账户、持仓、行情、下单等核心能力。它与 [TWS API](../tws-api/introduction.md) 互为补充：

- 适合 Web 服务、跨平台客户端、低运维场景。
- 不需要安装 TWS 桌面端，只要本地跑一个 Java Gateway。
- 个人账户登录需要 2FA（Two-Factor Authentication，双因素认证），**不可自动化**；机构账户可走 OAuth 1.0a。

更详细的对比和选型建议见 [概述](./overview.md) → 「与 TWS API 的差异」。

## 2. 内容索引

> 状态图例：✅ 已完成　⏳ 待补全　🚧 进行中

| # | 章节 | 文件 | 行数 | 状态 |
| --- | --- | --- | --- | --- |
| 1 | 概述（Overview） | [overview.md](./overview.md) | 102 | ✅ |
| 2 | 会话管理（Session） | [session.md](./session.md) | 240 | ✅ |
| 3 | 认证（Authentication） | [authentication.md](./authentication.md) | 200 | ✅ |
| 4 | 账户（Account） | [account.md](./account.md) | 289 | ✅ |
| 5 | 订单（Orders） | [orders.md](./orders.md) | 415 | ✅ |
| 6 | 持仓（Portfolio） | [portfolio.md](./portfolio.md) | 388 | ✅ |
| 7 | 行情（Market Data） | [market_data.md](./market_data.md) | 269 | ✅ |

**本节总进度**：7/7 章节完成 ✅

## 3. 阅读路线建议

- **刚接触 IBKR API 的新手**：先读 [TWS API 介绍](../tws-api/introduction.md) 建立"账户–连接–订单"概念，再回到本节。
- **要把现有 Python 策略搬到 Web 端**：先看 [Session](./session.md) → [认证](./authentication.md) → [账户](./account.md) → [行情](./market_data.md) → [订单](./orders.md) → [持仓](./portfolio.md)。
- **只需要查某个端点的签名 / 参数**：直接用各章节末尾的"端点速查表" + 跳转到 [官方 Endpoints Explorer](https://interactivebrokers.github.io/cpwebapi/endpoints) 对照。

## 4. Client Portal API vs TWS API：取舍清单

| 你的需求 | 推荐 | 理由 |
| --- | --- | --- |
| 低延迟本地量化、批量多账户 | **TWS API** | 异步回调 / 多 client / 脚本自动化 |
| Web 端 / 移动端 / 跨语言后端 | **Client Portal API** | 标准 HTTP，Python/Go/Node/Rust 都能调 |
| 想要无人值守 7×24 跑 | **TWS API**（`ibc` 等工具） | CP API 个人账户每天必须人工 2FA |
| 已经有 TWS 实例在跑 | **TWS API** | 复用现成连接，零额外依赖 |
| 没有 TWS、想用最轻栈 | **Client Portal API** | 只需 Java 8+ Gateway（`bin/run.sh root/conf.yaml`） |
| 机构账户多用户 | 二者皆可 | TWS 走标准 `clientId`；CP API 走 OAuth |

> **实战经验**：如果你只是写**一次性数据脚本**（拉历史 K 线、批量取 PnL），Client Portal API 比 TWS API 简单很多；但只要涉及"低延迟 + 实时",TWS API 仍是首选。

## 5. 调用 Client Portal API 的最小流程

```text
┌──────────────────┐   启动   ┌──────────────────┐
│ Java Gateway     │ ───────▶ │ 监听 0.0.0.0:5000 │
│ (bin/run.sh)     │         └──────────────────┘
└──────────────────┘                ▲
        │                            │ HTTPS REST
        │ 浏览器登录 + 2FA            │
        ▼                            │
┌──────────────────┐                │
│  IBKR 后端       │ ◀──────────────┘
│  brokerage       │
│  session         │
└──────────────────┘
```

5 行就能跑通：

```python
import requests
BASE = "https://localhost:5000/v1/api"
requests.packages.urllib3.disable_warnings()

print(requests.post(f"{BASE}/iserver/auth/status", verify=False).json())           # ① 确认已认证
print(requests.get (f"{BASE}/iserver/accounts",     verify=False).json())           # ② 列出账户
requests.post(f"{BASE}/iserver/account", params={"acctId": "DU1234567"}, verify=False)  # ③ 切换账户
print(requests.get (f"{BASE}/portfolio/DU1234567/positions/0", verify=False).json())  # ④ 拉持仓
print(requests.get (f"{BASE}/iserver/marketdata/snapshot",
                    params={"conids": 265598, "fields": "31,84,85,86"},
                    verify=False).json())                                          # ⑤ 拉行情
```

详细解释见各章节。

## 6. 全章节端点速查

> 完整 Swagger：[interactivebrokers.github.io/cpwebapi/endpoints](https://interactivebrokers.github.io/cpwebapi/endpoints)
> ⚠️ 限频速查见 [Use Cases → Pacing limitations](https://interactivebrokers.github.io/cpwebapi/use-cases)。

### Session

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| POST | `/tickle` | 心跳 | 1 req/sec |
| POST | `/logout` | 退出 | 默认 |
| GET  | `/sso/validate` | 校验 SSO 凭据 | **1 req/min** |
| POST | `/iserver/auth/status` | 查询认证状态 | 默认 |
| POST | `/iserver/reauthenticate` | 重新认证（`?force=true` 踢人） | 默认 |

### Account

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| GET  | `/iserver/accounts` | 列出 brokerage 账户 | 默认 |
| POST | `/iserver/account?acctId=` | 切换活动账户 | 默认 |
| GET  | `/iserver/account/pnl/partitioned` | 当日 PnL | **1 req/5 secs** |
| POST | `/pa/performance` | PortfolioAnalyst 绩效 | **1 req/15 mins** |
| POST | `/pa/transactions` | 单 conid 交易历史 | **1 req/15 mins** |

### Portfolio

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| GET  | `/portfolio/accounts` | 列出组合账户 | **1 req/5 secs** |
| GET  | `/portfolio/subaccounts` / `/subaccounts2` | 子账户列表 | **1 req/5 secs** |
| GET  | `/portfolio/{accountId}/meta` | 账户元数据 | 默认 |
| GET  | `/portfolio/{accountId}/allocation` | 单账户资产分配 | 默认 |
| POST | `/portfolio/allocation` | 多账户资产分配 | 默认 |
| GET  | `/portfolio/{accountId}/positions/{pageId}` | 分页持仓 | 默认 |
| GET  | `/portfolio/{accountId}/position/{conid}` | 单 conid 持仓 | 默认 |
| GET  | `/portfolio/positions/{conid}` | 跨账户同 conid 持仓 | 默认 |
| POST | `/portfolio/{accountId}/positions/invalidate` | 清缓存 | 默认 |
| GET  | `/portfolio/{accountId}/summary` | 账户汇总 | 默认 |
| GET  | `/portfolio/{accountId}/ledger` | 台账 | 默认 |

### Order

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| GET    | `/iserver/account/orders` | 活单 | **1 req/5 secs** |
| POST   | `/iserver/account/{accountId}/orders` | 下单 | 默认 |
| POST   | `/iserver/account/orders/{faGroup}` | FA 账户下单 | 默认 |
| POST   | `/iserver/reply/{replyid}` | 二次确认 | 默认 |
| POST   | `/iserver/account/{accountId}/orders/whatif` | Preview | 默认 |
| GET    | `/iserver/account/order/status/{orderId}` | 单笔订单状态 | 默认 |
| POST   | `/iserver/account/{accountId}/order/{orderId}` | 改单 | 默认 |
| DELETE | `/iserver/account/{accountId}/order/{orderId}` | 撤单 | 默认 |
| GET    | `/iserver/account/trades` | 当日成交 | **1 req/5 secs** |

### Market Data

| 方法 | 路径 | 用途 | 限频 |
| --- | --- | --- | --- |
| GET | `/md/snapshot` | 行情快照（Beta，老版） | 10 req/s |
| GET | `/iserver/marketdata/snapshot` | 行情快照（推荐） | 10 req/s |
| GET | `/iserver/marketdata/{conid}/unsubscribe` | 取消单 conid 订阅 | 默认 |
| GET | `/iserver/marketdata/unsubscribeall` | 取消所有订阅 | 默认 |
| GET | `/iserver/marketdata/history` | 历史 K 线 | **5 concurrent** |

> 实时推送场景用 [Websockets](https://interactivebrokers.github.io/cpwebapi/websockets)，REST 端点属于"拉取"模型。

## 7. 文档站状态与勘误

- 原文站点顶部明确写了 "This documentation is now deprecated. Please switch to the [IBKR Campus](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/) for up-to-date information regarding IBKR's API solutions."
- 本翻译基于 deprecated 时的 cpwebapi 内容；端点名称、限频、字段在 IBKR Campus 可能有更新字段名/路径，**生产环境部署前请以最新官方文档为准**。
- 翻译过程中如发现错误或遗漏，欢迎 PR。

## 8. 相关链接

- [官方 Client Portal API Documentation](https://interactivebrokers.github.io/cpwebapi/)（deprecated）
- [官方 Quickstart](https://interactivebrokers.github.io/cpwebapi/quickstart)
- [官方 Authentication](https://interactivebrokers.github.io/cpwebapi/authentication)
- [官方 Endpoints Explorer](https://interactivebrokers.github.io/cpwebapi/endpoints)
- [官方 Websockets](https://interactivebrokers.github.io/cpwebapi/websockets)
- [官方 Use Cases](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [IBKR Campus（新版）](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/)
- 本仓库：[TWS API 文档](../tws-api/introduction.md)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 7 个章节完成；本索引页扩到 100+ 行；nav 挂载 |
