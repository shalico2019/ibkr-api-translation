# 订单共享模式

> 原文：[ibkrguides.com/traderworkstation/order-sharing-modes.htm](https://www.ibkrguides.com/traderworkstation/order-sharing-modes.htm)
> 最后更新于 2025-10-08

## 概述

如果你的账户属于某个**交易组（trading group）**，且该组在后台为订单共享配置了相应属性，那么你在 TWS 的订单面板（Orders panel）中**可能**有权查看并管理组内其他交易员的订单，而不仅仅是自己的订单。TWS 共支持三种共享模式，由你所在组的后台设置决定：

| 模式 | 中文 | 含义 |
| --- | --- | --- |
| **Full sharing** | 完全共享 | 订单面板里显示本组**所有交易员**的全部订单。可以调出 **Submitter** 字段，查看每笔订单的最终操作人。 |
| **Login sharing** | 登录共享 | 默认只能看到自己的订单；想看其他人的订单，必须先**登录对方的 Blotter**。每登录一个用户就**多一个 Tab**，该用户的订单只显示在他自己的 Tab 上。 |
| **No sharing** | 不共享 | 只能查看并管理**自己接受或创建的**订单。 |

> 名词对照：**Sharing Mode** = 共享模式；**Blotter** = 委托/成交汇总面板；**Submitter** = 提交人（订单最后一次被操作的人）。

## 显示提交人字段（Submitter）

按下面三步把 **Submitter** 字段加进订单面板：

1. 在 **Orders** 面板的列标题区**右键单击**，选择 **Customize Layout（自定义布局）**。
2. 在弹出的自定义窗口中切到 **Order Columns（订单列）** 选项卡，在左侧 **Available Columns（可用列）** 列表里展开 **Status（状态）** 分类。
3. 找到 **Submitter** 项，点击 **"Add +"** 按钮把它加到右侧的 **Shown Columns（已显示列）** 列表里。

!!! tip "调整列位置"
    选中 Submitter 字段后，使用上、下箭头按钮可以**调整它在所有订单列中的相对位置**。

## 登录到另一位用户的 Blotter

按下面三步以"另一用户"身份打开对方的 Blotter：

1. 在 **My Blotter** 标签页上**右键单击**。
2. 在右键菜单中选择 **Open Blotter for Another User（为另一用户打开 Blotter）**，在弹窗中输入对方的 **IBKR 用户名**。
3. 点击 **OK**。该用户的界面会作为**新 Tab** 出现在你的 Blotter 窗口中。

## 关键要点

- 共享模式是**组级**配置，由后台开通；你不能在自己 TWS 上"开"或"关"，只能查看当前是哪种。
- **Full sharing** 场景下，**Submitter** 字段默认不显示，必须手动加入列布局。
- **Login sharing** 与"Full sharing"的区别：前者按"用户"切 Tab，后者所有订单混在一个面板里。
- **No sharing** 模式下连"打开另一用户的 Blotter"功能都不可用。
- 共享看到的订单**同样可管理**（改单/撤单），操作时请确认 Submitter 是不是自己，避免误改他人订单。

## 相关章节

- [订单管理 Order Management](./order-management.md)
- [下单面板 Order Ticket](./order-ticket.md)
- [订单预设 Order Presets](./order-presets.md)
- [基础配置 Configuration](./configuration.md)

## 原文参考

- [Order Sharing Modes — ibkrguides.com](https://www.ibkrguides.com/traderworkstation/order-sharing-modes.htm)
