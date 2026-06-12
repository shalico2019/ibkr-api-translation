# Portfolio 菜单（投资组合入口）

> 原文：[ibkrguides.com/ibkrdesktop/portfolio-icon.htm](https://www.ibkrguides.com/ibkrdesktop/portfolio-icon.htm)
> 最后更新于 2025-10-07

!!! warning "原文链接当前正文为空"
    源站 `portfolio-icon.htm` 当前**只有标题 "Portfolio" + 一个空的迷你目录盒**（MadCap Flare 占位页）。本章节基于 IBKR Desktop 公开介绍、IBKR Campus 教程以及兄弟章节（[查看持仓](view-positions.md)、[查看余额](view-balances.md)、[订单与成交](orders-and-trades.md)）交叉整理，标注"待补"。

## 概述

**Portfolio**（投资组合）是 IBKR Desktop 中打开整个账户监控面板的入口图标，位于 IBKR Desktop 主界面**左上角**，是一个带图表/钱包图样的小图标。点击它会在主区域弹出 Portfolio 侧边面板，集中展示你这只账户当前的全部状态：

| 标签页 | 中文名 | 详细说明 |
|--------|--------|----------|
| **Positions** | 持仓 | 当前账户里所有未平仓头寸（[查看持仓](view-positions.md)） |
| **Orders** | 订单 | 当前挂在市场上的活动订单（[订单与成交](orders-and-trades.md)） |
| **Trades** | 成交 | 当日已执行的成交记录（[订单与成交](orders-and-trades.md)） |
| **Balances** | 余额 | 账户资金、保证金、市值汇总（[查看余额](view-balances.md)） |

!!! note "界面位置"
    IBKR Desktop 主窗口 **左上角** → **Portfolio** 图标（一个小型投资组合/折线图图标）。点击后主区域切换为 Portfolio 面板，顶部显示上述 4 个标签页。

---

## 打开 Portfolio 面板

1. 进入 IBKR Desktop 主窗口。
2. 点击左上角的 **Portfolio** 图标（看起来像一个小折线图或钱包）。
3. 主区域会展开 Portfolio 面板，默认进入 **Positions** 标签页。
4. 顶部切换 **Positions / Orders / Trades / Balances** 四个标签页，分别查看不同维度。

!!! tip "为什么所有 P0 章节都从 Portfolio 进入？"
    IBKR Desktop 采用"单页工作流"设计——账户监控、订单管理、成交回看全部集中在一个 Portfolio 面板里，**不再像 TWS 那样弹几十个独立窗口**。这也是它与 TWS Mosaic 最显著的体验差异。

---

## Portfolio 包含的 4 个标签页（分工）

### 1. Positions（持仓）

列出你账户里**当前持有的所有合约**，每一行是一条持仓，含代码、数量、成本、市价、未实现盈亏等列。具体字段、可配置的列、分组视图、过滤器、排序方式 → 见 [查看持仓](view-positions.md)。

### 2. Orders（订单）

列出当前**还在挂单状态**的活动订单（尚未成交、未撤销、未过期）。右键一条订单可以 **取消（Cancel）**、**修改（Modify）**、**复制为新单（Clone）** 等。详细操作 → 见 [订单与成交](orders-and-trades.md)。

### 3. Trades（成交）

列出**已执行**的成交记录（含当日已撤销的过期单）。这是事后核对成交价、手续费、滑点的入口。详细操作 → 见 [订单与成交](orders-and-trades.md)。

### 4. Balances（余额）

按账户/币种汇总显示关键资金数字：**Net Liquidation（净资产）**、**Available for Trading（可用资金）**、**Buying Power（购买力）**、**Margin Requirement（保证金要求）**、**Market Value（市值）** 等。详细字段 → 见 [查看余额](view-balances.md)。

!!! info "对照 TWS"
    TWS Mosaic 中，这些信息分散在 **Monitor Panel（监控面板）** 的 Portfolio / Activity / Account 三个标签页，以及独立的 **Account Window（账户窗口）**。IBKR Desktop 把它们**合并到一个 Portfolio 面板 + 4 个标签页**——这是简化设计的核心。

---

## 关键要点

- Portfolio 图标在 IBKR Desktop **任何页面**都能点击进入——它是账户监控的全局入口。
- 4 个标签页的**数据都是实时刷新**的（默认每几百毫秒更新一次），适合在快速行情下盯盘。
- 你随时可以**关闭 Portfolio 面板**回到原页面，不影响交易工作流——这一点和 TWS Mosaic 的强制布局不同。
- 顶部的 **Search/Filter** 框和右上角的 **Configure（齿轮图标）** 在每个标签页都有——可配置显示列、应用过滤、保存自定义视图。

---

## 相关章节

- [查看持仓（Positions）](view-positions.md)
- [查看余额（Balances）](view-balances.md)
- [订单与成交（Orders & Trades）](orders-and-trades.md)
- [快速下单（Rapid Order Entry）](rapid-order-entry.md)
- 外部：[IBKR Campus - IBKR Desktop Interface](https://ibkrcampus.com/trading-course/ibkr-desktop/)
- 外部：[IBKR Desktop 产品页](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/portfolio-icon.htm>
- 最后更新：2025-10-07
- **原文状态**：源站当前**只有标题，正文为 MadCap Flare 占位页**（`<h1>Portfolio</h1>` 后跟一个空的 `<div class="MCMiniTocBox_0 miniToc nocontent">`）。本文内容基于兄弟章节 + IBKR Campus 公开资料整理。
- 引用图片：`resources/images/portfolioicon.png`（Portfolio 菜单图标）
- 信息缺口：
    1. Portfolio 图标在不同主题（浅色/深色）下的精确样式 → 暂以"折线图/钱包图样"描述
    2. Portfolio 面板是否支持自定义默认标签页 → 待官方文档补充
