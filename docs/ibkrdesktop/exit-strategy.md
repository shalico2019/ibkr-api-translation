# Exit Strategy（出场策略）

> 原文：[ibkrguides.com/ibkrdesktop/exit-strategy.htm](https://www.ibkrguides.com/ibkrdesktop/exit-strategy.htm)
> 最后更新于 2025-10-07

## 概述

**Exit Strategy（出场策略）** 用于在**已有持仓或已挂工作订单（working order）上，一键挂出 Bracket Order（括号订单）**。括号订单由三笔订单组成——一笔主单（入场或现有的工作订单）+ 一笔**止损（Stop Loss）** + 一笔**止盈（Profit Taker / Limit）**，三者"括号"包住同一标的，**当价格触及任一触发价时，对应方向的子单自动提交**。

这种结构的目标是：**用同一笔操作同时锁定最大亏损和锁定利润**，省去手动监控价格的负担。

!!! note "Bracket Order 的工作机制"
    Bracket Order 不是单一订单，而是**一组相互绑定的条件单**。入场单成交后，止损和止盈两笔子单会同时挂出，等待价格触发任意一边。**触发的那一边成交后，另一边自动撤销**（即 OCO 行为）。这种结构既能保护利润，也能在行情反向时止损出场。

---

## 操作步骤

1. 进入 **Portfolio（持仓）** 页面，**右键** 任意一个你想管理的标的，从弹出菜单中选择 **Exit Strategy**。
2. 在弹出的 Exit Strategy 窗口中，**调整 Limit（止盈价）和 Stop（止损价）**，使其匹配你想要的锁盈 / 止损位。
3. 点击 **Preview（预览）** 按钮，检查将要挂出的三笔订单明细（主单、止损子单、止盈子单）。
4. 确认无误后，点击 **Transmit（发送）**，订单正式提交到交易所/撮合系统。

!!! info "图片描述"
    - 图 1：Portfolio 页面中某标的右键菜单，"Exit Strategy" 位于菜单中部。
    - 图 2：Exit Strategy 编辑窗口，左右两侧分别是止盈（Limit）和止损（Stop）的价格输入框，下方有 Preview / Transmit 按钮。
    - 图 3：Preview 后的订单预览视图，列出主单、止损子单、止盈子单的状态与价格。

---

## 关键要点

- **适用场景**：
    - 已有持仓但**没有事先挂好止损/止盈**，需要"事后补上"出场策略。
    - 已挂工作订单（尚未成交），想在成交前预设出场逻辑。
    - 一笔交易方向明确、**目标价 / 止损位事先已经算好**，不想再盯盘。
- **价格触发后另一侧自动撤单**：止损先触发 → 止盈自动撤销；止盈先触发 → 止损自动撤销。**两侧不会同时成交**。
- **不限于多头**：先 Sell 后 Buy 的空头场景同样适用，止损/止盈方向反一反即可。
- **市价单 vs 限价单**：括号中的子单**通常是 Stop Market + Limit 单**——止损用 Stop Market（触及市价平仓），止盈用 Limit（指定价格平仓）。两者的成交价都受市况影响，**尤其止损在跳空行情下可能以远低于设定的价位成交**。
- **修改与撤销**：Bracket 挂出后，每一笔子单可以**单独修改或撤销**——例如行情转好后你想"放弃止损、保留止盈"，直接在 Orders 面板里撤销止损子单即可。**撤销子单不会影响主单状态**。
- **与 Advanced → Bracket 的区别**：Advanced 面板内的 Bracket 是"**新单入场时**"顺便挂出括号；Exit Strategy 是"**已有持仓/已挂工作单**"上补挂括号。两种入口产生的最终订单结构是一样的。

---

## 相关章节

- [Advanced 高级订单属性](advanced.md)——入场时挂 Bracket 的入口
- [止损 / 止盈 / 括号订单](orders-and-trades.md)——Bracket 订单的通用介绍
- [平仓（Close Position）](close-specific-lots.md)——直接市价/限价平仓的方式
- [持仓（Portfolio）总览](view-positions.md)——Exit Strategy 入口所在页面

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/exit-strategy.htm>
- 最后更新：2025-10-07
- IBKR Campus 教学：<https://ibkrcampus.com/trading-course/ibkr-desktop/>
- IBKR Desktop 官网：<https://www.interactivebrokers.com/en/trading/ibkr-desktop.php>
