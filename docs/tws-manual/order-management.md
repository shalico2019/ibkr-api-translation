# 订单管理（Order Management）

> 原文：[ibkrguides.com/traderworkstation/classic-pending-orders-tab.htm](https://www.ibkrguides.com/traderworkstation/classic-pending-orders-tab.htm)
> 最后更新于 2025-10-08

订单管理（Order Management）这一章围绕 Classic TWS 的"Pending (All)"标签页（待成交订单视图）展开，介绍如何查看、修改、取消未成交订单，以及状态颜色和右键菜单的高级用法。

!!! info "本章适用对象"
    本章内容以 Classic TWS 为例；Mosaic 布局下的等效功能见 [账户窗口](account-window.md) 中的"活动（Activity）"面板与"活动监控"章节。

---

## 概述

Classic TWS 的 **Pending (All) Tab（待成交·全部订单）** 是一个集中查看所有未成交订单的标签页。无论订单是在哪个交易页（Trading Page）或报价监视器（Quote Monitor）下提交的，只要尚未成交，都会出现在 Pending (All) 标签页中。

订单一旦成交，就会从 Pending 页面消失，成交记录（Execution Report）转入 **Trade Log（成交日志）**。如果你登录时还有未成交订单，Pending 页面会自动弹出，便于你即时复核。

!!! tip "何时使用 Pending (All) 页面"
    - 想一次性看到所有未成交订单，而不是逐个交易页查找
    - 想批量修改或取消订单
    - 想检查某一订单是否已被交易所接受

---

## 操作步骤

### 1. 修改订单（Modify an Order）

未成交的订单在成交前的任何时刻都可以修改。修改完成后，订单在交易所的旧版本会被替换为新版本。

1. 在 Pending (All) 页面，点击订单行中你要修改的参数单元格。例如想把数量从 100 改成 200，就点 "Qty" 列当前的 "100"。
2. 在单元格中输入新参数，按 **Enter** 确认。
3. 点击该行右侧的蓝色 **Update（更新）** 按钮提交修改。

如果要放弃本次尚未提交的修改，右键点击订单行，选择 **Discard Modifications（放弃修改）**。

!!! note "修改时序的注意"
    在修改过程中，你可能在原订单被替换前先收到一个成交（Fill）。具体细节以 IBKR 的 [客户协议](https://www.interactivebrokers.com/en/accounts/forms-and-disclosures-client-agreements.php) 为准。

### 2. 取消订单（Cancel an Order）

对于**已提交到交易所的工作中订单（Working Order）**，用以下方式之一发起取消请求：

- 点击 Pending (All) 页面里该订单行右侧的灰色 **Cancel** 按钮；或
- 在 TWS 顶部菜单选择 **Trade → Cancel**，然后从子菜单选：
    - **Cancel Selected Orders（取消所选订单）**：只取消当前页面中已勾选的订单
    - **Cancel All Orders on Page（取消本页所有订单）**：取消当前页面上所有工作中及未提交的订单
    - **Cancel All Orders（取消所有订单）**：对 TWS 内所有订单发起取消请求

对于**尚未提交（Non-transmitted）的订单**，右键订单行选择 **Discard（丢弃）** 可以直接从交易页面删除。

!!! warning "取消尚未真正生效"
    工作中的订单**只有当状态字段变成红色**之后，才算被交易所确认取消。在红色出现前，你仍然可能收到一笔成交。详见下方"订单状态颜色"。

### 3. 批量操作

在 Pending (All) 页面上可以一次处理多个订单：

- 用 **Ctrl + 点击** 多选多行
- 然后用上述 "Cancel Selected Orders" 或右键菜单里的 **Transmit All（全部提交）** 一次性处理

---

## 订单管理行右键菜单

在订单行上点右键，会弹出一个命令菜单，包含以下选项：

### 提交与删除类

| 命令 | 说明 |
| --- | --- |
| **Transmit（提交）** | 提交当前所选订单。 |
| **Discard（丢弃）** | 从交易页面删除该订单（仅适用于未提交订单）。 |
| **Transmit All（全部提交）** | 一次性提交当前报价监视器页面上的所有订单。 |

### 风险与预览类

| 命令 | 说明 |
| --- | --- |
| **Check Margin Impact（检查保证金影响）** | 打开"预览订单（Preview Order）"框，展示该订单的参数、佣金和保证金影响，再决定是否真正提交。 |
| **Check Risk（检查风险）** | 打开 Risk Navigator（风险漫游），查看该订单对持仓风险的影响。 |

### 分配与税务类

| 命令 | 说明 |
| --- | --- |
| **Allocation Order Tool（订单分配工具）** | 快速打开分配工具，用于减仓/平仓、加仓/开仓或轮换持仓。 |
| **Tax Loss Harvesting（税务损失收割）** | 打开税务损失收割窗口，预览并分配交易以利用潜在资本亏损。 |

### Attach（附加订单）

把一个反向或辅助订单附加到当前订单上：

- **Bracket Orders（括号订单）**：附加一组反向订单"夹住"当前订单以限制亏损
- **Target Limit（目标限价单）**：附加一个反向限价单
- **Target Relative/Pegged（目标相对/挂钩）**：附加一个反向相对订单
- **Stop（止损单）**：附加一个止损单
- **Stop Limit（止损限价单）**：附加一个止损限价单
- **Trailing Stop（跟踪止损）**：附加一个跟踪止损单
- **Trailing Stop Limit（跟踪止损限价）**：附加一个跟踪止损限价单
- **Adjustable Stop（可调止损）**：附加可调止损，触发后会自动调整为新的订单类型
- **Auto Combo Limit / Auto Combo Market（自动组合限价/市价）**：翻转父组合订单的方向并提交反向组合订单（限价需手动输入价格）
- **Beta Hedge（Beta 对冲）**：附加一个 Beta 对冲订单
- **FX Order（外汇订单）**：附加一个外汇订单
- **Pair Trade（配对交易）**：附加一个配对交易

### Create（创建）

- **Duplicate（复制订单）**：在所选订单下方复制一行完全相同参数的新订单
- **Scale Orders（阶梯订单）**：创建一组按递增/递减价差排列的订单

### Modify（修改）

- **Order Ticket（订单面板）**：打开 Order Ticket 窗口修改参数再提交
- **Condition（条件订单）**：打开 Order Ticket 的"条件"标签页，创建一个只有满足指定条件才会触发或撤单的订单

### 其他

| 命令 | 说明 |
| --- | --- |
| **Fundamentals Explorer（基本面浏览器）** | 打开基本面浏览器，辅助评估资产的基本价值。 |
| **What if（假设分析）** | 在 Risk Navigator 中创建一个包含该订单的假设情景。 |
| **Configure Order Presets（配置订单预设）** | 打开该合约/品种的预设配置页（修改预设不影响现有订单）。 |
| **Integrated Stock Window（集成股票窗口）** | 打开 ISW。 |
| **Remove All Filled Orders（移除全部已成交订单）** | 把已成交订单从页面清除。 |
| **Save（保存）** | 保存当前订单。 |

!!! note "界面位置"
    在 Classic TWS 报价监视器（Quote Monitor）或订单行上点右键即可看到上述菜单。Mosaic 布局下对应的右键菜单结构类似，但入口在 Order Entry Panel 或 Monitor Panel。

---

## 订单状态颜色（Order Status Colors）

订单管理行中"Status（状态）"列的背景色告诉你订单的当前状态。颜色与含义对照如下：

| 颜色 | 含义 |
| --- | --- |
| **浅灰（Light Gray）** | 你正在创建订单，尚未提交。 |
| **浅蓝（Light Blue）** | 已提交订单，但尚未收到订单目的地的接受确认。 |
| **浅紫（Pale Purple）** | 系统（模拟订单）或交易所（原生订单）已接受订单，但因系统/交易所等原因当前未工作；恢复正常后会变色。 |
| **紫色（Purple）** | 订单被挂起，等待你处理（常见原因：组合规模超过账户能力，请修改规模或入金）。 |
| **深蓝（Dark Blue）** | 系统或交易所已接受订单，但尚未被激活（election）。当激活条件满足后订单被触发，颜色会变化。TWS 919 之前深蓝也用于表示"在交易所但未触发"的原生止损单；从 TWS 919 起，已触发和未触发的交易所原生止损单都显示绿色。 |
| **绿色（Green）** | 订单已被接受并在目的地上工作中。在 Shortable 行情列中，绿色表示至少有 1000 股可融券卖空。 |
| **深绿（Dark Green）** | Shortable 列专用：合约可融券卖空，但当前没有可借股票，系统正在寻找。 |
| **浅绿（Light Green）** | Blotter 专用：表示该订单已被交易员接受。 |
| **粉色（Pink）** | 已发送取消请求但尚未收到订单目的地的取消确认。**此时订单仍未确认取消，在等待确认期间仍可能收到成交**。 |
| **橙色（Orange）** | 系统已接受取消请求但因系统/交易所等原因当前未生效。订单仍未确认取消，仍可能成交。 |
| **红色（Red）** | 系统确认订单的剩余数量已被取消（在 Shortable 列中表示无可借股票）。订单确认取消后 30 秒内会自动从交易页消失。 |
| **栗色（Maroon）** | 附加的模拟订单类型已被系统接受但尚未激活；当触发条件满足后会被提交到订单目的地。 |

!!! tip "记住关键三色"
    - **绿**：工作中（working）
    - **粉/橙**：取消请求在途（仍可能成交）
    - **红**：确认取消（可以放心了）

---

## 关键要点

- **Pending (All) 是订单的"集中视图"**：不管订单从哪个交易页提交，都汇总到这一页。
- **修改即替换**：修改参数提交后，交易所侧会用新版本替换旧版本，理论上不会变成两个订单，但在新旧交替的窗口期仍可能先收到旧订单的成交。
- **取消不是即时的**：TWS 看到红色才算取消成功；粉色 / 橙色只是取消请求在飞。
- **右键菜单是订单管理的核心**：除了 Transmit / Cancel，更复杂的操作（Bracket、Attach、条件订单、Scale Orders、What-if）都通过右键菜单发起。
- **状态颜色是快速诊断工具**：用颜色判断订单当前在哪个阶段，比读 Status 文本更快。

---

## 相关章节链接

- [订单类型（Order Types）](order-types.md) —— 市价单、限价单、止损单、括号订单等具体类型说明
- [订单预设（Order Presets）](order-presets.md) —— 用预设模板加速下单
- [订单共享模式（Order Sharing Modes）](order-sharing-modes.md) —— 多账户之间共享订单
- [账户窗口（Account Window）](account-window.md) —— 看待成交订单的另一个入口
- [自选列表（Watchlist）](watchlist.md) —— 从自选列表直接下单
- [TWS API: Orders](https://interactivebrokers.github.io/tws-api/orders.html) —— 编程式下单接口（英文）

---

## 原文参考

本章节由源站以下页面综合整理而成：

- [Classic TWS Pending (All) Tab](https://www.ibkrguides.com/traderworkstation/classic-pending-orders-tab.htm) —— 主页面
- [Right Click on the Order Management Line](https://www.ibkrguides.com/traderworkstation/right-click-order-management-line.htm) —— 右键菜单说明
- [Order Status Colors](https://www.ibkrguides.com/traderworkstation/order-status-colors.htm) —— 状态颜色对照表
- 最后更新日期：**2025-10-08**