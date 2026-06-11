# 警报与通知（Alerts and Notifications）

> 原文：[ibkrguides.com/traderworkstation/alerts-and-notifications.htm](https://www.ibkrguides.com/traderworkstation/alerts-and-notifications.htm)
> 最后更新于 2025-10-08

## 概述

TWS 的**警报与通知（Alerts and Notifications）**功能让你针对单个合约设置触发条件：当条件满足时，自动向你发送消息（弹窗、邮件、短信、声音）或自动下单。源站列出了 10 种条件类型加 2 种经典 Alarm 模式，本章按"通用流程 → 各条件类型 → 警报动作 → 经典 Alarm"的顺序逐项说明。

!!! tip "适用人群"
    你不需要盯盘、但又想在关键价位/事件出现时立刻知道——TWS 警报就是为你设计的。盘中常用场景：突破关键支撑/压力位、波动率异动、保证金逼近强平、隔夜重大新闻。

## Alerts 窗口的整体结构

TWS 的 **Alerts 窗口**分为两个区域，逻辑清晰：

- **Conditions（条件区）**：定义"什么时候触发警报"。可以是价格、时间、成交量、保证金缓冲（margin cushion）、账户可用资金、成交事件等。
- **Actions（动作区）**：定义"触发后做什么"。可以是发送消息（邮件、短信、弹窗、行闪烁）、播放声音，或自动提交一笔买卖单。

!!! note "界面位置"
    Mosaic：在监控面板（Monitor Panel）任一合约行**右键** → 快速交易按钮条最右端有**铃铛（Alert）图标**；或者 Mosaic 顶栏 **New Window → Alerts**。
    Classic TWS：在任一合约行**右键** → 同样的铃铛图标；或顶部 **Analytical Tools → Alerts**。
    Alerts 窗口默认打开为 **Price 警报**配置页。

---

## 通用操作流程

无论哪种警报类型，前面 3 步是统一的：

1. 在**投资组合（Portfolio）**、**行情监控（Quote Monitor）**、**自选列表（Watchlist）**或其他窗口中找到目标合约，**右键**该行。
2. 在弹出的快速交易按钮条（quick-trade button bar）**最右端**点击 **"Alert" 铃铛图标**。
3. TWS 弹出 **Configure Price Condition** 框：简单价格警报可在此直接配置；其他类型则点击右下角的 **Advanced Settings** 进入 **Create Condition** 向导。

!!! note "界面位置"
    Configure Price Condition 框右下角 → **Advanced Settings** 按钮。
    下一屏 **Create Condition** 框 → 左侧 "Choose Condition" 列表 → 选你要的触发类型 → **Next**。

4. 在向导中依次选择**条件类型（Condition Type）**、**比较运算符（Operator）**、**触发值**，点击 **Finish**。
5. 需要同时满足多个条件时，在 **Logic** 下拉里选 **And** 或 **Or**，再添加下一行合约。
6. 窗口右下角的 **Preview 框**会用自然语言描述你设好的条件（例如：`AAPL last price >= 200`）。
7. 切到 **Actions** 区域配置触发后的动作（详见后文《警报动作》一节）。
8. 点击 **Activate** 启用警报。

!!! tip "Conditional vs Alarm——别混了"
    这一章的"警报（Alerts）"使用 **Advanced Settings** 入口，每个警报可独立设置条件 + 动作 + 时长。
    章末的"价格异动报警（Price Movement Alarms）"和"成交量异动报警（Volume Change-Activated Alarm）"是**老式 Alarm**——通过右键 **Analytical tools → Set Alarm** 入口，逻辑更简单（直接填价位 + 视觉闪烁），无 Advanced Settings。

---

## 各条件类型详解

源站 **Alerts and Notifications** 索引下列出 10 种条件类型。下面每种都先说明"何时用"，再给"操作步骤要点"。

### 1. 价格警报（Set Price Alert）—— 默认

TWS 警报窗口**默认**打开的就是价格警报配置页。

**何时用**：突破某价位、跌破支撑、回踩确认等场景。

!!! note "界面位置"
    Alerts 窗口 → 左侧 **Configure Price Condition** → **Method** 下拉选触发方法（[stop trigger method](https://www.ibkrguides.com/traderworkstation/define-order-preset-value.htm) 之一：Default、Double Last、Last/Ask/Bid、Trailing Stop 等）；**Operator** 选 `>=` 或 `<=`；**Price** 输入触发价。

**操作步骤要点**：

1. 右键合约 → 铃铛图标。
2. **Method** 选触发方法（默认即可，绝大多数场景用 Default 即可）。
3. **Operator** 选 `greater than or equal to`（≥，向上突破）或 `less than or equal to`（≤，向下跌破）。
4. **Price** 输入目标价位。
5. 如需盘前盘后也能触发，勾选 **Alert outside of RTH**（即允许在 Regular Trading Hours 之外触发）。
6. 不需要 Advanced Settings 直接 **Activate**；需要更详细配置（持续时间、动作）就点 **Advanced Settings**。

!!! tip "什么是 RTH"
    **RTH（Regular Trading Hours）** 指该标的在主交易所的常规交易时段（美股一般 9:30–16:00 ET）。勾选 **Alert outside of RTH** 后，盘前盘后也能触发。

### 2. 时间警报（Set Time Alert）

**何时用**：在指定日期/时间点提醒自己（比如重要数据发布、财报披露、央行决议前几分钟）。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Time** → Next。
    下一屏 **Operator** 选 `>=` 或 `<=`；**Time** 输入具体时间（hh:mm:ss）。

**操作步骤要点**：

1. 右键合约 → 铃铛图标 → Advanced Settings。
2. **Choose Condition** 选 **Time** → **Next**。
3. **Operator** 选 `>=` 或 `<=`。
4. **Time** 填触发时间（hh:mm:ss）。
5. **Finish** → 切到 **Messages** 标签设动作（邮件/短信/弹窗/声音/自动下单）。

### 3. 保证金缓冲警报（Set Margin Alert）

**何时用**：账户保证金缓冲（margin cushion）逼近你设定的安全线时提醒你——避免强平。

**什么是 Margin Cushion**：

TWS 用一个**百分比**来描述你的账户离被强平还有多远：

    margin cushion = (含贷款价值权益 − 维持保证金) ÷ 净清算价值

即`(含贷款价值权益 − 维持保证金) / 净清算价值`。该数值在账户窗口的 **Account** 页面可以看到。数值越接近 0，账户越危险。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Margin Cushion** → Next。
    **Operator** 选 `>=` 或 `<=`；**Cushion (%)** 填百分比阈值（例如 25 表示"保证金缓冲跌到 25% 时告警"）。

**操作步骤要点**：

1. 同上路径到 Advanced Settings，**Choose Condition** 选 **Margin Cushion**。
2. **Operator** 与 **Cushion (%)** 设阈值（常见做法：设 30%、20% 两档告警）。
3. **Finish** → 配置动作。

!!! tip "Margin Alert 的特殊性"
    它作用于**整个账户**而不是单个合约——所以**勾选 Repeatable**（详见《警报时长》一节）很关键，保证它能在条件反复满足时持续提醒。

### 4. 盈亏警报（Set P&L Alert / Daily P&L）

**何时用**：当日盈亏达到某金额时提醒自己——控制单日盈亏纪律。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Daily P&L** → Next。
    **Operator** 选 `>=` 或 `<=`；**Daily P&L** 填美元金额（可正可负）。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Daily P&L**。
2. **Operator** 与 **Daily P&L** 填阈值（例如 ≥ +500 美元通知自己加仓、≤ −300 美元提醒自己减仓）。
3. **Finish** → 配置动作。

### 5. 成交警报（Set Trade Alert）

**何时用**：你想在某合约有成交时收到通知（比如"这只票有人开始买"或"我挂的限价单成交了"）。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Trade** → Next。
    下一屏可修改 **Underlying**（标的代码）、**Exchange**（交易所）、**Type**（成交类型，比如 Block、Auction、Trade 等）。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Trade**。
2. 修改标的、交易所、成交类型（如有需要），点击 **Finish**。
3. Preview 框描述好条件 → 配置动作。

### 6. 涨跌幅警报（Set Percentage Change Alert）

**何时用**：价格变动**百分比**达到你设定的阈值时提醒你——比"绝对价位"更直观，适合波动率大的标的。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Percentage Change** → Next。
    下一屏可修改标的；**Operator** 选 `>=` 或 `<=`；**Percentage Change** 填百分比（如 5 表示 ±5%）。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Percentage Change**。
2. 修改标的（如有需要）→ **Operator** 选 `>=`（涨超阈值）或 `<=`（跌破阈值）→ **Percentage Change** 填数值。
3. **Finish** → 配置动作。

### 7. 成交量警报（Set Volume Alert）

**何时用**：标的成交量累计达到某数值时提醒你——盘中放量是重要信号。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Volume** → Next。
    下一屏需填 **Underlying**（如字段为空）、**Type**（合约类型）、**Exchange**（交易所）；**Operator** 选 `>=` 或 `<=`；**Volume** 输入成交量。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Volume**。
2. 完善合约描述（标的 / 类型 / 交易所）。
3. **Operator** 与 **Volume** 设阈值。
4. **Finish** → 配置动作。

### 8. 可融券数量警报（Set Shortable Shares Alert）

**何时用**：当某股票**可融券数量**达到你设定的阈值时提醒你——做空者关心。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Shortable Shares** → Next。
    下一屏可修改标的；**Operator** 选 `>=` 或 `<=`；**Shortable Shares** 输入股数。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Shortable Shares**。
2. 修改标的 → **Operator** 与 **Shortable Shares** 设阈值。
3. **Finish** → 配置动作。

### 9. 当前可用资金警报（Set Current Available Funds Alert）

**何时用**：当账户**当前可用资金（Current Available Funds）**达到某金额时提醒你——控制仓位规模或准备加仓。

!!! note "界面位置"
    Alerts 窗口 → Advanced Settings → Choose Condition 列表选 **Current Available Funds** → Next。
    下一屏 **Operator** 选 `>=` 或 `<=`；**Current Available Funds** 填美元金额。

**操作步骤要点**：

1. Advanced Settings → **Choose Condition** 选 **Current Available Funds**。
2. **Operator** 与 **Current Available Funds** 填阈值。
3. **Finish** → 配置动作。

### 10. 复合条件（多条件 And / Or）

上面 9 种类型都可以**叠加**：在 Logic 下拉里选 **And**（同时满足）或 **Or**（任一满足），然后加下一行合约和条件。

!!! tip "典型组合"
    "AAPL 突破 200 + 当日涨幅 >= 5%" → 用 And 同时锁两个条件。
    "AAPL 突破 200 OR 跌破 180" → 用 Or 一行设上、一行设下，两个条件任一触发都告警。

---

## 警报动作（Assign Actions to Alerts）

条件只是"什么时候触发"，触发后做什么由 **Actions 区**决定。**Messages**、**Orders**、**Audio** 三个标签页分别管三类动作。

### 消息类动作（Messages Tab）

!!! note "界面位置"
    Alerts 窗口 → **Actions** 区 → **Messages** 标签。

支持四种消息动作，可单独或组合启用：

#### 邮件（Send message as e-mail）

1. **Messages** 标签 → 勾选 **Send message as e-mail**。
2. **Subject** 填邮件主题，**Message** 填正文。
3. 收件人默认为开户时登记的邮箱。
4. Preview 框核对 → **Activate**。

#### 弹窗（Display message as pop up）

1. **Messages** 标签 → 勾选 **Display message as pop up**。
2. **Message** 填弹窗文案（你自己写）。
3. **Activate**。触发时，弹窗直接盖在 TWS 交易窗口上方。

#### 行闪烁（Flash Rows）

1. **Messages** 标签 → 勾选 **Flash Rows**。
2. **Activate**。触发时，行情窗口中相关合约的行**闪烁**提醒你。

### 订单类动作（Orders Tab）

**何时用**：触发条件后**自动下单**——把监控和执行串成一条链。

!!! warning "谨慎使用"
    自动下单是"真金白银"的动作。建议先在模拟账户（Paper Account）里验证触发逻辑和订单参数，确认无误再上实盘。

!!! note "界面位置"
    Alerts 窗口 → **Actions** 区 → **Orders** 标签。

**操作步骤要点**：

1. **Orders** 标签 → 在交易窗口中找到目标订单 → **拖拽**到 Orders 面板。
2. 也可以点 **Add** 按钮 → 手动在 **Underlying** 输入标的 → 用 **Contract Selection** 框选合约 → 系统默认是 Buy 单 → 用 **Action** 下拉改为 Sell。
3. 调整订单参数（数量、价格、订单类型、有效期等）。
4. **Activate**。条件满足时订单自动提交。

### 音频类动作（Audio Tab）

!!! note "界面位置"
    Alerts 窗口 → **Actions** 区 → **Audio** 标签。

1. **Audio** 标签 → 选三个单选按钮之一：
    - **Standard** + 下拉选系统自带声音
    - **Custom** 选你自己准备的 `.wav` 声音文件
    - **None** 关闭此警报的音频
2. 点 **Save Modifications** 保存，或 **Discard Modifications** 放弃。

### 声音事件管理（Assign Sounds to Events）—— 系统级

单条警报的音频是警报级；如果你想给**整类交易事件**（比如"价格突破"、"订单成交"）统一配声音，要到 **Sound Manager** 配置。

!!! note "界面位置"
    Mosaic：顶部 **File** 菜单 → **Global Configuration**。
    Classic TWS：顶部 **Edit** 菜单 → **Global Configuration**。
    左侧导航 → **Sound Manager**。

**操作步骤要点**：

1. 进入 **Global Configuration → Sound Manager**。
2. **Sound Event Type** 下拉选事件类型。
3. 点下拉**箭头**按钮选系统自带声音。
4. 想用自定义 `.wav` 文件时，点**三点浏览按钮**（…）选文件路径。
5. **Repeat Count** 字段：声音重复播放的次数。
6. **Save**。

!!! note "前提条件"
    想听到"非默认"的声音，计算机需要装**声卡**并启用声音。

---

## 警报时长（Alerts Duration）

所有 Alerts 窗口里的警报都可以设置**有效期**：

- **默认**：警报永久生效，直到你**手动取消**。
- **Alert active until...**：选一个具体日期 + 时间，格式 `YYYYMMDD hh:mm:ss`（例如 `20260131 16:00:00`）。到达该时刻后警报自动失效。
- **Repeatable**（可重复触发）：勾选后，条件每次满足都会重新触发警报——适用于保证金警报这类"账户数值会反复越线"的场景。
- **Allow condition to be satisfied...**：允许条件在**常规交易时段之外**（盘前盘后）也能触发。

---

## 经典 Alarm：价格异动报警（Price Movement Alarm）

这是 TWS 早期版本就有的**老式 Alarm**，不进入 Alerts 窗口，配置更简单——适合挂在**行情行**上做视觉/声音提示。

**何时用**：盯盘时，某只票到达你设定的价位时**行情行变红闪烁** + 可选蜂鸣——纯本地提醒，不发邮件不下单。

!!! warning "市场数据额度"
    **每行**带 Alarm 的市场数据**始终占用一条 live market data line**，无论窗口是否在前台（active）。账户的 market data 订阅额度通常有限（一般 40 行）。

!!! note "界面位置"
    行情窗口 → 选中合约行 → **右键 → Analytical tools → Set Alarm**。
    弹出的 **Alarm Settings** 窗口有 Bid / Ask / Last 三行各两个输入框（greater than / less than）和一个 **Alarm if volume is greater than** 触发量输入框、**Play warning sound** 复选框。

**操作步骤要点**：

1. 右键合约 → **Analytical tools → Set Alarm**。
2. **Alarm Settings** 窗口 → 在 Bid / Ask / Last 三个价位字段的 `greater than` 或 `less than` 输入触发价（可只填一项、可都填）。
3. 想同时监控成交量 → 在 **Alarm if volume is greater than** 填成交量阈值。
4. 想发声 → 勾选 **Play warning sound**。
5. 默认带 Alarm 的行情行**背景色为 murky green（深绿）**。该颜色可在 **Layout Editor** 里修改。

**示例**：在 **Alarm if bid is greater than** 填 `40.15` → 当该资产的买一价 ≥ $40.15 时告警；再在 **Alarm if bid is less than** 填 `40.00` → 当买一价 ≤ $40.00 时告警。

**关闭 Alarm**：

1. 在告警的行情行上**单击**即可关闭。

!!! tip "会话间保留"
    登出 TWS 时 Alarm 会**自动关闭**——除非你在设置时勾选 **Preserve the alarm between sessions**（会话间保留）。

---

## 经典 Alarm：成交量异动报警（Volume Change-Activated Alarm）

和 Price Movement Alarm 同入口，专门用于"成交量较前次刷新变化**达到某阈值**时告警"。**何时用**：日内发现异动放量时立即提醒。

!!! warning "市场数据额度"
    同 Price Movement Alarm：每条带 Alarm 的市场数据**始终占一条 live market data line**，通常最多 40 条。

!!! note "界面位置"
    行情窗口 → 选中合约 → **右键 → Analytical Tools → Set Alarm**。
    **Alarm Settings** 窗口 → **Alarm if volume is greater than** 输入成交量阈值；可选 **Play warning sound**。

**操作步骤要点**：

1. 选中目标合约 → 右键 → **Analytical Tools → Set Alarm**。
2. **Alarm if volume is greater than** 填触发量。
3. 想发声 → 勾选 **Play warning sound**。
4. **Activate**。成交量达到阈值时，Volume 字段和页面标题**变红闪烁**。

**关闭 Alarm**：在告警的行情行上**单击**。

!!! tip "会话间保留"
    想在登出后保留此 Alarm，设置时勾选 **Preserve the alarm between sessions**。

---

## 关键要点

- **Alerts 窗口** = 高级警报（条件 + 动作 + 时长齐全），可发邮件/短信/弹窗/声音/自动下单。
- **Set Alarm（Analytical Tools）** = 经典 Alarm（视觉闪烁 + 蜂鸣），轻量但占用市场数据额度。
- 保证金警报、Daily P&L 这类**账户级指标**警报记得**勾选 Repeatable**——它们的条件容易反复满足。
- 邮件接收方 = 开户邮箱。在 IBKR Account Management 里改。
- 自动下单（Orders Tab）务必先在**模拟账户**里验证。
- 老式 Alarm 登出时**会失效**，需要勾选 **Preserve the alarm between sessions** 才能跨会话保留。

## 相关章节

- [市场数据](market-data.md)：警报触发的"原料"——实时报价、深度行情都从这里来。
- [订单类型](order-types.md)：警报 Order Action 里能选的订单类型。
- [订单管理](order-management.md)：自动下单触发的订单如何监控和撤销。
- [账户窗口](account-window.md)：Margin Cushion、Current Available Funds、Daily P&L 等指标的位置。
- [快捷键](hot-keys.md)：行情窗口的铃铛图标也有快捷键可绑。

---

## 原文参考

- 主页面：[ibkrguides.com/traderworkstation/alerts-and-notifications.htm](https://www.ibkrguides.com/traderworkstation/alerts-and-notifications.htm)
- 子页面：
    - [Set Price Alert](https://www.ibkrguides.com/traderworkstation/set-price-alert.htm)
    - [Set Time Alerts](https://www.ibkrguides.com/traderworkstation/set-time-alerts.htm)
    - [Set Margin Alerts](https://www.ibkrguides.com/traderworkstation/set-margin-alerts.htm)
    - [Set P&L Alerts](https://www.ibkrguides.com/traderworkstation/set-pnl-alerts.htm)
    - [Set Trade Alerts](https://www.ibkrguides.com/traderworkstation/set-trade-alerts.htm)
    - [Set Percentage Change Alerts](https://www.ibkrguides.com/traderworkstation/set-percentage-change-alerts.htm)
    - [Set Volume Alerts](https://www.ibkrguides.com/traderworkstation/set-volume-alerts.htm)
    - [Set Shortable Shares Alert](https://www.ibkrguides.com/traderworkstation/create-shortable-shares-alert.htm)
    - [Set Current Available Funds Alert](https://www.ibkrguides.com/traderworkstation/set-current-avail-funds-alert.htm)
    - [Assign Actions to Alerts](https://www.ibkrguides.com/traderworkstation/assign-actions-to-alerts.htm)
    - [Set Price Movement Alarms](https://www.ibkrguides.com/traderworkstation/set-price-movement-alarms.htm)
    - [Set Volume Change-Activated Alarm](https://www.ibkrguides.com/traderworkstation/set-volume-change-activated-alarms.htm)
- 最后更新日期：2025-10-08
- 外部学习资源：[IBKR Campus - Setting Alarms in TWS](https://ibkrcampus.com/trading-lessons/setting-alarms-in-tws/)
