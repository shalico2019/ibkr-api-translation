# 盈透证券 IBKR 操作指南

> Interactive Brokers 全平台中文操作指南集合

盈透证券（Interactive Brokers，下文简称 **IBKR**）是面向全球活跃交易者的多市场多产品经纪商。本站将 IBKR 官方各平台的英文文档**翻译整理为简体中文**，并对关键概念补充实战示例。

## 我是谁，我该看哪？

<div class="grid cards" markdown>

-   :material-chart-line:{ .lg .middle } **我是交易员**

    ---

    想用 TWS 软件下单、看行情、做研究 → **[TWS 使用手册](tws-manual/README.md)**（25 章 P0+P1 全部上线）

-   :material-code-braces:{ .lg .middle } **我是程序员**

    ---

    想用 Python / C++ / Java 接 IBKR API → **[TWS API](tws-api/README.md)**（14 章） · **[Client Portal API](client-portal-api/README.md)**（7 章）

-   :material-robot:{ .lg .middle } **我做量化**

    ---

    想跑策略、回测、自动化交易 → **[实战策略](strategies/README.md)**（3 个可直接运行的示例）

-   :material-account-group:{ .lg .middle } **我是机构 / 顾问**

    ---

    Advisor / Broker / Org Portal → **[交易平台导航](tws-platform.md)**

</div>

## 内容覆盖

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **TWS 使用手册**

    ---

    **25** 章已上线 · **529** 子主题（源站总量） · 覆盖度 **4.7%**（剩余 504 章待启动）

    [:material-check: P0 新手必读 10/10] · [:material-check: P1 进阶 UI 15/15] · [:material-clock: P2 高级功能]

    涵盖：入门 / 登录 / 配置 / 订单 / 图表 / 警报 / 扫描器 / 风险 / 新闻

    [开始阅读 :material-arrow-right:](tws-manual/README.md)

-   :material-code-tags:{ .lg .middle } **TWS API**

    ---

    **14** 章已上线 · **19** 子主题（源站总量） · 覆盖度 **73.7%**

    [:material-check: 入门] · [:material-check: 连接] · [:material-check: 订单] · [:material-check: 行情] · [:material-clock: 高级]

    程序员接 TWS 用的 Python / C++ / Java SDK 文档

    [开始阅读 :material-arrow-right:](tws-api/README.md)

-   :material-cloud:{ .lg .middle } **Client Portal API**

    ---

    **7** 章已上线 · **7** 子主题 · 覆盖度 **100%** :material-check-all:

    REST 风格 API，基于 OAuth 1.0a 认证

    [开始阅读 :material-arrow-right:](client-portal-api/README.md)

-   :material-monitor-dashboard:{ .lg .middle } **IBKR Desktop 使用手册**

    ---

    **31** 章已上线 · **8** 大主题 · P0+P1 全档覆盖 :material-check-all:

    [:material-check: P0 入门 8/8] · [:material-check: P1 进阶 23/23]

    盈透新一代桌面客户端，覆盖入门 / 账户 / 搜索 / 自选 / 图表 / 警报 / 下单 / 筛选 / 设置

    [开始阅读 :material-arrow-right:](ibkrdesktop/README.md)

-   :material-atom:{ .lg .middle } **实战策略**

    ---

    **3** 个策略示例 · Python + `ib_insync` · 覆盖度 **3/3**

    [:material-check: 均线交叉] · [:material-check: 突破策略] · [:material-check: 网格交易]

    可直接复制运行的量化代码

    [开始阅读 :material-arrow-right:](strategies/README.md)

</div>

## 推荐阅读路径

=== "🟢 交易员新手"

    1. [TWS 入门概览](tws-manual/getting-started.md) — 5 分钟了解 TWS
    2. [首次登录与双因素认证](tws-manual/login.md)
    3. [基础配置](tws-manual/configuration.md)
    4. [市场数据](tws-manual/market-data.md)
    5. [订单类型](tws-manual/order-types.md)

=== "🔵 程序员接 API"

    1. [TWS API 介绍](tws-api/introduction.md)
    2. [连接 TWS](tws-api/connection.md)
    3. [下单流程](tws-api/orders.md)
    4. [实战策略 - 均线交叉](strategies/ma-crossover.md)

=== "🟣 做量化研究"

    1. [实战策略目录](strategies/README.md)
    2. [TWS API 介绍](tws-api/introduction.md) — 看 API 能做什么
    3. [实战策略 - 突破策略](strategies/breakout.md)
    4. [实战策略 - 网格交易](strategies/grid.md)

=== "🟠 用 IBKR Desktop 客户端"

    1. [IBKR Desktop 简介](ibkrdesktop/ibkr-desktop.md) — 与 TWS 的定位差异
    2. [入门概览](ibkrdesktop/getting-started.md) — 首次使用流程
    3. [下载与安装](ibkrdesktop/download-software.md)
    4. [自选列表](ibkrdesktop/watchlists.md) — IBKR Desktop 风格
    5. [图表基础](ibkrdesktop/chart.md) — 图上下单 / 指标叠加

## 站点状态

| 指标 | 数据 |
| --- | --- |
| 已发布页面 | 95 个（25 章 TWS 使用手册 + 31 章 IBKR Desktop + 14 章 TWS API + 7 章 Client Portal API + 3 个实战策略 + 其他） |
| 翻译完成度 | TWS API 73.7% · Client Portal API 100% · TWS 使用手册 4.7% · **IBKR Desktop P0+P1 31/31** · 实战策略 3/3 |
| 未来平台占位 | 8 个（IBKR Desktop / Mobile / Client Portal / Advisor / Broker / Org / GlobalTrader / ForecastTrader） |
| 部署 | GitHub Pages 自动部署，每次 push 自动上线 |
| 收录 | sitemap.xml 已提交到 Google Search Console / 百度站长（收录流程见 [SEO 收录指南](seo-submission.md)） |

## 参与贡献

-   :material-file-document-edit: **翻译改进**：术语润色、章节校对、补充例子
-   :material-rocket-launch: **新策略示例**：用 `ib_insync` 或其他 IBKR SDK 写新策略
-   :material-bug: **文档修正**：错别字、链接失效、代码 bug
-   :material-source-pull: **PR 流程**：提交前先读 [贡献指南](CONTRIBUTING.md) 与 [术语表](glossary.md)

## 版权

英文原文版权归 Interactive Brokers 所有，本项目译文以 MIT 协议发布。引用英文原文请保留 IBKR 原始链接。

!!! note "免责声明"
    本翻译为社区作品，不构成任何投资建议。IBKR 官方接口可能随时调整，使用前请以 IBKR 官方英文文档为准。
