# 下单面板 Order Ticket

> 原文：[ibkrguides.com/traderworkstation/create-an-order.htm](https://www.ibkrguides.com/traderworkstation/create-an-order.htm)
> 最后更新于 2025-10-08

## 概述

本章讲解在 TWS 中**从市场深度（Market Depth）窗口下单**的方法：在某一买/卖价位上**单击**，系统会按当前设置在该价位生成一笔订单。生成后，订单会先进入 **Orders** 面板待你确认；确认参数无误后，**再点击状态列中的"T"** 把订单**真正发送（transmit）**到交易所。

!!! info "页面对应关系"
    本章对应源站 `create-an-order.htm` 页面，原文标题是"Create an Order"，但**实际内容**专指**从 Market Depth 窗口下单**这一种入口。其他下单入口（如从行情行、从 Order Ticket 面板等）请参见下文"相关章节"。

## 从市场深度窗口下单

### 操作步骤

1. 在市场深度（Market Depth）窗口中：
    - 想要**卖出**时，点击 **Bid（买价）** 列里某个价位的对应位置。
    - 想要**买入**时，点击 **Ask（卖价）** 列里某个价位的对应位置。
2. 新订单会出现在 **Orders** 面板。**核对**订单参数（合约、数量、价格、方向等），如需修改可直接在面板上调整。
3. 确认无误后，点击订单**状态列（Status）** 中的 **"T"** 按钮，把订单**真正发送**到交易所。

> 图片描述：截图为 Market Depth 窗口，从上到下分为 Bid 列（卖单入口）和 Ask 列（买单入口）。窗口顶部有 "Others" 按钮用于叠加 Level I 行情，下方还有 "Arm" 按钮用于激活"瞬时发送"。

### 界面元素说明

下面对照截图中标注的几个关键点：

- **1 — Level II 行情切换按钮**：点击后在 Market Trader 中**加入 Level II**（逐笔深度）行情数据。"Others" 按钮则会展示来自**多个交易所的 Level I** 行情。
- **2 — Arm（激活）按钮**：用于启用**瞬时发送（Instantaneous Transmission）**——激活后，再次点击动作按钮会**直接发送订单**，不再需要二次点击"T"。
- **3 — Cumulative Size（累计数量）**：把**所有交易所**在该价位的可用数量**汇总**后显示的总量。
- **4 — 一键下单**：在 Bid 侧点价位生成**卖单**，在 Ask 侧点价位生成**买单**，价格即为所点击的价位，数量默认为 **累计数量 × 默认下单手数（Cumulative Size × Default Order Size）**。
- **5 — 同价位的数量分组**：同一价格上来自不同交易所/做市商的挂单**会按颜色分组**，便于视觉区分。

### 下单数量规则详解

下单数量由合约对应的**预设（Preset）**中的"Use cumulative size for Market Depth"开关决定，规则如下：

| 预设开关 | 实际下单数量 |
| --- | --- |
| ✅ 勾选（默认） | 该价位的 **累计数量** × **Default Order Size** |
| ❌ 未勾选 | 仅使用 **Default Order Size**，不乘累计数量 |

举例：默认下单手数 = 100。点击 NYSE 上 $193.99 那一档的价位：

- 若开关 ✅：订单数量 = 200,000（即累计数量 2,000 × 100）。
- 点击同一价位但挂单在 IEX 行的那一档：订单数量 = 140,000（IEX 累计 1,400 × 100）。
- 若开关 ❌：订单数量始终 = 100。

> 你可以在**订单进入 Orders 面板之后、点"T"发送之前**，临时修改下单数量。

## 关键要点

- 在 Market Depth 上下单是**"所见即所价"**——点击哪个价位，价格就是哪个；适合对盘口有明确判断的快速下单场景。
- **点价位 ≠ 发送订单**。订单生成后默认是 **"待发送"** 状态，必须**显式点 "T"** 才会真正到交易所；这是 TWS 的安全护栏。
- 想"**一点即发**"的极速玩法：先按 **Arm** 启用瞬时发送，再点价位即下单。
- 下单数量**受预设控制**——不要被大额累计数量吓到，先看自己的 Default Order Size 是不是符合预期。
- 发送前**务必核对 Orders 面板里的订单参数**（合约代码、方向、价格、数量），尤其在多个窗口同时打开时。

## 相关章节

- [订单管理 Order Management](./order-management.md)
- [订单类型 Order Types](./order-types.md)
- [订单预设 Order Presets](./order-presets.md)
- [市场数据 Market Data](./market-data.md)
- [图表基础 Charts](./charts.md)
- [快捷键 Hot Keys](./hot-keys.md)

## 原文参考

- [Create an Order — ibkrguides.com](https://www.ibkrguides.com/traderworkstation/create-an-order.htm)
