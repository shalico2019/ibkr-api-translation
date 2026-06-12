# 自选列表（Watchlist）

> 原文：[ibkrguides.com/ibkrdesktop/watchlists.htm](https://www.ibkrguides.com/ibkrdesktop/watchlists.htm)

## 概述

**自选列表（Watchlist）** 用来在一屏内跟踪多个标的的价格与表现，并在所有盈透交易平台之间**自动同步**。每个标的的报价点旁以**颜色圆点**标识涨跌（红跌绿涨为常见配色，具体配色取决于主题），对任一合约**右键**可以打开交易与分析工具的快捷菜单，以及对自选列表本身做编辑。

IBKR Desktop 的自选列表与 TWS（TWS，Trader Workstation 盈透经典交易终端）的实现方式有明显差异：

- **IBKR Desktop**：自选列表是当前 **Layout（布局）** 内的一个**窗格（pane）**，可与图表、订单、新闻等窗格自由组合、并列或停靠到布局的任意侧边。
- **TWS**：自选列表是独立窗口（独立的可关闭窗口），通过 Mosaic 组合在主工作区内，不参与 pane 级别的多视图拼接。

如果来自 TWS 的用户，可以把 Desktop 的自选列表理解为"TWS 自选窗口 + 任意布局位置 + 多窗格协同"。

## 创建新自选列表

### 操作步骤

1. 点击屏幕**左上角**的 **Watchlist** 菜单图标（带表头的小图标）。
2. 在弹出的列表左**上角**点击 **+** 号。
3. 在弹窗底部选择 **New Watchlist**（新建自选列表）。
4. 进入空表后，再次点击 **+** 号即可开始添加合约。

图示描述：

- 第 1 步：界面左上角出现一个手表形状的菜单图标，悬停后展开下拉。
- 第 2 步：下拉里出现带加号的小方块按钮。
- 第 3 步：底部出现 "New Watchlist" 文字按钮。
- 第 4 步：表内第一行空出等待输入合约代码。

## 向自选列表添加合约

### 操作步骤

1. 在空白行输入**合约代码（symbol）**，按 **Enter**。
2. 系统会按交易所排序展开**资产类型列表**。例如 Apple（NASDAQ - Apple Inc 股票）会出现在最前，随后列出其它可选交易所/合约类型。
3. 从下拉列表中选择要交易的合约。
4. 选中的合约被加入到自选列表。

## 切换列表视图

自选列表右上角有一个 **Watchlist Views**（自选列表视图）下拉菜单，可在以下视图之间切换：

- **Watchlist View**：默认报价视图，实时显示最新价、涨跌、成交量等。
- **Performance（表现）**：按指定周期显示涨跌幅排行。
- **Dividend Focus（股息聚焦）**：突出股息率、派息日等股息相关字段。
- **Fundamentals（基本面）**：呈现市盈率、营收、负债率等基本面指标。
- **Create New View（新建视图）**：自定义列。

### 操作步骤

1. 点击右上角的 **Watchlist Views** 下拉。
2. 选择所需的视图类型。
3. 选择 **Create New View** 时，会出现**可用列**（Available Columns）面板。
4. 在面板中找到目标列，点击列名前的 **+** 号即可加入视图。

## 关键要点

- **跨平台同步**：自选列表在 IBKR Desktop、TWS Client Portal 网页端等多个平台间**自动同步**（前提是登录同一账户）。
- **右键菜单**：在任一代码上右键，可快速新建订单、查看图表、查看详情页、移除合约等——这是自选列表与详情页（Quote Details）之间的高频跳转入口。
- **视图自定义**：通过 Create New View 可以只保留自己关注的列，避免一屏过宽被迫横向滚动。
- **配色与可见性**：涨跌色点为视觉提示，但**实际数值**仍以报价列显示，色觉障碍用户也能正常识别。

## 相关章节链接

- [快速下单（Rapid Order Entry）](rapid-order-entry.md)
- [合约搜索（Contract Search）](contract-search.md)
- [行情详情（Quote Details）](quote-details.md)（若项目内已存在）
- [布局设置（Layout Settings）](layout-settings.md)

## 原文参考

本章翻译综合自以下源站：

- 主源页：[https://www.ibkrguides.com/ibkrdesktop/watchlists.htm](https://www.ibkrguides.com/ibkrdesktop/watchlists.htm)（"Watchlist" 主章节，2025-10-07 更新）
- TOC 索引（MadCap Flare）：通过 `https://www.ibkrguides.com/ibkrdesktop/Data/Tocs/Primary_Chunk0.js` 反查得到相邻主题，包括 "Predefined Watchlists"、"Multi-Charts"、"Create and Transmit Orders through the Watchlist" 等。

> 备注：IBKR Desktop 的自选列表在产品迭代中常出现**视图改名**或**右键菜单项调整**，以客户端实际显示为准。
