# TWS 使用手册

> Interactive Brokers **Trader Workstation (TWS)** 桌面交易平台的完整中文操作指南

TWS 是盈透证券（Interactive Brokers）面向活跃交易者的旗舰桌面平台，支持股票、期权、期货、外汇、债券、基金等 160+ 市场的统一交易。本模块将 [ibkrguides.com/traderworkstation](https://www.ibkrguides.com/traderworkstation/getting-started.htm) 官方英文手册翻译为简体中文，聚焦**实操**而非概念解释。

!!! note "与 TWS API 模块的区别"
    本站另有 [**TWS API**](../tws-api/README.md) 模块，是面向**程序员**的 API 编程文档（Python/C++/Java SDK）。本模块面向**交易员**，讲的是 TWS 软件本身的 UI 操作。两者互不重叠，请按需查阅。

## 翻译进度

> 状态图例：✅ 已完成　🚧 翻译中　📋 待启动

### P0 — 新手必读（10 章）
| # | 章节 | 状态 |
|---|------|------|
| 1 | [入门概览](getting-started.md) | ✅ |
| 2 | [首次登录与双因素认证](login.md) | ✅ |
| 3 | [基础配置](configuration.md) | ✅ |
| 4 | [账户窗口](account-window.md) | ✅ |
| 5 | [市场数据](market-data.md) | ✅ |
| 6 | [订单类型](order-types.md) | ✅ |
| 7 | [订单管理](order-management.md) | ✅ |
| 8 | [图表基础](charts.md) | ✅ |
| 9 | [自选列表](watchlist.md) | ✅ |
| 10 | [警报与通知](alerts-and-notifications.md) | ✅ |

**本节进度**：10/10 章节完成 ✅

### P1 — 进阶 UI 与常用功能（15 章）
| # | 章节 | 状态 |
|---|------|------|
| 11 | [Mosaic 界面](mosaic.md) | ✅ |
| 12 | [预设与自定义布局](layouts.md) | ✅ |
| 13 | [快捷键](hot-keys.md) | ✅ |
| 14 | [滚动行情条 Ticker Tape](ticker-tape.md) | ✅ |
| 15 | [逐笔成交 Time & Sales](time-and-sales.md) | ✅ |
| 16 | [订单预设 Order Presets](order-presets.md) | ✅ |
| 17 | [订单共享模式](order-sharing-modes.md) | ✅ |
| 18 | [下单面板 Order Ticket](order-ticket.md) | ✅ |
| 19 | [外汇交易器 FXTrader](fx-trader.md) | ✅ |
| 20 | [风险导航器 Risk Navigator](risk-navigator.md) | ✅ |
| 21 | [市场扫描器](market-scanners.md) | ✅ |
| 22 | [基本面分析](fundamental-analytics.md) | ✅ |
| 23 | [新闻与研究](news.md) | ✅ |
| 24 | [投资组合分析](portfolio-analyst.md) | ✅ |
| 25 | [颜色联动 Color Grouping](color-grouping.md) | ✅ |

**本节进度**：15/15 章节完成 ✅

### P2 — 高级功能（待启动）
源站共 **529 章节**，P0/P1 已覆盖核心操作。P2 包括 Algos（算法交易）、ScaleTrader、BasketTrader、BookTrader、Tax Optimizer、Model Portfolios、Advisors 模块等深度功能，将根据社区贡献逐步翻译。

## 阅读建议

- **新用户**：按 P0 顺序读 1-10，建立对 TWS 整体界面的认识
- **实操派**：直接看 P1 中需要的章节，比如 [市场数据](market-data.md) + [订单类型](order-types.md) 即可上手
- **查询某功能**：用页面顶部搜索框（搜索英文名也能命中中文章节名）

## 术语约定

- **TWS** = Trader Workstation，盈透桌面交易平台
- **Mosaic** = TWS 9.7x+ 的现代界面（默认），**Classic TWS** = 旧版界面（部分老用户仍在用）
- **LMT / MKT / STP** = Limit / Market / Stop 订单类型缩写
- **更多术语**见 [术语表](../glossary.md)

## 来源与版权

- 原文：[ibkrguides.com/traderworkstation](https://www.ibkrguides.com/traderworkstation/getting-started.htm)
- 版权：Interactive Brokers LLC，本项目译文以 MIT 协议发布
- **截图说明**：本站截图仅作界面位置示意，**非 IBKR 官方截图**——所有 IBKR 官方软件截图版权归 IBKR 所有
