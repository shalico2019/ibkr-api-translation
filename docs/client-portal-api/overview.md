# 概述（Overview）

> **英文原文**：[Client Portal API Documentation / Home](https://interactivebrokers.github.io/cpwebapi/)
> **翻译版本**：v1（基于 cpwebapi 站点内容，官方已标记 deprecated；新文档请见 [IBKR Campus](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/)）
> **译者**：@shalico2019

## 什么是 Client Portal API

Client Portal API 是盈透证券（Interactive Brokers，下文简称 **IBKR**）提供的一套基于 HTTP/HTTPS 的 **RESTful Web API**（表现层状态转移风格的 Web 接口）。它的核心价值在于——IBKR 平台大量核心交易能力都可以通过这套 API 暴露给第三方系统，从而无需使用 TWS/IBKR Mobile 的图形界面，就能完成程序化交易、账户管理、行情订阅等操作。

文档原文给出的功能定位可以归纳为四点：

1. Client Portal API 提供了大量对成功交易至关重要的特性（Many of the features that make your trading successful are available through Client Portal API）。
2. 允许 IBKR 客户**交易、监控并管理自己的账户**（trade, monitor and manage their account）。
3. **不需要引入特殊的库**（no need to import special libraries），只要能发 HTTP 请求就可以——这也是它与 TWS API（基于 TCP Socket 的私有协议）的最大差异。
4. 可以通过两种方式接入：**本地 IBKR 提供的轻量级 Gateway（网关）**，或（机构客户）使用 **OAuth 1.0a / Dedicated Connection**。

> ⚠️ **文档状态提醒**：IBKR 已在 cpwebapi 站点顶部标注 "This documentation is now deprecated. Please switch to the [IBKR Campus](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/) for up-to-date information regarding IBKR's API solutions." 本翻译保留原始链接与行为描述，便于继续阅读；但生产环境的接口细节请以 IBKR Campus 为准。

## 与 TWS API 的差异

Client Portal API 与 TWS API 是 IBKR 提供的两套**互为补充**的编程接口。下表对比关键差异点，方便你根据业务场景选型：

| 维度 | Client Portal API | TWS API |
| --- | --- | --- |
| 协议 | HTTPS（REST + WebSocket） | TCP Socket（私有二进制协议） |
| 鉴权 | 浏览器手动登录 + 2FA；机构可走 OAuth | 用户名 / 密码在 API 设置中开启即可 |
| 前置依赖 | Java 8+ Gateway（`bin/run.sh root/conf.yaml`） | TWS 或 IB Gateway 实例 |
| 网络拓扑 | Gateway 在本机，浏览器调用 `localhost:5000` | TWS / IBGW 与客户端进程同机或局域网 |
| 部署场景 | 适合 Web 服务、跨平台、移动端 | 适合低延迟本地程序、量化研究 |
| 编程语言依赖 | 任何能发 HTTP 请求的语言（Python、JS、Go、Rust、Shell…） | IBKR 官方仅提供 Python / Java / C++ / C# / VB 客户端 |
| 并发能力 | 每账户**单会话**（TWS / Client Portal / Mobile 互斥） | 多线程/多账户可同时连接 |
| 文档站 | <https://interactivebrokers.github.io/cpwebapi/>（deprecated） | <https://interactivebrokers.github.io/tws-api/> |

**选型建议**：

- 已经在跑 TWS、追求**毫秒级延迟**或要批量管理多个账户 → **TWS API**。
- 想做 Web 服务、移动端、低运维成本（不依赖桌面端 TWS） → **Client Portal API**。
- 想做**全栈策略研究**（同一账户既跑回测又跑实时）→ 用 TWS API 做研究、Client Portal API 做 Web 化产品。

## 整体工作流

下面给出典型的 Client Portal API 调用流程，便于把后续章节串联起来：

```text
┌────────────────────┐   1) 启动        ┌──────────────────────┐
│   Java Gateway     │ ◀─────────────── │  本机 :5000          │
│ (bin/run.sh)       │                  │  HTTPS REST + WS     │
└────────────────────┘                  └──────────┬───────────┘
        │                                          │
        │ 2) 浏览器登录 + 2FA                       │ 3) HTTP 请求
        ▼                                          ▼
┌────────────────────┐                  ┌──────────────────────┐
│  IBKR 后端         │ ◀──── 鉴权 ────  │  你的脚本            │
│  (brokerage        │   + 行情 + 交易   │  (Python/Go/...)    │
│   session)         │                  │                      │
└────────────────────┘                  └──────────────────────┘
        │
        │ 4) 推送（可选）
        ▼
┌────────────────────┐
│  WebSocket         │
│  /ws endpoint      │
└────────────────────┘
```

最常见的一条最小可用调用链路是：

1. `POST /iserver/auth/status` —— 确认 session 是否已认证。
2. `GET /iserver/accounts` —— 列出可用账户。
3. `POST /iserver/account` —— **切换**到目标账户（同一时间只有一个 active）。
4. `GET /portfolio/{accountId}/positions/{pageId}` —— 拉持仓。
5. `POST /iserver/account/{accountId}/orders` —— 下单。

## 与本仓库其他章节的对应

| 你想做什么 | 请阅读 |
| --- | --- |
| 如何启动 Gateway、登录、保持心跳 | [Session](./session.md)、[认证](./authentication.md) |
| 查账户基本信息、切换账户、看 PnL | [账户](./account.md) |
| 查持仓、汇总、分配 | [持仓](./portfolio.md) |
| 下单、改单、撤单、Preview | [订单](./orders.md) |
| 行情快照、历史 K 线、订阅 | [行情](./market_data.md) |

## 下一节

- [Session（会话管理）](./session.md)

---

## 参考链接

- [Client Portal API Documentation](https://interactivebrokers.github.io/cpwebapi/)：英文原文（已标记 deprecated）
- [IBKR Campus](https://ibkrcampus.com/ibkr-api-page/ibkr-api-home/)：IBKR 新版文档站（推荐）
- [Quickstart 原文](https://interactivebrokers.github.io/cpwebapi/quickstart)
- [Authentication 原文](https://interactivebrokers.github.io/cpwebapi/authentication)
- [Use Cases 原文](https://interactivebrokers.github.io/cpwebapi/use-cases)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译（基于 cpwebapi 站点；保留 deprecated 提示） |