# TWS API 中文翻译

!!! info "所属平台"
    本模块属于 [**TWS 平台**](../tws-platform.md)。TWS 平台下还有 [TWS 使用手册](../tws-manual/README.md)（给交易员用）和 Mosaic 专题。

> 来源：[Interactive Brokers TWS API Documentation](https://interactivebrokers.github.io/tws-api/)
> 进度：🚧 翻译中（已翻译 11 / 19 个核心章节）

TWS API 是盈透证券经典的桌面交易 API，覆盖下单、行情、账户管理、新闻等核心功能。

---

## 章节进度

| 章节 | 状态 | 翻译文件 |
|------|------|----------|
| Introduction | ✅ | [introduction.md](introduction.md) |
| Notes & Limitations | ✅ | [notes_and_limitations.md](notes_and_limitations.md) |
| Connecting to TWS | ✅ | [connection.md](connection.md) |
| Financial Instruments (Contracts) | ✅ | [contracts.md](contracts.md) |
| Placing Orders | ✅ | [orders.md](orders.md) |
| Available Orders | ✅ | [order_types.md](order_types.md) |
| Order Conditioning | ✅ | [order_conditions.md](order_conditions.md) |
| Streaming Market Data | ✅ | [market_data.md](market_data.md) |
| Historical Market Data | ✅ | [historical_data.md](historical_data.md) |
| Account Summary | ✅ | [account_portfolio.md](account_portfolio.md) |
| News | ✅ | [news.md](news.md) |
| Minimum Price Increment | ✅ | [minimum_increment.md](minimum_increment.md) |
| Error Handling | ✅ | [error_handling.md](error_handling.md) |
| TWS Settings | ✅ | [tws_settings.md](tws_settings.md) |
| Market Depth (Level II) | 📋 待翻译 | [原文](https://interactivebrokers.github.io/tws-api/market_depth.html) |
| Real Time Bars | 📋 待翻译 | [原文](https://interactivebrokers.github.io/tws-api/realtime_bars.html) |
| Market Scanners | 📋 待翻译 | [原文](https://interactivebrokers.github.io/tws-api/market_scanners.html) |
| Fundamental Data | 📋 待翻译 | [原文](https://interactivebrokers.github.io/tws-api/fundamental_data.html) |
| Executions | 📋 待翻译 | [原文](https://interactivebrokers.github.io/tws-api/executions.html) |

---

## 学习路径建议

### 🟢 入门
1. [Introduction](introduction.md) —— 整体架构
2. [Notes & Limitations](notes_and_limitations.md) —— 已知限制
3. [Connecting to TWS](connection.md) —— 第一个连接

### 🟡 基础
4. [Financial Instruments](contracts.md) —— 合约定义
5. [Placing Orders](orders.md) —— 下单
6. [Streaming Market Data](market_data.md) —— 行情
7. [Account Summary](account_portfolio.md) —— 账户数据

### 🔴 进阶
8. [Available Orders](order_types.md) —— 各种订单类型
9. [Order Conditioning](order_conditions.md) —— 条件单
10. [Historical Market Data](historical_data.md) —— 历史数据
11. [Minimum Price Increment](minimum_increment.md) —— 最小变动
12. [News](news.md) —— 新闻数据

### 🛠 排错
- [Error Handling](error_handling.md) —— 错误码速查
- [TWS Settings](tws_settings.md) —— TWS 端配置

---

## 推荐 Python 库

| 库 | 特点 |
|----|------|
| **[ib_insync](https://github.com/erdewit/ib_insync)** ⭐ | 异步 API、Pythonic 风格、最活跃 |
| [ib_async](https://github.com/ib-api-reloaded/ib_async) | ib_insync 的维护分支 |
| [official `ibapi`](https://github.com/InteractiveBrokers/tws-api) | IB 官方 Python 绑定（同步回调风格） |

本项目所有实战示例均以 **`ib_insync`** 为主。