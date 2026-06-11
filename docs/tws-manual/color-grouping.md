# 颜色联动（Color Grouping / Linked Panels）

> 原文：[ibkrguides.com/traderworkstation/color-grouping-linked-panels.htm](https://www.ibkrguides.com/traderworkstation/color-grouping-linked-panels.htm)
> 最后更新于 2025-10-08

## 概述

TWS 的 **Color Grouping**（颜色联动）允许你把多个 Mosaic 面板或工具窗口加入同一个"颜色组"（color group），让它们之间的**合约选择动作同步**。当你在其中一个窗口里切换 ticker 时，组内其他窗口会自动跟随切换。

颜色组通过窗口**标题栏右上角的彩色"链接"图标**（chain link icon）设置——选同一种颜色 / 编号的窗口就会被联动起来。

!!! tip "典型使用场景"
    - 同时看 AAPL 的 **报价 + 图表 + News + Time & Sales**——切换 ticker 时四个窗口一起变。
    - 用不同颜色组隔离**多组并行关注**的标的（如红色组关注科技股、蓝色组关注能源股）。
    - 在 [Order Ticket](order-ticket.md) 切换合约时，自动联动 Quote 面板和 Chart 面板。

---

## 设置颜色组

### 操作步骤

1. 点击任一窗口标题栏右上角的 **"chain link"**（链条）图标，弹出下拉列表。
2. 从下拉列表中选一个**带颜色的编号**（例如红 1、蓝 2、绿 3 等），把这个窗口加入该组。
3. 对其他要加入同一组的窗口，重复步骤 1-2，**选择相同的颜色编号**。
4. 完成后，所有同色的窗口都属同一组——在其中一个"Source"窗口切换 ticker，所有"Destination"窗口都会同步更新。

**示例**：开 3 个 Option Chain（期权链）窗口，分别分配红色组、蓝色组、黄色组；再开 3 个 Quote（报价）页面分别加入这 3 个组——就可以在 3 组之间独立切换不同 ticker 而互不干扰。

---

## 窗口的三种角色

每个窗口在颜色组里都有明确角色，**鼠标悬停在 Group 图标上**会显示当前角色：

- **Source（源）**：**控制型**窗口，**只能发送**指令给组内其他窗口。在该窗口切换 ticker 会触发组内同步。
- **Destination（目标）**：**接收型**窗口，**只能接收**来自 Source 窗口的指令。在该窗口切换 ticker **不会**影响其他窗口。
- **Source / Destination（源 / 目标双向）**：**多任务型**窗口，**既可发送也可接收**指令。在该窗口切换 ticker 会同时影响组内其他窗口，其他窗口的切换也会影响本窗口。

!!! warning "角色选择建议"
    - **Order Ticket**（订单输入）通常设为 **Source**——下单时切换合约，希望看到其他面板跟随更新。
    - **News 面板 / Chart 面板**通常设为 **Destination** 或 **Source/Destination**——既跟随订单输入切换 ticker，也允许独立浏览其他合约。
    - 一组里**至少需要一个 Source**——否则该组无法触发联动。

---

## 关键要点

- **一个窗口只能加入一个组**：当前 TWS 不支持一个窗口同时属于多个颜色组；要同时联动两组合约，需要为该窗口开多个实例。
- **组内联动只针对"合约选择"**：颜色组同步的是**合约 / ticker 切换**这类基础动作，不会同步复杂配置（如订单参数、技术指标参数）。
- **Filtered Feed 窗口不能加入颜色组**：TWS 设计上限制；如需联动新闻，请改用 Company Specific News 或 Portfolio & Watchlist News（详见 [新闻与研究](news.md)）。
- **多组并行是常见模式**：交易员通常会建 2-4 个颜色组，对应不同的关注主题；切换组时用 Window → Color Group 菜单快速跳转。
- **与 Window Group 的区别**：**颜色组**联动的是"合约选择动作"（同 ticker 跨窗口显示）；**Window Group** 联动的是"窗口操作"（如同时关闭 / 隐藏一组窗口）。两者是正交功能，可叠加使用。

---

## 相关章节

- [Mosaic 工作区](mosaic.md)——理解 Mosaic 面板与窗口组织
- [布局管理（Layouts）](layouts.md)——保存 / 切换整套工作区
- [订单输入（Order Ticket）](order-ticket.md)——典型 Source 窗口
- [新闻与研究（News）](news.md)——典型 Destination 窗口
- [自选列表（Watchlist）](watchlist.md)——多 ticker 浏览的常用 Destination

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/traderworkstation/color-grouping-linked-panels.htm>
- 最后更新：2025-10-08
- 翻译说明：本章为原文全功能翻译，把"chain link 图标、颜色编号下拉、Source / Destination / Source-Destination 三种角色"按 TWS 实际交互流程重新组织，并在关键要点中补充"与 Window Group 的区别"和"Filtered Feed 不能加入组"等常见陷阱。
