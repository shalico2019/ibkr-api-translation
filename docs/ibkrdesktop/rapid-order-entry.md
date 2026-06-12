# 快速下单（Rapid Order Entry）

> 原文：[ibkrguides.com/ibkrdesktop/rapid-order-entry.htm](https://www.ibkrguides.com/ibkrdesktop/rapid-order-entry.htm)
> 最后更新于 2025-10-07

## 概述

**Rapid Order Entry（快速下单）** 是 IBKR Desktop 中"看到标的 → 立刻下单"的最快路径——当你在 **Watchlist（自选列表）** 中点击某个合约的右键菜单选择 **Buy（买入）** 或 **Sell（卖出）** 时，**快速下单面板会自动从屏幕右侧滑出**，你只需要填少量参数就能提交订单。

!!! info "对照 TWS"
    TWS 中等价的入口是 **Watchlist 右键 → Buy / Sell → 直接弹出 Mini Order Ticket** 或独立的 **Order Ticket**。IBKR Desktop 的 Rapid Order Entry 是**同一种理念的精简实现**——下单面板固定在右侧、参数紧凑，适合快速下单。

!!! note "界面位置"
    主窗口 **Watchlist 标签页** → 任意合约**右键** → **Buy** 或 **Sell** → 屏幕**右侧**滑出 Rapid Order Entry 面板。

---

## 操作步骤

1. 打开 **Watchlist（自选列表）** 菜单，输入你想交易的合约代码。

    !!! note "界面位置"
        IBKR Desktop 主窗口 **左上角 Watchlist 图标**（列表/星形图标）→ 顶部合约搜索框 → 输入代码回车确认。

2. **右键** 该合约，从弹出菜单中选择 **Buy** 或 **Sell**。

    !!! note "界面位置"
        Watchlist 列表中任意一行 → 右键 → 弹出菜单常见选项：Buy（买入）、Sell（卖出）、Chart（看图）、Alert（设警报）、Add to Watchlist 等。

3. **Rapid Order Entry 面板会自动从屏幕右侧滑出**，并在面板顶部显示你刚选的合约代码 + 买/卖方向。

    !!! note "界面位置"
        Watchlist 屏幕的**最右侧**会滑出一个紧凑的面板——这就是 Rapid Order Entry。已开过其他面板时，它会**叠加在右侧**而不是替换 Watchlist。

4. **填入下单参数**（数量、价格、订单类型等）→ 点击 **Submit Buy Order**（或 **Submit Sell Order**）提交订单。

    !!! note "界面位置"
        Rapid Order Entry 面板中：合约代码 + Buy/Sell 方向 → 数量输入框 → 订单类型下拉（MKT / LMT / STP 等）→ 价格输入框 → 底部绿色/红色 **Submit Buy/Sell Order** 按钮。

---

## Rapid Order Entry 的核心参数

| 字段 | 含义 | 默认值 |
|------|------|--------|
| **Symbol** | 合约代码（已自动填入） | — |
| **Side** | 买卖方向 Buy / Sell | 由右键菜单决定 |
| **Quantity** | 下单数量 | 1（合约默认）或持仓数量（平仓时） |
| **Order Type** | 订单类型 | MKT（市价单） |
| **Price** | 限价 / 触发价（仅限价单/止损单显示） | 隐藏 |
| **TIF (Time in Force)** | 订单有效期 | DAY（当日有效） |
| **Route** | 智能路由（IBKR 默认 SmartRouting） | SMART |

!!! tip "如何切换为限价单"
    默认 Order Type 是 **MKT（市价单）**——点击 Order Type 下拉框切换为 **LMT（限价单）**，此时 Price 输入框会出现，填入你希望成交的价格。

---

## 重要风险提示

!!! warning "关于订单类型与成交的免责说明"
    通过盈透证券 Trader Workstation 可用的订单类型旨在帮助你**限制亏损**和/或**锁定利润**。**市场行情和其他因素可能影响实际成交**。

    一般而言：

    - 订单**保证成交**（fill）或**保证价格**（price），但**不能同时保证两者**
    - 在**极端行情**下，订单可能：
        - 以**与预期不同的价格**成交
        - 在市场上**完全没有成交**（no fill）

    **永远不要假设市价单一定会按你看到的价格成交**——尤其在开盘/收盘瞬间、重大消息发布时。市价单是"我愿意接受当前市价"的意思，而不是"我要按这个价格成交"。

---

## 关键要点

- Rapid Order Entry 是 IBKR Desktop 中**最快**的下单路径——从选中合约到下单只需 **3 步**（右键 → Buy/Sell → Submit）。
- 面板**自动从右侧滑出**，不打断你的 Watchlist 浏览——你可以同时在左侧看 Watchlist + 右侧下新单。
- 默认订单类型是 **MKT**——如果你想要**精确价格**，必须**手动切换到 LMT** 并填入价格。市价单适合流动性好的大盘股，但**不适合小盘股 / 衍生品 / 盘前盘后**。
- 提交订单后，订单会出现在 **Portfolio → Orders** 标签页——如果你没看到，要么立即成交（出现在 Trades），要么还在等待中。
- 如果你需要更复杂的参数（止损单、Bracket Order、Algo），需要切到完整下单面板（Advanced Order Ticket）—— 见 [高级订单](advanced.md)。

!!! info "对照 TWS"
    - TWS 的 Rapid Order Entry 入口在 **Watchlist 右键 → Buy / Sell**（同 IBKR Desktop），但弹出位置是**覆盖当前窗口**的中央模态框，不是侧边滑出
    - TWS 的 Order Ticket 参数比 IBKR Desktop 多（支持附加订单 Parent/Child 嵌套）；IBKR Desktop 的 Rapid Order Entry 是**精简版**，复杂订单请走 [高级订单](advanced.md)

---

## 相关章节

- [自选列表（Watchlist）](watchlists.md)
- [快速交易（Quick Trade）](quick-trade.md)
- [高级订单（Advanced Orders）](advanced.md)
- [订单与成交（Orders & Trades）](orders-and-trades.md)
- [合约搜索](contract-search.md)
- TWS 对照：[TWS 订单入场（Order Ticket）](../tws-manual/order-ticket.md)
- 外部：[IBKR Campus - Rapid Order Entry Window](https://ibkrcampus.com/trading-lessons/rapid-order-entry-window/)
- 外部：[IBKR Desktop 产品页](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/rapid-order-entry.htm>
- 最后更新：2025-10-07
- 引用图片：
    - `resources/images/rapid-order-entry_300x455.png`（Watchlist 右键菜单，含 Buy / Sell 选项）
    - `resources/images/rapid-order-entry1.png`（Rapid Order Entry 面板完整截图）
