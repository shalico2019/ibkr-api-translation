# 新闻与研究（News & Research）

> 原文：[ibkrguides.com/traderworkstation/news.htm](https://www.ibkrguides.com/traderworkstation/news.htm)
> 最后更新于 2025-10-08

## 概述

TWS 的新闻（News）功能把多类新闻资讯聚合到统一面板中，让交易员无需离开 TWS 就能跟踪市场动态、个股新闻、研究报告、社交情绪和市场异常信号。本章将 News 按钮（旧版 TWS / Classic）和 Mosaic 界面的 News 面板（新版 TWS）合并介绍——两者承载同一套订阅，只是入口和外观不同。

!!! note "新闻与账户订阅"
    News 面板中能看到的资讯种类取决于你的 IBKR 账户订阅情况。许多新闻源（Newswire）是付费订阅的；未订阅的项目不会出现在可选列表中。订阅管理统一在 **Manage Subscriptions**（订阅管理）标签页进行。

---

## 入口

### Classic TWS：News 按钮（旧版）

旧版 TWS 的 News 按钮位于 **Anchor Window**（锚定窗口）顶部：

1. 在锚定窗口顶部找到 **News** 按钮，点击其右侧的下拉箭头。
2. 在弹出的菜单中将光标悬停在 **Newswire**（新闻专线）上。
3. 在展开的子菜单中选择你要查看的具体新闻类型（例如 Dow Jones、Reuters、Refinitiv、Broad Tape 等）。

!!! tip "适用场景"
    习惯旧版 TWS 布局、或者用 IBKR Legacy TWS 的交易员可直接用此入口；新版 TWS 用户请走下面的 Mosaic News 面板。

### Mosaic 界面：News 面板（新版）

新版 TWS Mosaic 把所有新闻源聚合到独立的 **News 面板**：

1. 点击面板左上角的 **+** 图标，弹出添加新闻源列表。
2. 从列表中勾选要加入面板的源（一次可加多个）。
3. 已添加的源会作为面板内的独立标签页或滚动流显示。
4. 点击面板右上角的 **Settings**（设置）图标可配置过滤条件，例如只显示某资产类别或某发布机构的内容。
5. 点击任意 **headline**（标题）即可阅读完整新闻。

**面板的三个主要图标说明：**

- **+**（左上角）：添加新的新闻源到当前面板。
- **Settings**（设置）：按 Provider、Importance、Source、Asset Class、Article Length、Language、Date Published 等维度过滤。
- 标题列表：点击进入全文阅读。

---

## 可订阅的新闻源类型

点击 **+** 后，IBKR News 面板提供以下几大类信息流：

### 1. News & Research（新闻与研究）

聚合型入口，整合 7 个子标签页：

- **Daily Overview**（每日总览）：当日重要市场新闻摘要。
- **Portfolio News**（持仓新闻）：与你当前账户持仓相关的新闻。
- **Watchlist News**（自选股新闻）：与自选列表中的合约相关的新闻。
- **Read Later**（稍后阅读）：保存备查的新闻。
- **Browse**（浏览）：按资产类别和主题浏览。
- **Manage Subscriptions**（订阅管理）：管理付费新闻订阅。
- **Language Settings**（语言设置）：切换新闻语言。

视图可在杂志版（magazine-style，图文混排）和标题流（headlines，纯标题快读）之间切换——切换按钮在面板最右侧的 **Layout** 图标。

### 2. Company Specific News（公司专有新闻）

针对单一公司展示实时滚动新闻头条：

1. 点击 **+** → 选择 **Company Specific News**。
2. 在弹出的 **Company News** 标签页中输入股票代码（ticker symbol），回车确认。
3. 新闻流仅显示该公司的资讯。

该面板集成了 **Alexandria Contextual Text Analytics™ Engine (ACTA™)** 的情感（Sentiment）与置信度（Confidence）排名，显示在 **Rank** 列中：

- **绿色** 表示正面情绪，数值 0-1，越接近 1 表示置信度越高。
- **红色** 表示负面情绪，数值 -1-0，越接近 -1 表示置信度越高。

许多标题在 ticker 后面会直接带情感标签，例如：`12:13 SS XYZ Positive - Company XYZ Price Target Raised to $120.`

### 3. Filtered Feed（按主题 / 提供商过滤的资讯流）

可按主题过滤的实时资讯流，**支持集成 Market Signals（市场信号）**——见下文。

1. 点击 **+** → 选择 **Filter Feed (by topic/provider)**。
2. 在出现的过滤界面中按资产类别、主题、提供商筛选。

!!! warning "窗口组限制"
    Filtered Feed 窗口**不能**加入窗口组（windows group）。如果需要和其他窗口联动显示同一标的，请改用其他新闻源。

### 4. Portfolio & Watchlist News（持仓与自选股新闻）

针对下列三组标的同时显示新闻：

- 当前账户持仓中的公司，以及这些公司的竞争对手。
- 自选列表（Watchlist）和 Quote Monitor（行情监控器）中的所有合约，以及其竞争对手。
- 用户自定义的合约清单。

操作步骤：

1. 点击 **+** → 选择 **Portfolio & Watchlist News**。
2. 在弹窗中选择要加入的新闻范围（持仓 / 自选股 / 自定义列表），按 **OK** 确认。
3. 新闻流立即填入面板。

### 5. Broad Tape News（综合新闻流）

汇总所有已订阅新闻专线（newswires）的资讯，不做主题过滤。点击 **+** → 选择 **Broad Tape News** 即可添加。

### 6. Today's Top Ten（今日十大新闻）

从 Dow Jones、StreetInsider、Reuters、Refinitiv 四家主要提供商中各取当日十大新闻头条。

1. 点击 **+** → 选择 **Today's Top Ten**。
2. 在弹窗中选择要看哪家提供商的 Top News。
3. 点击任一标题即可阅读全文。

### 7. Bloomberg TV News Feed（彭博电视新闻流）

可在 TWS 内直接观看彭博电视（Bloomberg TV）的实时视频流。

1. 点击 **+** → 将光标悬停在 **Videos** 上。
2. 选择 **Bloomberg TV**。
3. 点击播放图标开始观看。
4. 视频窗口左下角的 **Video** 按钮可在纯音频和音视频之间切换；右下角的全屏图标可放大到全屏。

### 8. Traders' Insight News Feed（交易员洞察）

IBKR 的 **Traders' Insight** 栏目由交易员和行业撰稿人提供每日全球市场评论，**IBKR Quant Blog**（盈透量化博客）也整合在同一入口下。

1. 点击 **+** → 将光标悬停在 **News & Research from IBKR** 上。
2. 选择 **Traders Insight**。
3. 浏览 **Traders' Insight** 新闻流（支持文字和视频内容）。

### 9. Market Signals（市场信号）

IBKR 数据服务器持续扫描市场的异常价格 / 成交量行为，并以 **Market Signal**（市场信号）提醒的形式推送到 TWS。可识别的信号包括：价格尖峰（price spikes）、异常成交量尖峰（irregular volume spikes）、52 周新高 / 新低、看跌 / 看涨比率（put/call ratio）尖峰、停牌（trading halts）等。

- Market Signals 既可作为**独立窗口**查看，也可**集成到 Filtered News 窗口**。
- 默认情况下，**Gap On Open**（开盘跳空）信号已在 Filtered News 窗口中激活。

**作为独立窗口：**

1. 点击 **+** → 将光标悬停在 **News & Research from IBKR** 上。
2. 选择 **Market Signals**。
3. 浏览推送的信号列表。

**集成到 Filtered News 窗口：**

1. 打开 Filtered Feed 标签页。
2. 点击面板右上角的 **Configure wheel**（配置齿轮）图标。
3. 选择 **Settings**。
4. 在 **News: STK** 分类下，勾选 **IB Market Signals**。
5. 点击 **Apply** → **OK** 保存。

### 10. Social Sentiment（社交情绪）

社交情绪（Social Sentiment）新闻以 **`SS` 前缀**标识。配置步骤：

1. 点击 **+** → 选择 **Social Sentiment**。
2. 首次使用会提示 **View Settings**（查看设置），点击进入。
3. 选择要应用的过滤条件。
4. 点击 **Apply** → **OK** 完成配置。

---

## 关键要点

- **新闻源与账户订阅挂钩**：未订阅的付费源不会出现在可选列表，先到 **Manage Subscriptions** 标签页检查订阅状态。
- **情感分析有置信度**：ACTA 引擎的 Rank 数值并非简单"是 / 否"，而是带置信度（0-1）的连续值。读 0.3 的正面和 0.9 的正面要区别对待。
- **Filtered Feed 不可分组**：如果你希望"切换合约 → 新闻自动跟随"，请改用 Portfolio & Watchlist News 或 Company Specific News，并搭配 [颜色联动（Color Grouping）](color-grouping.md)。
- **Market Signals 是免费信号源**：和大多数付费 Newswire 不同，IBKR Market Signals 对所有 TWS 用户开放，是观察异常行情的轻量工具。
- **公司专有新闻与"颜色联动"配合常用**：把 News 面板设为 Destination、订单输入面板设为 Source，可在交易某只股票时自动显示该股票新闻。

---

## 相关章节

- [颜色联动 Color Grouping](color-grouping.md)——用颜色组实现 News 面板跟随订单输入
- [市场数据（Market Data）](market-data.md)——实时报价的订阅与显示
- [行情监控（Watchlist）](watchlist.md)——自选列表管理与新闻联动
- [TWS 入门概览](getting-started.md)——TWS Mosaic 与 Classic 布局
- [Mosaic 工作区](mosaic.md)——理解 Mosaic 面板与窗口组

---

## 原文参考

- 主源页：<https://www.ibkrguides.com/traderworkstation/classic-news.htm>（Classic TWS News 入口，2025-10-08）
- 详细源页：<https://www.ibkrguides.com/traderworkstation/news-panel.htm>（Mosaic News 面板全功能，2026-05-06）
- 翻译整合方式：本章把两页内容合并，Classic TWS 的 News 按钮作为"旧版入口"一节保留，Mosaic 面板的全部 10 类订阅作为主体内容呈现。
