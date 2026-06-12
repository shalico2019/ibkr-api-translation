# 图表（Charts）

> 原文索引：[ibkrguides.com/ibkrdesktop/chart.htm](https://www.ibkrguides.com/ibkrdesktop/chart.htm)
>
> !!! note "本章为聚合翻译"
>     源站 `chart.htm` 本身是一个**目录页**（MadCap Flare 自动生成），下挂多个子章节。本章综合 `charts-summary.htm`、`transmit-orders-chart.htm`、`multi-charts.htm` 三页内容，并附 `chart-indicators.htm`（技术指标字典）作为参考表。

## 概述

**图表（Charts）** 是 IBKR Desktop 内置的**基础图表工具**，可以直接在布局（Layout）内打开标的走势、添加技术指标、绘制趋势线、从图表内下单、并支持**多图联动**。本章聚焦**基础图表**（区别于 IBKR 独立高级图表产品 **Advanced Charts**——后者为独立产品，UI 与本章节介绍的窗格图表不同）。

IBKR Desktop 的图表与 TWS 的差异：

- **IBKR Desktop**：图表是**布局内的窗格**（pane），可与自选列表、订单、新闻等并列摆放，并通过 Layout 整体保存。
- **TWS**：图表同样是窗格（出现在 Mosaic 区域内），但 IBKR Desktop 的图表**UI 更紧凑、操作链更短**——行情查询、图表、订单可在同一布局内完成。

## 一、打开图表与时间周期

### 调整时间周期（Time Period）

图表左下角提供**时间周期按钮**（1 分钟、5 分钟、1 小时、日、周等），点击即可切换显示的时间跨度。

如果需要**指定日期或自定义日期范围**，点击旁边的小**日历图标**，在弹出的日期选择器中选取起止日期。

### 切换图表粒度（Periodicity）

图表**左上角**的"周期"菜单，用于在**日内**与**日/周/月**等不同粒度之间切换——例如从"5 分钟"切到"1 日"。

图示描述：左上角一个下拉框，列出 1 min / 5 min / 1 hour / 1 day / 1 week 等粒度选项。

## 二、图表类型（Chart Type）

通过图表上方的**类型图标**（一排小图标）切换图表类型，可选包括：

- **Bars（柱状图）**：OHLC 柱线。
- **Candles（K 线/蜡烛图）**：实体蜡烛表示开收价。
- **Hollow Candles（空心 K 线）**：上涨为空心，下跌为实心。
- **Volume Candles（带成交量的 K 线）**：K 线宽度随成交量变化。
- **Lines（折线）**：仅收盘价连线。

## 三、技术指标（Chart Indicators）

点击图表上方的**指标（Indicators）按钮**，在弹窗中**搜索**或**选择**要叠加的技术指标，例如 MACD、RSI、布林带（Bollinger Bands）、均线（Moving Average）等。

图示描述：图表顶部一个带 fx / 公式符号的按钮；点击后弹出"添加指标"对话框，左侧是指标分类树，右侧是参数设置。

**指标模板（Indicator Template）**：当在图表上叠加了一系列指标后，可以点击**四宫格图标**将当前指标组合**保存为模板**，命名后即可重复调用（点击同一图标重新加载模板）。

> 详细指标字典见本项目 [图表技术指标字典](chart-indicators.md)（来源：`chart-indicators.htm`）——内含 100+ 指标的字段说明，例如 MA、EMA、MACD、RSI、布林带、KDJ（随机指标）、一目均衡表（Ichimoku Cloud）、VWAP 等。

## 四、绘图工具（Drawing Tools）

绘图工具默认**隐藏在图表左下角的蓝色箭头**后面。点击该箭头展开**绘图工具面板**。

可绘制内容包括：

- **趋势线（Trend Line）**
- **斐波那契回撤（Fibonacci Retracement）**
- **通道、标注**等

**使用提示**：把鼠标悬停在某个工具图标上，若该工具有扩展菜单，会自动弹出。**删除**已绘制的线条：在趋势线或斐波那契上**右键** → 选择 **remove**。

## 五、热点新闻（Hot News）

图表工具栏上的 **Hot News** 图标，用于显示**当前图表标的**相关的最新新闻列表。

图示描述：图表顶部一个新闻 / 喇叭形状的图标，点击后在图表下方或侧边展开新闻流。

## 六、图表定制（Customization）

点击图表**右上角**的**齿轮图标**（Chart Settings），可定制：

- **配色**：涨跌色、背景色、网格色。
- **标签**：坐标轴标签、价格标签。
- **背景**：深色 / 浅色主题。
- **网格线**：是否显示及粗细。
- **其它**：字体、缩放精度等。

## 七、放大图表（Enlarge Chart）

使用图表两侧**侧栏图标**（左右各一个）可将图表**单侧或双侧放大**——即把相邻窗格暂时收窄，让图表占据更大可视区域，便于精细查看。

## 八、保存与加载图表快照（Save / Load Chart Snapshot）

### 保存图表快照

1. 点击图表顶部的**保存图标**（Save Chart Snapshot）。
2. 为此快照起一个名字。
3. 快照会保存**图表窗口的所有状态**——包括多图布局、所有合约、指标、时间周期、K 线粒度等。

### 加载图表快照

1. 点击保存图标**右侧的文件夹图标**（Load Chart Snapshot）。
2. 从下拉列表中选择要恢复的快照。
3. 布局整体还原到该快照对应的状态。

> 用途：跨交易日保留自己的看盘布局；把同一个分析视角快速应用到不同标的。

## 九、盘后时段（Outside RTH）

启用 **Outside RTH**（Regular Trading Hours 之外），即可在图表中查看**盘前 / 盘后**成交。

### 操作步骤

1. 点击图表顶部的**时钟图标**启用或停用 Outside RTH。
2. 此图标**仅在日线（1 day）及更大粒度图表上可用**。
3. 小于日线的粒度（分钟、小时）若需查看盘前盘后，请改用 [扩展交易时段（Extended Trading Hours）](extended-trading-hours.md) 功能。

## 十、从图表内下单（Create and Transmit Orders in Charts）

图表支持**在 Y 轴价格附近直接挂单**，免去打开独立下单面板的步骤。

### 操作步骤

1. 点击屏幕**左上角**的 **Quote** 菜单图标。
2. 在左上角的 **Portfolio 下拉菜单**中选择**自选列表 / 持仓 / 筛选器**作为合约来源。
3. 从列表中选择要交易的合约。
4. 图表加载到页面中部。
5. 将鼠标悬停在 **Y 轴**附近的目标价格点，**点击出现的 "+" 号**。
6. 选择 **Buy（买入）** 或 **Sell（卖出）**。
7. 下单面板（**Order Ticket**）自动填入所选价格参数，可在提交前修改数量、订单类型等。
8. 点击 **Submit Buy Order** 或 **Submit Sell Order** 提交。
9. 订单进入工作（working）状态后，可**点击图中的 Buy / Sell 框并上下拖动**调整价格——**新订单会立即替换原订单并自动提交**，**没有 Order Preview 二次确认**。可在提交前调整，也可在已挂订单期间调整。

> 风险提示：拖动改价会自动替换并直接发送（无二次确认），下单前务必确认目标价与数量。

## 十一、多图联动（Multi-Charts）

IBKR Desktop 支持**最多 8 个图表**同屏显示，可以是同一标的的不同时间周期，也可以是不同标的的对比视图。

### 操作步骤

1. 在图表**右上角**勾选 **multi-chart** 复选框。
2. 在弹出的下拉中选择**图表数量**（最多 8 个）。
3. 同一行可以切换 **Symbol / Interval / Crosshair** 三个**同步开关**。
4. 多图按所选数量排布到图表区。

### 同步模式说明（Sync Multi-Chart Mode）

多图模式下，**三个维度的同步**可以分别控制：

- **Symbol**：开启后，所有图表**使用同一合约**。
- **Interval**：开启后，所有图表**使用同一 K 线粒度**。
- **Crosshair**：开启后，**十字光标在所有图表间联动**——在一个图表中移动光标，其它图表同步显示对应时间点。

> 用法：对比同一标的不同周期（一屏看 5 分钟、1 小时、日线三联），开 Symbol+Crosshair；做多标的联动观察，开 Crosshair 即可。

## 关键要点

- **基础图表 ≠ Advanced Charts**：Advanced Charts 是 IBKR 独立的进阶图表产品（带更多画线、第三方指标、联动交易功能），通过 IBKR 官网的 Advanced Charts 入口访问，**不在** Desktop 窗格图表的功能范围内。
- **保存快照 = 整体布局存档**：保存的不是单张图，而是多图布局 + 全部参数；适合交易日复盘与跨标的复用。
- **盘后图标限制**：Outside RTH 钟形图标**仅在日线及以上粒度**显示；分钟级粒度改用 Extended Trading Hours。
- **图表内改价无二次确认**：拖动 Buy / Sell 框调整价格会**立即替换并自动提交**原订单，**没有 Order Preview**，务必先确认光标位置再松开鼠标。
- **指标可模板化**：把多个指标的组合保存为模板，一次调用复用整组叠加。

## 相关章节链接

- [图表技术指标字典](chart-indicators.md)（指标字段说明）
- [多图表（Multi-Charts）](https://www.ibkrguides.com/ibkrdesktop/multi-charts.htm)（源站链接）
- [扩展交易时段（Extended Trading Hours）](extended-trading-hours.md)
- [自选列表（Watchlist）](watchlists.md)
- [布局设置（Layout Settings）](layout-settings.md)

## 原文参考

本章为聚合翻译，源站原始章节为 MadCap Flare 目录页 + 三个子页 + 一个技术指标字典：

- 主索引页：[https://www.ibkrguides.com/ibkrdesktop/chart.htm](https://www.ibkrguides.com/ibkrdesktop/chart.htm)（MadCap 目录页，正文只有"Find out more about the IBKR Desktop Charts in the topics below:"一行，需 drill down）。
- 子页一 [Charts Summary](https://www.ibkrguides.com/ibkrdesktop/charts-summary.htm)：时间周期、图表类型、指标、绘图工具、热点新闻、定制、放大、保存、盘后。
- 子页二 [Create and Transmit Orders in Charts](https://www.ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm)：从图表内下单、价格拖动改价。
- 子页三 [Multi-Charts](https://www.ibkrguides.com/ibkrdesktop/multi-charts.htm)：最多 8 图同屏、Symbol/Interval/Crosshair 三维联动。
- 字典页 [Chart Indicators](https://www.ibkrguides.com/ibkrdesktop/chart-indicators.htm)：100+ 技术指标的字段说明（已独立翻译为 [chart-indicators.md](chart-indicators.md)）。

> 反查方法：抓 `https://www.ibkrguides.com/ibkrdesktop/Data/Tocs/Primary_Chunk0.js` 后用正则 `'path.htm':{i:[idx],t:['Title']}` 找 "Charts" 节点下平级条目，定位到上述四个子页。源站更新日期：2025-10-07。
