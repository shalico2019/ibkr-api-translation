# 基本面分析 Fundamental Analytics

> 原文：[ibkrguides.com/traderworkstation/fundamental-analytics.htm](https://www.ibkrguides.com/traderworkstation/fundamental-analytics.htm)
> 最后更新于 2025-10-08

## 概述

**Fundamental Analytics**（基本面分析）是 TWS 内一组用于**研究/筛选/监控**个股与 ETF 基本面的工具集合。涵盖：

- **Fundamentals Explorer**（基本面浏览器）：单个标的的"全景详情"页（公司概况 + 主题 + 财报 + 所有权 + 股息 + 关键比率 + 分析师预测/评级 + 社交情绪 + 同行对比 + 200+ 比率与图表）。
- **IMPACT Dashboard**（价值观评估仪表板）：用你的"价值观权重"给组合打 ESG 分数。
- **Orbisa Securities Lending Analytics Dashboard**（Orbisa 融券分析仪表板）：机构级融券/做空数据。
- **Analyst Ratings**（分析师评级）：来自卖方分析师的综合评级 + 价格目标 + TipRanks 分析。
- **Ownership Tear Sheet**（股东名册）：公司股东、机构持仓、变动趋势。
- **Daily Lineup**（每日要点）：早盘前必看，市场事件鸟瞰。
- **Discover（Trading Central）**：第三方研究/技术分析。
- **Analyst Research and Market Commentary**（分析师研究与市场评论）：第三方研究报告。
- **WSH Corporate Event Calendar**（Wall Street Horizon 公司事件日历）：财报/股东大会/拆股等。
- **Event Calendars**（综合事件日历）：经济事件 + 财报 + 公司事件聚合。

!!! info "名词对照"
    **Fundamental Analytics** = 基本面分析（工具集）；**Fundamentals Explorer** = 基本面浏览器（单标的全景详情页）；**Fundamentals** = 基本面数据（财务比率/盈利/股息等）；**Analyst Rating** = 分析师评级；**Sentiment** = 市场情绪；**WSH** = Wall Street Horizon（第三方事件数据源）；**TipRanks** = 第三方分析师综合评级数据源；**ESG** = Environmental/Social/Governance（环境/社会/治理）；**Orbisa** = 第三方融券数据提供商。

## Fundamentals Explorer（核心）

**单标的最丰富的详情页**。包含 10 个核心子模块：

- **Company Profile** — 公司概况
- **Themes** — 投资主题
- **Financials** — 财报
- **Ownership** — 所有权
- **Dividend** — 股息
- **Key Ratios** — 关键比率（200+ 公司和 ETF 比率，含 5 年趋势图 + 同业对比）
- **Analyst Forecasts** — 分析师预测
- **Analyst Ratings** — 分析师评级
- **Orbisa Securities Lending Dashboard** — 融券分析
- **Ownership Tear Sheet** — 股东名册

### 打开 Fundamentals Explorer

1. 在 TWS 任意**标的（asset）上右键** → 点 **Fundamentals Explorer** 图标。
2. 或 **New Window** → 搜 `Fundamentals Explorer` → 打开。
3. 进入后**用顶部菜单**在不同子模块间切换（或在任一子模块点 **蓝色箭头**直接跳转）。

### 关键特性

- **200+ 公司和 ETF 比率**，含 5 年趋势图。
- **同业对比**（基于 Thomson Reuters Business Classifications 同行业）。
- **气泡图**展开某比率 vs 4 个最接近市值的同业。
- **公司财报 ↔ 分析师预测**交叉引用。
- **图表面板**展示数据趋势与"超出/低于分析师预期"。

## IMPACT Dashboard（价值观评估）

让"责任投资"（responsible investing）变简单：用你的**价值观权重**评估组合里每家公司的**业务价值对齐度**。

### 打开与配置

1. **Portfolio 里点 IMPACT 按钮**打开。
2. **引导页** → 选"你重视的价值观"（"Important"或"Very Important"，后者权重更高）。
3. **点 Next** → 选"你**反对**的实践行为"（被列入的公司会被打 flag）。
4. **点 Done** → 显示**组合 IMPACT 分数**。

### 分数计算逻辑

- **值数量越多 → 各项值权重越被稀释**。建议**少选值 + 谨慎用 Very Important**。
- **按组合权重加权**：单一持仓占比越大，对组合分影响越大。
- **数据覆盖率**：并非所有公司都提供 IMPACT 数据，会显示"有数据的组合占比"。
- **反对的实践**：**不参与分数计算**，但会**标记**有这些实践的公司。

### 在 Watchlist 中添加 IMPACT 列

- **Watchlist → Insert/Remove → Insert Column** → **IMPACT** 类别。
- **IMPACT Effect**（深绿/亮绿/黄绿）：与你的价值观对齐度。
- **IMPACT Flag**（红 / 黄）：标出你有"反对的实践"的公司。鼠标悬停看具体被 flag 的实践。

### 在 Fundamentals Explorer 中用 IMPACT Widget

- 标的级 IMPACT 概览：在 Fundamentals Explorer 的"Individual Asset"页面有 **IMPACT widget**，**对潜在投资**展示与你的价值观 + ESG 原则的对齐度。

## Orbisa Securities Lending Dashboard（融券分析）

**机构级融券数据**（历史上只有银行/做市商/机构投资者能用），覆盖 189,000 个独立证券、50+ 全球市场。

### 8 个核心指标

| 指标 | 含义 |
| --- | --- |
| **Utilization** | 该券**已借出数量** / **总可借库存**（百分比） |
| **Lender Depth** | 仍在借的 lender 数（1: 0-5 / 2: 6-10 / 3: 11+） |
| **Average Duration** | 该券所有未平仓借券的**加权平均存续期**（日历日） |
| **Borrow Depth** | 仍在借的 borrower 数（1: 0-5 / 2: 6-10 / 3: 11+） |
| **Days to Cover** | 股票：当前借出股数 / 现金市场 30 日均成交量 |
| **On Loan Quantity** | 总借出数量 |
| **On Loan Value** | 总借出市值（USD） |
| **Short Interest Indicator** | 股票：借出股数 / 流通股本；固收：借出金额 / 发行规模 |

### 附加能力

- **Compare 图**：两家公司融券数据对比。
- **多公司 side-by-side 对比**，**自定义日期范围**最长 12 个月。
- **Orbisa Premium 订阅**（部分功能需订阅，可 30 天免费试用）。
- **跨平台**：Desktop TWS / Client Portal / IBKR Mobile 三端可用。

## Analyst Ratings（分析师评级）

卖方分析师综合评级 + 价格目标 + 升级/降级历史 + **TipRanks 基本面分析**。

### 两个 Tab

- **Summary**：均值评级历史图 + 价格目标历史 + 评级分布。
- **Coverage**：TipRanks 分析师共识 + 共识拆解 + 分析师价格目标 + 分析师名单。

### 打开

**Fundamentals Explorer → Analyst Ratings Tab**（或在 New Window 搜 Analyst Ratings）。

## Ownership Tear Sheet（股东名册）

公司股东 + 机构持仓 + 持仓变动趋势。

### 打开

**Fundamentals Explorer → Ownership Tear Sheet Tab**（或在 New Window 搜 Ownership Tear Sheet）。

## Daily Lineup（每日要点）

**早盘前必看**的市场事件鸟瞰视图。**IBIS 订阅用户**登录后自动展示，**全日任意时点**可点 New Window → Information System → Daily Lineup 重看。

- **World Markets** 缩略图（按所选合约变化）。
- **News** 段落（点标题看全文）。
- **实时刷新**。

## Discover（Trading Central）

第三方研究平台集成。**6 个 widget**：

- **Market Buzz**：气泡图显示"被讨论最多的公司"（气泡越大，buzz 越高）。鼠标悬停看提及数，**点气泡下钻**到 News Analytics + 情绪数据。
- **Technical Insight**：**Technical Score**（看多/中/空 方向性） + 不同时间窗口。
- **Technical Views**：Trading Central 自动化算法 + 高级分析师识别的**形态**。
- **Featured Ideas**：按你在"Customized Settings"（右上齿轮）里定义的**风格**（交易所、资产类型、看多/看空、时间线等）筛选的实时 idea 流。
- **Fundamental Insight**：复杂财务数据 → 可视化洞察。
- **Economic Insight**：经济日历（市场事件监控）。

### 打开

**New Window → Discover → Trading Central**（或 **Analytical Tools 菜单 → Discover → Trading Central**）。

## Analyst Research and Market Commentary

第三方分析师研究与市场评论。打开后内容按所选标的展示。

## WSH Corporate Event Calendar

**Wall Street Horizon** 公司事件日历：财报/股东大会/拆股/分立/IPO 等公司事件。

## Event Calendars

**事件日历合集**（经济事件 + 财报 + 公司事件聚合），可按事件类型/地区/日期筛选。

## 关键要点

- **Fundamentals Explorer 是单标的最强研究工具**（10 子模块 + 200+ 比率）。
- **IMPACT Dashboard** 是"价值观投资"的可视化配置，**不要选太多 values**。
- **Orbisa** 是**机构级融券数据**，判断做空/轧空风险的关键工具。
- **Analyst Ratings** 提供 TipRanks 综合评级 + 升级/降级历史。
- **Daily Lineup** 是**早盘前必看**的事件概览。
- **Discover** 是第三方研究平台（Trading Central 集成）。
- **WSH / Event Calendars** 是事件驱动交易的关键数据源。
- 跨平台：多数功能在 Desktop TWS / Client Portal / IBKR Mobile 同步可用。

## 相关章节

- [Watchlist](watchlist.md) — Watchlist + IMPACT Effect / Flag 联动
- [市场扫描器](market-scanners.md) — 用基本面参数扫描（PE/PB/ROE 等）
- [Mosaic 布局](layouts.md) — 把多个基本面工具拼进 Mosaic
- [警报与通知](alerts-and-notifications.md) — 把基本面阈值变成条件警报

## 原文参考

源站 hub 页：[fundamental-analytics.htm](https://www.ibkrguides.com/traderworkstation/fundamental-analytics.htm) — 10 个子页：

- [IMPACT Dashboard](https://www.ibkrguides.com/traderworkstation/impact-dashboard.htm)
- [Fundamentals Explorer](https://www.ibkrguides.com/traderworkstation/fundamentals-explorer.htm)
- [Orbisa Securities Lending Analytics Dashboard](https://www.ibkrguides.com/traderworkstation/orbisa-securities-lending-dashboard.htm)
- [Analyst Ratings](https://www.ibkrguides.com/traderworkstation/analyst-ratings.htm)
- [Ownership Tear Sheet](https://www.ibkrguides.com/traderworkstation/ownership-tear-sheet.htm)
- [Daily Lineup](https://www.ibkrguides.com/traderworkstation/daily-lineup.htm)
- [Discover（Trading Central）](https://www.ibkrguides.com/traderworkstation/discover.htm)
- [Analyst Research and Market Commentary](https://www.ibkrguides.com/traderworkstation/analyst-research.htm)
- [WSH Corporate Event Calendar](https://www.ibkrguides.com/traderworkstation/wall-street-horizon-calendar.htm)
- [Event Calendars](https://www.ibkrguides.com/traderworkstation/event-calendars.htm)

附加资源：

- [IBKR Campus IMPACT 白皮书](https://www.interactivebrokers.com/download/impact_white_paper.pdf)
- [IBKR Campus Fundamentals Explorer 课程](https://ibkrcampus.com/trading-lessons/using-the-ibkr-fundamental-explorer/)
- [IBKR Campus Discover 课程](https://ibkrcampus.com/trading-course/discover-tool/)
