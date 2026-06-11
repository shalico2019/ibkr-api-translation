# 快捷键（Hot Keys）

> 原文：[ibkrguides.com/traderworkstation/hot-keys.htm](https://www.ibkrguides.com/traderworkstation/hot-keys.htm)
> 最后更新于 2025-10-08

## 概述

TWS 快捷键允许你把任意按键或 `Ctrl + 字母` / `Shift + 字母` 组合绑定到具体的下单或撤单操作上，从而在不打开订单输入面板的情况下**一键创建甚至直接发送**订单。

最常用的快捷键类别：

| 类别 | 典型动作 |
| --- | --- |
| 下单/撤单 | Buy、Sell、Transmit、Cancel |
| 针对具体合约 | Buy Specific Product / Sell Specific Product |
| 加减数量 | Increase/Decrease size |
| 加减价格 | Increase/Decrease Limit Price（限价） |
| 改订单属性 | Modify Order Type、Modify Time in Force |
| 实时监控 | View Alerts、Add Auto Stop Order、Add Auto Trailing Stop Order |

注意：

- **保留键**：`Alt` 等系统保留键不能用作快捷键。
- **Rapid Order Entry 面板**：Rapid Order Entry 面板内不响应普通快捷键；针对 Rapid Order Entry 的快捷键必须用 `Ctrl + 字母` 或 `Esc`。
- **同时绑定多个动作**：每个动作可独立绑定一个快捷键，同一组键组合只能绑定一个动作（后绑定的会覆盖先绑定的）。

## 创建第一个快捷键

1. 打开 Global Configuration（全局配置）：
   - **Mosaic 界面**：左上角 **File** 菜单
   - **Classic TWS**：左上角 **Edit** 菜单
2. 在 Global Configuration 左侧窗格选择 **Hot Keys**。
3. 在右侧 **Possible Actions** 列表中选择一个动作（例如 Buy、Sell、Transmit），点击 **Create Shortcut**。
4. 切换到 **Keyboard** 标签，点击 **Record** 按钮。
5. 按下你希望作为快捷键的按键或组合键，按键会显示在 **Current Key Shortcut** 字段中。
6. 关闭对话框。已绑定的快捷键会显示在 TWS 窗口底部的状态栏。

> 图示说明：Global Configuration → Hot Keys 页面分三个区域：左侧是类别列表（Possible Actions、Customize、Shortcuts），中间是动作详情，右侧是已绑定的快捷键列表。底部状态栏以小字显示当前所有已激活的快捷键。

要**重新录制**一个快捷键：重复步骤 1-4，在 Keyboard 标签中按新的按键即可。
要**清除**快捷键绑定：在选中动作后点击 **Clear**。

!!! tip "Customize 标签的高级用法"
    录制完基础 Buy/Sell 快捷键后，**切到 Customize 标签**可以做更精细的配置：例如把快捷键绑成"买入限价单 + 附加括号单 + 立即发送"，或绑定到特定合约。

## 常见快捷键设置流程

### 给特定订单类型绑定 Buy/Sell 快捷键（如 Buy Limit Order）

1. Mosaic 在 **File** / Classic 在 **Edit** 菜单打开 Global Configuration。
2. 左侧选择 **Hot Keys**。
3. 在 Possible Actions 区域选择 **Buy** 或 **Sell**，点击 **Create Shortcut**。
4. 切换到 **Customize** 标签。
5. 在 **Order Type** 下拉框选择要绑定的订单类型（如 Limit）。
6. 填入必要的订单字段（如限价、数量）。
7. 切换到 **Shortcuts** 标签，点击 **Record** 后按下快捷键组合。
8. 在 Shortcuts 区域确认快捷键已正确录制。

### 给特定合约绑定 Buy/Sell 快捷键（如 Buy Limit Order for XYZ）

1. Mosaic 在 **File** / Classic 在 **Edit** 菜单打开 Global Configuration。
2. 左侧选择 **Hot Keys**。
3. 选择 **Buy Specific Product** 或 **Sell Specific Product**，点击 **Create Shortcut**。
4. 切换到 **Customize** 标签。
5. 在 **Underlying** 字段输入底层证券代码（如 XYZ）。
6. 填入订单相关字段。
7. 切换到 **Shortcuts** 标签，点击 **Record** 后按下快捷键组合。
8. 确认快捷键已录制。

### 启用即时发送（Instantaneous Transmission）

为 Buy/Sell 快捷键绑定具体订单类型时，可以勾选 Customize 页面底部的 **Transmit the order instantaneously** 选项：

- **勾选**：按下快捷键 → 直接创建并发送订单，**没有最后确认机会**。
- **不勾选**：按下快捷键 → 在交易屏幕生成订单（可人工修改后再发送）。

!!! danger "高风险"
    即时发送非常适合熟练交易员，但对新手极其危险——按错键立刻发单。建议**先用模拟账户**或在 customize 阶段多次演练。

### 附加括号单（Bracket Orders）

1. 打开 Global Configuration → **Hot Keys**。
2. 选择 **Buy** 或 **Sell**，点击 **Create Shortcut**。
3. 切换到 **Customize** 标签。
4. 在 **Attached Orders** 区域勾选 **Add Simple Bracket**。
5. 在 **Bracket Orders** 区域：
    - **Lmt Price (+/- offset)**：限价基础价，可选 **Bid / Ask / Last / None**，并输入偏移量。
    - **Stop Type**：选择 Stop 类型（Stop、Stop Limit 等）。
    - **Stop Price**：设置止损触发价及偏移量。
    - **Stop Limit Price**：仅 Stop Limit 单需要，设置限价及偏移量。
6. 切换到 Shortcuts 页面录制快捷键组合，点击 **OK**。

### 加减订单数量（Increase/Decrease Order Size）

1. 打开 Global Configuration → **Hot Keys**。
2. 选择 **Increase (Decrease) price or size**，点击 **Create Shortcut**。
3. 在 Customize 标签的 **Field** 下拉框选择 **Size**。
4. 设置 **Num Ticks**（每次加减的 tick 数）。
5. 切换到 Shortcuts 页面，点击 **Record** 后按下快捷键。
6. 关闭对话框。

### 加减限价（Increase/Decrease Limit Price / Aux. Price）

1. 打开 Global Configuration → **Hot Keys**。
2. 选择 **Increase (Decrease) price or size**，点击 **Create Shortcut**。
3. Customize 标签的 **Field** 下拉框选择 **Limit Price (Aux. Price)**。
4. 设置 **Num Ticks** 增量。
5. 切换到 Shortcuts 页面，点击 **Record** 后按下快捷键。
6. 关闭对话框。

### 用全部可用数量下单（All Available for Buy/Sell）

1. 打开 Global Configuration → **Hot Keys**。
2. 选择 **Buy** 或 **Sell**，点击 **Create Shortcut**。
3. 切换到 **Customize** 标签。
4. 在 **Size** 字段选择 **Available**，点击 **OK**。

之后按快捷键时，订单数量会按 Ask Size（买）或 Bid Size（卖）的可用合约数自动填入。

### 修改订单类型/时效

1. 打开 Global Configuration → **Hot Keys**。
2. 在 **Modify/Transmit Order** 区域选择 **Modify Order Type** 或 **Modify Time in Force**，点击 **Create Shortcut**。
3. 切换到 **Shortcuts** 页面，点击 **Record** 后按下快捷键组合。
4. 关闭对话框。

### 打开 Alerts 面板查看/设置预警

1. 打开 Global Configuration → **Hot Keys**。
2. 在 **Real-time Activity Monitoring** 区域选择 **View Alerts**，点击 **Create Shortcut**。
3. 在 Shortcuts 页面点击 **Record** 后按下快捷键（例如 `Ctrl + A`）。
4. 关闭对话框，点击 **OK**。

之后在 TWS 按 `Ctrl + A` 即可弹出 Alerts 面板。**New** 按钮可创建新预警。

### 设置自动止损单快捷键（Auto Stop）

1. 打开 Global Configuration → **Hot Keys**。
2. 在 **Real-time Activity Monitoring** 区域选择 **Add Auto Stop Order**。
3. 点击 **Record** 后按下快捷键组合（例如 `Ctrl + A`）。
4. 关闭对话框，点击 **OK**。

之后选中一笔订单按 `Ctrl + A`，即可自动附加 Stop 单。

### 设置自动追踪止损单快捷键（Auto Trailing Stop）

1. 打开 Global Configuration → **Hot Keys**。
2. 在 **Real-time Activity Monitoring** 区域选择 **Add Auto Trailing Stop Order**。
3. 点击 **Record** 后按下快捷键组合（例如 `Ctrl + T`）。
4. 关闭对话框，点击 **OK**。

之后选中一笔订单按 `Ctrl + T`，即可附加 Trailing Stop 单。追踪金额取自订单默认值（Order Defaults）。

## 关键要点

- **保留键限制**：`Alt` 等系统保留键不可用。若尝试会报错，请换一个键组合。
- **Rapid Order Entry 例外**：Rapid Order Entry 面板内普通快捷键无效，必须用 `Ctrl + 字母` 或 `Esc`。
- **同名快捷键**：同一组合键只能绑定一个动作，绑定新动作会覆盖旧动作。
- **跨平台差异**：macOS 用 `Cmd` 替代 `Ctrl`；本文以 Windows 写法为准。
- **状态栏显示**：所有已绑定快捷键都显示在 TWS 底部状态栏，一目了然。

## 相关章节链接

- [Mosaic 界面](mosaic.md) —— Mosaic 是 TWS 默认界面
- [预设与自定义布局](layouts.md) —— 把快捷键结合进预设布局可大幅提升效率
- [订单管理](order-management.md) —— 快捷键触发后的订单生命周期管理
- [警报与通知](alerts-and-notifications.md) —— View Alerts 快捷键对应的预警系统
- [订单预设](order-presets.md) —— 默认值与快捷键配合使用

---

## 原文参考

> 本节保留源站 `https://www.ibkrguides.com/traderworkstation/hot-keys.htm` 的关键原文段，便于核对翻译准确性。
>
> 原文最后更新：October 8, 2025。

### Instructions（原文）

> Assigning actions to specific keys and key combinations helps you rapidly create and transmit orders to the marketplace. You can assign any keystroke, or a combination of the "Ctrl" and "Shift" keys with one of the 26 keyboard letters, to map specific order creation and order transmission commands, such as buy, sell, transmit and cancel.

### Recording Steps（原文步骤）

1. For Mosaic - Click the **File** menu in the top left corner.
   For Classic TWS - Click the **Edit** menu in the top left corner.
2. Click **Global Configuration**
3. Click **Hot Keys** in the left pane
4. In the Possible Actions area, choose an action to which you want to assign a hot key and click **Create Shortcut**.
5. In the Keyboard area, click **Record**. If you already have a hot key recorded for the selected action, it is displayed in the Current Key Shortcut field.
6. Press the actual keystroke or keystroke combination you will use to complete this action.

### 重要注意事项（原文）

> If you try to use a reserved key - for example the Alt key - when creating a hotkey shortcut, you will receive an error message. If this happens please re-record the hotkey with another keystroke combination.

> The standard hot keys do not function within the Rapid Order Entry panel. When you record a hot key for one of the rapid order entry actions, you must use "Ctrl" plus a character key, or the Escape key.

### Additional Resources（原文资源链接）

- [Learn About Hot Keys in Trader Workstation at IBKR Campus](https://ibkrcampus.com/trading-lessons/configuring-tws-hotkeys/)
- [Visit the Trader Workstation Website](https://www.interactivebrokers.com/en/trading/tws.php)