# 预设与自定义布局

> 原文：[ibkrguides.com/traderworkstation/predefined-layouts.htm](https://www.ibkrguides.com/traderworkstation/predefined-layouts.htm)
> 最后更新于 2025-10-08

## 概述

TWS 的工作区由若干"布局"组成，每个布局是一组窗口的集合（如行情、图表、订单簿、新闻等）。IBKR 在 **Layout Library（布局库）** 中内置了若干"预设布局"，按交易场景打包好一组窗口与工具，开箱即用。任何预设布局都可以作为起点，进一步自定义成你自己的工作区。

预设布局覆盖以下场景：期权交易、图表交易（短线/长线）、股票扫描、订单+投资组合、外汇交易、新闻、市场概览、BookTrader 价格阶梯下单。

## 添加预设布局

1. 点击 TWS 窗口底部标签栏最右端的 **+** 图标（New Tab，新标签页）。
2. 在弹出的 New Tab 面板里点 **Browse**（浏览），打开 Layout Library 面板。

    > 图示说明：在 TWS 底部标签栏右侧的"+"按钮上点击后会弹出一个面板，面板下方有一个名为 "Layout Library" 的区域，里面有 "Browse" 按钮，点击进入布局库。

3. 在 Layout Library 列表中找到想要的布局类型，点击下方的 **Add Layout** 按钮。

    > 图示说明：Layout Library 列出所有可用预设布局，每条布局下方都有一个 "Add Layout" 按钮，点击后该布局会被添加到当前窗口的标签栏中。

## 预设布局类型（Layout Types）

以下预设布局按用途分类，每个布局都预先配置好对应的窗口组合与工具。

### 期权交易（Option Trading）

通过 **Option Chain（期权链）** 创建期权订单，或使用 **Strategy Builder（策略构建器）** 组合多腿期权策略。

> 图示说明：左侧为期权链窗口，列出到期日、行权价对应的看涨/看跌合约 bid/ask 报价；右侧为策略构建器/订单输入面板，可拖拽构建 Spread、Straddle 等组合。

### 图表交易 – 短线（Chart Trading – Short Term）

基于一组**短线图表**（短周期 K 线）+ 预配置的技术指标做决策。可以在任意图表上**单击某个价位直接下单**。

> 图示说明：屏幕被划分成 2-4 个并排的小图表窗口，每个窗口对应同一标的或不同标的的短周期图表（如 1 分钟、5 分钟），带 MA、Volume 等指标；订单行直接画在图表上，点击即可下单/改单。

### 股票扫描器（Stock Scanner）

使用可自定义的扫描器筛选市场机会，查看研究、基本面、分析师预测后再决定是否建仓。

> 图示说明：顶部为扫描器主面板，左侧列出筛选条件（市值、PE、收益率、板块等），右侧为符合条件的结果列表，每行带代码、价格、基本面关键指标。

### 订单+投资组合（Order Entry With Portfolio）

同一屏并排显示账户摘要（Account Summary）与持仓明细（Portfolio），可对任意持仓品种快速下单。投资组合旁并排显示当日市场表现。

> 图示说明：左侧是账户摘要与持仓列表（带未实现盈亏、当日盈亏），右侧是订单输入面板/订单簿，底部是与持仓并排的当日大盘/个股表现条。

### 图表交易 – 长线（Chart Trading – Long Term）

基于一组**长线图表**（日线/周线）+ 预配置的技术指标和基准指数做决策。同样支持图表上单击下单。

> 图示说明：与短线版本类似，但图表周期更长（Daily/Weekly），并叠加基准指数对比（如 SPX）和中长期指标（200 日均线、RSI 等）。

### 外汇交易（FX Trading）

通过 **FXTrader**（外汇交易器）一键创建外汇即期和外汇期货订单，FXTrader 已预配置主流外汇对和外汇期货合约。同时显示经济日历与外汇新闻流。

> 图示说明：FXTrader 是 TWS 的外汇专用下单面板，左侧为货币对报价网格（点阵报价），中间为订单输入区，右侧为经济日历和路透外汇新闻流。

### 新闻（News）

集中展示行情相关新闻：Street Insider Top News、Bloomberg TV、Portfolio News（与你持仓相关的新闻）、Social Sentiment（社交情绪指标）等。

> 图示说明：新闻窗口被分成多个标签页（一般市场、Bloomberg TV 直播、Portfolio News、Social Sentiment），可逐页浏览或同时并排显示。

### 市场概览（Markets）

跨市场总览：全球主要指数自选列表 + 欧洲、亚洲、美国市场的 Top Movers（涨跌幅排行）。

> 图示说明：屏幕分成上下两块。上半部分是全球指数报价行（道指、标普、恒指、日经等）；下半部分是各区域 Top Movers 排行榜（涨幅、跌幅、活跃股）。

### BookTrader 价格阶梯下单（Book Trading）

使用 **BookTrader**（价格阶梯 / 价格梯）针对**单一合约**下单。BookTrader 旁边附带合约选择工具（Contract Selector），可快速切换要交易的标的。

> 图示说明：BookTrader 是一个垂直价格阶梯窗口，中心是当前最优买卖价，上下逐档列出买/卖价与挂单量；右侧/顶部是合约选择器，可切换代码。

## 自定义布局

预设布局只是起点，几乎所有窗口的尺寸、位置、显示字段都可以调整：

- 拖动窗口之间的边界，改变大小
- 把窗口拖到新的位置或合并到另一个标签页
- 通过 **File → Save Layout As…** 把当前组合另存为新布局
- 通过 **File → Open Layout…** 或底部标签栏切换布局
- 通过 **File → Delete Layout…** 删除不需要的布局

## 关键要点

- **预设布局不可修改**：Layout Library 中的预设布局是只读模板，加载后请用 **Save Layout As…** 另存为新名字再做自定义。
- **共享与同步**：保存到本地的布局文件位于 TWS 配置目录，复制到其他机器同样目录可复用。
- **链接窗口（Window Linking）**：同一布局内的多个窗口可以通过颜色分组（Color Linking）联动——在某窗口切换合约时，相同颜色的所有窗口同步切换。
- **Classic TWS 与 Mosaic 互通**：预设布局在两个界面下都可以加载。

## 相关章节链接

- [Mosaic 界面](mosaic.md) —— Mosaic 是 TWS 的默认界面，预设布局基于它组织
- [快捷键](hot-keys.md) —— 在自定义布局中用快捷键快速切换标签页、传输订单
- [滚动行情条 Ticker Tape](ticker-tape.md) —— 在布局顶部加一条横向滚动的报价带
- [自选列表](watchlist.md) —— 自选列表是绝大多数预设布局的核心窗口之一
- [图表](charts.md) —— 图表交易系列预设布局的底层工具

---

## 原文参考

> 本节保留源站 `https://www.ibkrguides.com/traderworkstation/predefined-layouts.htm` 的关键原文段，便于核对翻译准确性。
>
> 原文最后更新：October 8, 2025。

### Instructions（原文）

> You may use the layout library to browse and add any predefined layouts. These have been listed below.

### To Add a Predefined Layout（原文步骤）

1. Click the **+** icon at the end of the tabset along the bottom of the TWS Window.
2. Click the **Browse** button under Layout Library.
3. Click **Add Layout** below the Layout type you would like to add.

### Layout Types（原文逐条说明）

- **Option Trading** —— Create option orders using the Option Chain or option strategies using the Strategy Builder.
- **Chart Trading – Short Term** —— Make trading decisions using a sequence of short-term charts with preconfigured technical analysis. Trade with a single click at a price point in any chart.
- **Stock Scanner** —— Scan the markets for new opportunities with this customizable scanner. See comprehensive research, check fundamentals and analyst forecasts before you invest.
- **Order Entry With Portfolio** —— See at-a-glance account summary and position detail in your portfolio, and quickly trade any asset type. View today's market performance side by side with any security in your portfolio.
- **Chart Trading – Long Term** —— Make trading decisions using a sequence of longer-term charts with preconfigured studies and benchmark indices. Trade with a single click at a price point in any chart.
- **FX Trading** —— Create forex spot and futures orders with a single click from the FXTrader, which is preconfigured with popular fx pairs and futures. Stay on top of economic events and forex news with event calendars and streaming news feeds.
- **News** —— Stay tuned with current news using Street Insider Top News, Bloomberg TV, Portfolio News, Social Sentiment and more.
- **Markets** —— Stay on top of activity across the world's markets with a comprehensive watchlist of world indices and an up-to-the-minute list of Top Movers throughout Europe, Asia and the US.
- **Book Trading** —— Create orders for a single instrument from the BookTrader "price ladder". Attached tools help you quickly select the asset you want to trade.

### Additional Resources（原文资源链接）

- [Learn About Trader Workstation at IBKR Campus](https://ibkrcampus.com/trading-course/tws-for-beginners/)
- [Visit the Trader Workstation Website](https://www.interactivebrokers.com/en/trading/tws.php)