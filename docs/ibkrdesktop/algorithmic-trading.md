# Algorithmic Trading（算法交易）

> 原文：[ibkrguides.com/ibkrdesktop/algorithmic-trading.htm](https://www.ibkrguides.com/ibkrdesktop/algorithmic-trading.htm)
> 最后更新于 2025-10-07

**可用范围**：Client Portal（网页端 IBKR 账户管理）

## 概述

**算法交易（Algos）** 是 IBKR 提供的"大单拆分"工具家族，目标是**在市场冲击（market impact）和执行风险之间取得平衡**，为大体量订单争取比直接吃单/挂单更优的成交价。在 IBKR Desktop 中调用算法时，**底层调用的是 TWS 的 IBKR Algos 引擎**——也就是说，IBKR Desktop 的 Algo 下拉菜单是 TWS 同名算法（VWAP、TWAP、Adaptive、Arrival Price 等）的轻量入口，而不是 Desktop 重新实现的一套。

!!! note "IBKR Desktop Algorithmic Trading 与 TWS Algos 的关系"
    IBKR Desktop 官方文档明确把"Algorithmic Trading"章节放在 **Client Portal** 一侧，但 Algos 本身**借用自 TWS**——与 Advanced 面板底部的 "IB Algorithmic Trading" 下拉菜单共享同一套算法实现。Desktop 提供"快速下单 + 选算法"的最短路径，TWS 提供更丰富的算法参数面板。两种入口使用同一份订单回报。

---

## 操作步骤

1. 进入 **Watchlist**（自选股）菜单，输入想要交易的产品代码。
2. 在产品上**右键**，从弹出菜单中选择 **Buy（买入）** 或 **Sell（卖出）**。
3. Rapid Order Entry（快速下单）面板会出现在 Watchlist 屏幕的右侧。
4. 点击面板**右下角的 Advanced 按钮**，展开完整订单窗口。
5. 在 Advanced 窗口中向下滚动，找到 **IB Algorithmic Trading** 区域，从下拉框中选择需要的算法类型。
6. 根据所选算法的要求调整参数（风险等级、目标成交量占比、时间窗口等）。
7. 点击 **Submit Buy Order** 或 **Submit Sell Order** 提交委托。

!!! info "图片描述"
    - 图 1：Watchlist 屏幕中产品右键菜单。
    - 图 2：Rapid Order Entry 面板，右下角 Advanced 按钮高亮。
    - 图 3：Advanced 窗口下半部，"IB Algorithmic Trading" 下拉框展开后，列出全部可用算法。
    - 图 4：选定算法后弹出的参数面板（风险等级、参与率、时间窗等）。

---

## IBKR Algos 全家桶

IBKR 当前支持的算法订单类型如下，**均可在 IBKR Desktop 通过 Advanced → IB Algorithmic Trading 入口调用**：

- **Accumulate Distribute（累积派发）**：把大单拆成多个随机大小的子单，分布在更长的时间段内执行，**最大化降低市场冲击**。支持股票、期权、期货、外汇以及组合订单（combination orders）。详见 [Accumulate Distribute](https://www.interactivebrokers.com/en/trading/accumulate-distribute.php)。
- **Adaptive Algo（自适应算法）**：可与限价单或市价单组合使用，**目标是在买卖价差之间寻找"优于均价"的成交点**。通过"priority/urgency"（优先级/紧急度）选择器调节希望订单多快被填满。详见 [Adaptive Algo](https://www.interactivebrokers.com/en/trading/orders/adaptive-algo.php)。
- **Arrival Price（到达价算法）**：目标是在订单提交时**达到或超过当时的买卖中间价**。考虑用户设定的市场风险等级（决定执行节奏）以及目标成交量占比。详见 [Arrival Price](https://www.interactivebrokers.com/en/trading/orders/arrival-price.php)。
- **Close Price Strategy（收盘价策略）**：把订单拆成小份，**在收盘前连续市场内分批成交**，最大化减少与收盘价之间的滑点。会综合考虑市场风险等级、目标成交量占比，以及股票波动率，以决定从收盘前多久开始执行、执行节奏多快。详见 [Close Price Strategy](https://www.interactivebrokers.com/en/trading/orders/close-price-strategy.php)。
- **Dark Ice（暗冰）**：类似冰山订单/Reserve Order，**允许设置"显示量"小于"订单总量"**。算法会在 ±50% 范围内随机化显示量，并根据价格向有利方向移动的概率，决定以限价还是"买一减一档/卖一加一档"的价格挂出。详见 [Dark Ice](https://www.interactivebrokers.com/en/trading/orders/dark-ice.php)。
- **Percentage of Volume（成交量占比策略）**：**按用户设定的比率参与当日成交量**。订单数量与日内分布由用户输入的目标成交量占比 + 行情数据持续更新的成交量预测共同决定。详见 [Percent of Volume](https://www.interactivebrokers.com/en/trading/orders/percent-of-volume.php)。
- **Price Variant Percentage of Volume（价格变动型成交量占比）**：**参与率随价格变化**——价格越低越积极买入，价格越高越保守（卖出反之）。详见 [Variant Algo](https://www.interactivebrokers.com/en/index.php?f=14369#collapse03)。
- **Size Variant Percentage of Volume（数量变动型成交量占比）**：参与率随剩余订单数量变化——**可以让订单在开始时更激进、临近结束时更保守，反之亦然**。详见 [Variant Algo](https://www.interactivebrokers.com/en/index.php?f=14369#collapse03)。
- **Time Variant Percentage of Volume（时间变动型成交量占比）**：参与率随时间变化——**可以设定起始参与率、终止参与率，算法自动计算中间的过渡速率**。详见 [Variant Algo](https://www.interactivebrokers.com/en/index.php?f=14369#collapse03)。
- **TWAP（时间加权平均价）**：从订单提交到收盘，**目标达到时间加权平均价**。详见 [TWAP](https://www.interactivebrokers.com/en/trading/orders/twap-algo.php)。
- **VWAP（成交量加权平均价）**：从订单提交到收盘，**目标达到或跑赢 VWAP**。详见 [VWAP](https://www.interactivebrokers.com/en/trading/orders/vwap-algo.php)。
- **Minimize Impact（最小冲击，期权专用）**：**按 Max Percentage 把订单按时间切片**，最小化市场冲击，**仅适用于期权**。详见 [Minimize Impact](https://www.interactivebrokers.com/en/index.php?f=1121)。
- **Balance Impact and Risk（冲击与风险平衡，期权专用）**：综合考虑市场风险等级与目标成交量占比，**在期权执行的市场冲击与时间窗内的价格风险之间取得平衡**。详见 [Balance Impact and Risk](https://www.interactivebrokers.com/en/index.php?f=1120)。

---

## 关键要点

- **何时用 Algo**：订单金额大、单一市价/限价单会明显推动市价、需要按时间或成交量节奏分批成交时，**优先考虑 Algo**。小单直接市价即可。
- **算法 ≠ 保本**：所有 Algo 都是"目标 + 节奏调节器"，**不能保证一定达到目标价**。Adaptive、Arrival Price、Close Price 在极端行情下都可能与目标价有明显偏离。
- **Algo 的手续费与回扣**：大部分 IBKR Algos 在成交回扣分成上与人工下单不同，**长期大单用户可与 IBKR 谈定制费率**。对个人交易者影响不大。
- **期权专属 Algo**：Minimize Impact、Balance Impact and Risk **只对期权合约可用**，股票/期货会用对应的通用算法变种。
- **可在 Advanced 面板之外单独调用**：本章节描述的是从 Rapid Order Entry → Advanced → Algo 的最短路径；TWS 内通过 Order Ticket 的 Algo 子标签页可获得更详细的参数面板（针对某些算法，如 Variant Algo 家族）。
- **章节归属提示**：IBKR Desktop 官方文档把"Algorithmic Trading"放在 **Client Portal** 一侧，IBKR Desktop 的 Algo 入口实际上是 Client Portal 概念的轻量实现，**对功能深度有更高要求的用户建议直接进 TWS**。

---

## 相关章节

- [Advanced 高级订单属性](advanced.md)——Algo 下拉入口所在的面板
- [止损 / 止盈 / 括号订单](orders-and-trades.md)——同在 Advanced 面板内的兄弟结构
- [IBKR Desktop 入门](ibkr-desktop.md)——面板与菜单的整体布局
- [TWS 算法交易](../../tws-manual/orders-and-trades.md)——更完整的 Algo 参数配置

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/algorithmic-trading.htm>
- 最后更新：2025-10-07
- 翻译说明：本章的 IBKR Algos 清单**直接借用 TWS 的 Algos 引擎**，Desktop 官方原文将本节放在 "Client Portal" 一侧，翻译时已补充与 TWS 同源的关系说明。
- IBKR Campus 教学：<https://ibkrcampus.com/trading-course/ibkr-desktop/>
- IBKR Desktop 官网：<https://www.interactivebrokers.com/en/trading/ibkr-desktop.php>
