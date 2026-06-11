# 外汇交易器 FXTrader

> 原文：[ibkrguides.com/traderworkstation/fx-trader.htm](https://www.ibkrguides.com/traderworkstation/fx-trader.htm)
> 最后更新于 2025-10-08

## 概述

**FXTrader**（外汇交易器）是 IBKR 专为外汇交易者定制的报价与下单窗口。3×3 的"交易单元"（trading cell）网格强调**外汇对中价格的关键位**（如 EUR/USD 的小数点后 4-5 位），并把"买价/卖价"按"看涨绿/看跌红"区分，一眼就能看清方向。

- **适用场景**：外汇短线 / 量化做市 / 多货币对同时盯盘。
- **不适用场景**：股票/期权/期货的主下单流程（用 [Mosaic 订单管理](order-management.md)）。
- **典型搭配**：FXTrader 报价窗口 + [FXTrader 交易单元](fx-trader.md#交易单元) + [订单预设](order-presets.md) 三件套。

!!! info "名词对照"
    **FXTrader** = 外汇交易器（专有产品名）；**Trading Cell** = 交易单元（FXTrader 内的单个货币对报价+下单小方格）；**Quote Panel** = 报价面板（窗口顶部当前选中货币对的完整买/卖/成交量/订单行）；**Inverted Quote** = 反向报价（用间接标价法显示）。

## 打开 FXTrader

两种入口二选一：

- **Mosaic（默认界面）**：点左上角 **New Window** → 在搜索框输 `FXTrader` → 选择 **FXTrader**。
- **Classic TWS（旧式界面）**：顶部 **Trading Tools** 菜单 → **FXTrader**。

> 名词对照：**Mosaic** = 拼图式多窗口布局；**Classic TWS** = 经典 TWS 单窗口布局。

## FXTrader 窗口结构

窗口自上而下分三层：

- **顶部 — 报价面板（Quote Panel）+ 订单/Log/Execution/Portfolio 标准模块**：在任一交易单元上点击货币对后，顶部报价面板会载入该货币对的完整买/卖价、成交量、已挂订单等；Order/Log/Execution/Portfolio 标签页是所有下单模块都有的标准模块。
- **中部 — 3×3 交易单元网格**：默认显示 9 个最常用货币对，可以按需增删/反相/改色。
- **每个交易单元**：显示一对货币的 **Bid（买价）/ Ask（卖价）+ 成交量 + 涨跌指示 + 一键下单 + 已挂订单**，下文单列一节。

## 交易单元

每个**交易单元（trading cell）**是 FXTrader 的核心交互区，单格内集成报价+下单+订单状态，从上到下：

- **货币对标签 + 合约代码**（如 `EUR.USD`）：右键可访问 TWS 全套合约相关功能。
- **Bid 价（绿色） + Ask 价（红色）**：颜色按涨跌方向切换（涨绿跌红），跟股票 Watchlist 一致。
- **小数点高亮位**：FXTrader 把"外汇对中价格的关键位"放大显示，方便一眼看到第 4/5 位小数。
- **Invert 切换**：点击反转图标可切换"直接/间接"报价法（标题前会出现 `*` 标识）。
- **成交量 + 涨跌指示三角**（绿/橙两色 + 上下箭头）。
- **一键下单区域**：点 Ask 出 BUY 单，点 Bid 出 SELL 单（顺序与传统 Order Ticket 一致）。
- **本交易单元内的未成交订单行**：订单既显示在这里，也显示在顶部 Orders 面板。
- **左下角小书本图标（仅在 Ideal odd-lot 小额簿有更优报价时出现）**：鼠标悬停看更优价，**仅在价更优时**才出现。

!!! tip "Instantaneous Transmit"
    窗口顶部有一个 **Instantaneous Transmit（瞬时发送）** 复选框，勾上后，**点 Ask/Bid 即直接下单成交**，跳过 TWS 二次确认 Order Ticket —— FXTrader 风格的核心是"一键快速成交"，但要小心**误触**。未勾选时，订单会先进入顶部 Orders 面板的待发送区，需要二次确认。

## 下单：在交易单元里出单

1. 在交易单元上点 **Ask** → 创建**买入基础货币**（同时卖出报价货币）的订单；点 **Bid** → 创建**卖出基础货币**（同时买入报价货币）的订单。
2. 订单会同时出现在**两个地方**：本交易单元下方的订单行 + 顶部 Orders 面板。
3. 如果勾了 **Instantaneous Transmit**，订单会直接发送；否则在 Orders 面板里 review + transmit。

> 反向报价（Inverted）只影响**显示**，不影响订单方向 —— 永远买/卖基础货币，不会被反向报价"绕晕"。

## 订单预设（Order Presets）

FXTrader 默认沿用全局 [Order Presets](order-presets.md)（订单大小、订单类型、有效期、是否启用算法等），可以：

- 在窗口顶部点 **Configure wrench（扳手）图标** → **Configure Order Presets** 改该货币对所用预设。
- 在窗口顶部点 **Configure wheel（齿轮）图标** → 改**颜色、显示组件、Position 信息、报价显示方式**等。

## 关键要点

- **FXTrader 是 forex 专用**，股票/期权/期货不要用这个窗口。
- **"价格的关键位"放大显示**是 FXTrader 跟普通 Watchlist 的最大差异 —— 盯 EUR/USD 第 5 位小数时不需要把整个行情铺满屏幕。
- **Inverted Quote** 只切显示，**不下单**就被切换。
- **小书本图标（Ideal odd-lot）只在价更优时出现**，不是常态。
- **Instantaneous Transmit** 是 FXTrader 的"快枪"开关，平时建议关，确信任意单击不会误触时再开。
- **下单默认沿用 [Order Presets](order-presets.md)**；若某货币对需要不同属性，开窗口级 wrench 配置。

## 风险提示

- 外汇交易存在**重大亏损风险**。
- 外汇交割日（settlement date）会因**时区差异**和**银行假日**变化；跨市场交易时可能需要借入资金完成交割，**借入资金利率必须计入跨市场交易成本**。

## 相关章节

- [Mosaic 布局](layouts.md) — 怎么把 FXTrader 拼进 Mosaic 工作区
- [订单预设](order-presets.md) — 全局订单属性的配置入口
- [订单类型](order-types.md) — FXTrader 支持的订单类型清单
- [警报与通知](alerts-and-notifications.md) — 在货币对上设条件警报
- [配置 TWS](configuration.md) — 全局配置入口

## 原文参考

源站 hub 页：[fx-trader.htm](https://www.ibkrguides.com/traderworkstation/fx-trader.htm) — 含 3 个子页：

- [The FXTrader Window](https://www.ibkrguides.com/traderworkstation/fx-trader-window.htm) — 窗口结构与配置
- [The FXTrader Trading Cell](https://www.ibkrguides.com/traderworkstation/fx-trader-trading-cell.htm) — 单交易单元的 6 个标注
- [Using the FXTrader](https://www.ibkrguides.com/traderworkstation/using-the-fxtrader.htm) — 下单流程

附加资源：[IBKR Campus FXTrader 课程](https://ibkrcampus.com/trading-lessons/tws-fxtrader-2/)（非 hub 子页，源站外）。
