# Advanced（高级订单属性）

> 原文：[ibkrguides.com/ibkrdesktop/advanced.htm](https://www.ibkrguides.com/ibkrdesktop/advanced.htm)
> 最后更新于 2025-10-07

## 概述

**Advanced 按钮**位于 Rapid Order Entry（快速下单）面板的右下角，专门服务于止损（Stop Loss）、止盈（Profit Taker）和括号（Bracket）订单。除了这三种常用结构，它还可以挂出 **Iceberg（冰山订单）**、**OCO（One Cancels Other，二选一订单）** 和 **Hedge（对冲订单）**，并应用其它高级订单属性。

!!! note "Advanced 与 TWS 的关系"
    Advanced 面板列出的订单类型（Bracket、Iceberg、OCO 等）**与 TWS 同源**——IBKR Desktop 直接借用了 TWS 的订单属性定义，但入口是 Rapid Order Entry 内的折叠面板，而不是 TWS 的 Order Ticket 全量参数页。本章的操作流程针对的是 IBKR Desktop 的轻量化快速下单场景。

---

## 操作步骤

1. 进入 **Watchlist**（自选股）菜单，输入想要交易的产品代码。
2. 在产品上**右键**，从弹出菜单中选择 **Buy（买入）** 或 **Sell（卖出）**。
3. Rapid Order Entry（快速下单）面板会出现在 Watchlist 屏幕的右侧。
4. 点击面板**右下角的 Advanced 按钮**，展开高级属性面板。
5. 面板展开后，向下滚动到面板底部，可附加 **Profit Taker（止盈）**、**Stop Loss（止损）**、**Bracket（括号）** 订单，或者调用 IBKR 提供的算法。
6. 按订单需要填好各项参数，最后点击 **Submit Buy Order** 提交买单。

!!! info "图片描述"
    - 图 1：Watchlist 屏幕中产品右键菜单，菜单项包含 Buy / Sell / Chart / News / Alert 等。
    - 图 2：Rapid Order Entry 面板，底部右下角高亮 Advanced 按钮。
    - 图 3：展开后的 Advanced 面板，从上到下依次是基础订单参数、止盈/止损/括号挂单区域、IB Algorithmic Trading 下拉框。

---

## 关键要点

- **适用场景**：Advanced 主要服务于需要"入场 + 止损 + 止盈"一键绑定的场景，相比纯市价/限价单，它能在下单瞬间就锁定最大亏损和锁盈点。
- **与 Rapid Order Entry 基础单的差异**：基础面板只接受单笔订单的常规参数（价格、数量、有效期），所有结构化订单（Bracket / OCO / Iceberg）都必须进入 Advanced 面板才能配置。
- **算法订单入口**：Advanced 面板底部同时承载 IB Algorithmic Trading 的下拉入口，要使用 VWAP、TWAP、Adaptive 等 IBKR 算法，**也必须先点开 Advanced**，从快速下单切换到完整订单面板。
- **委托类型保证的范围**：IBKR LLC 通过 TWS 提供的订单类型**用于帮助限制亏损和/或锁定利润**，但市场状况和其它因素会影响实际成交。一般情况下，订单只能保证"一定成交"或"一定价格"二者之一，无法同时保证。在极端市况下，订单可能以非预期价格成交，甚至完全无法成交。
- **生效范围**：Advanced 内的所有属性适用于 IBKR Desktop 同一账户的快速下单，不影响 IBKR Mobile 或 TWS 已挂订单。

---

## 相关章节

- [快速下单（Rapid Order Entry）](rapid-order-entry.md)——Advanced 所在的下单面板
- [止损（Stop Loss）订单](orders-and-trades.md)——Advanced 面板内最常用的子单
- [算法交易（Algorithmic Trading）](algorithmic-trading.md)——Advanced 面板底部的 IB Algos 入口
- [IBKR Desktop 入门](ibkr-desktop.md)——面板与菜单的整体布局

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/advanced.htm>
- 最后更新：2025-10-07
- Rapid Order Entry 教学：<https://ibkrcampus.com/trading-lessons/rapid-order-entry-window/>
- IBKR Desktop 官网：<https://www.interactivebrokers.com/en/trading/ibkr-desktop.php>
