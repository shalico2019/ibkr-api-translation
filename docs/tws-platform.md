# TWS 平台

> Interactive Brokers **Trader Workstation (TWS)** 平台文档集合

TWS（盈透交易工作站）是 IBKR 面向活跃交易者的旗舰桌面平台，支持股票、期权、期货、外汇、债券、基金等 160+ 市场的统一交易。本页是 TWS 平台所有文档的**统一入口**。

## 两类内容

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **TWS 使用手册**

    ---

    **25** 章 P0+P1 全部上线 · 适合**交易员**

    P0 新手必读 10 章 + P1 进阶 UI 15 章，覆盖入门、登录、订单、图表、警报、扫描器、风险、新闻等所有 TWS 软件操作

    [:octicons-arrow-right-24: 进入使用手册](tws-manual/README.md)

-   :material-code-tags:{ .lg .middle } **TWS API 文档**

    ---

    **14** 章已上线 · 适合**程序员**

    介绍 TWS API 编程接口，连接、合约、订单、行情、历史数据、错误处理、IB Gateway 等

    [:octicons-arrow-right-24: 进入 API 文档](tws-api/README.md)

</div>

## 选哪个？

| 我是 | 我要看 | 入口 |
| --- | --- | --- |
| 想用 TWS 软件下单、看行情、做研究 | TWS 使用手册 | [:octicons-arrow-right-24: 使用手册](tws-manual/README.md) |
| 想用 Python / C++ / Java 程序化接 TWS | TWS API | [:octicons-arrow-right-24: API 文档](tws-api/README.md) |
| 两个都要（量化策略） | 先 API 再用手册看 UI 怎么配 | [:octicons-arrow-right-24: API](tws-api/README.md) + [:octicons-arrow-right-24: 手册](tws-manual/README.md) |

## 关于 TWS

- **TWS** = Trader Workstation，盈透桌面交易平台
- **Mosaic** = TWS 9.7x+ 的现代界面（默认），**Classic TWS** = 旧版界面
- **IB Gateway** = TWS 的无界面版本，专为 API 自动化设计（API 文档 [Notes & Limitations](tws-api/notes_and_limitations.md) 章节有介绍）
- 平台支持：Windows / macOS / Linux（IB Gateway）

## 平台与文档的对应关系

```
TWS 平台
├── 📖 使用手册（给交易员看 UI 操作）    → docs/tws-manual/
└── 🔌 API 文档（给程序员看编程接口）    → docs/tws-api/
```

## 翻译来源与版权

- 原文：[ibkrguides.com/traderworkstation](https://www.ibkrguides.com/traderworkstation/getting-started.htm)（使用手册）
- 原文：[interactivebrokers.github.io/tws-api](https://interactivebrokers.github.io/tws-api/intro.html)（API 文档）
- 版权：Interactive Brokers LLC，本项目译文以 MIT 协议发布
