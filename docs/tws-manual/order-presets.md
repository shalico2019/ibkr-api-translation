# 订单预设 Order Presets

> 原文：[ibkrguides.com/traderworkstation/about-order-presets.htm](https://www.ibkrguides.com/traderworkstation/about-order-presets.htm)
> 最后更新于 2025-10-08

## 概述

订单预设（Order Presets）是一套**分层**的订单策略模板：你可以把常用的订单属性（合约类型、有效期、算法、显示方式等）**提前配置好**，再把整套策略设为**默认**，或者在下单前临时选用。预设按"顶级 → 资产类别 → 命名策略 → 标的（ticker）"三层继承，子层自动继承父层的设置。

> 名词对照：**Order Presets** = 订单预设；**Preset** = 预设（单条配置）；**Named Preset** = 命名预设；**Ticker Preset** = 标的级预设。

## 预设的三层结构

订单预设按下面三层组织，**每一层都继承上一层的默认设置**：

1. **顶级预设（Top-level Preset）**——适用所有资产类别、所有订单类型的通用设置。
2. **资产类别预设（Asset-level Preset）**——在顶级基础上叠加该资产类别专属的设置。
3. **命名 / 标的预设（Named / Ticker Preset）**——在资产级别基础上再叠加策略或单只标的的设置。

举例：命名预设 **Scale**（分批下单）会继承其父级 **Stocks(2)** 股票预设的所有默认值；而 Stocks 又会从最顶级的 **Presets(1)** 继承可用的默认值。这种逐层继承的关系，下文会逐层说明。

## 顶级预设

顶级预设里的设置会作用于**所有资产类别的所有订单**。如果你在顶级创建了命名预设，它可以应用到所有资产类型的订单上。

- 顶级设置会被下层资产类别预设**继承**，但下层**可以覆盖**。
- 适合放置**全局性**的开关。例如你希望**所有订单都允许盘外时段成交（outside regular trading hours）**，就应该在顶级预设里打开它，然后再用 **Propagate Settings（设置传播）** 把这个改动同步到下层适用的预设里。

!!! note "Propagate Settings 弹窗"
    每当你在**高层级预设**中做了可能影响**子预设**的修改时，TWS 会自动弹出 **Propagate Settings** 对话框，让你选择**部分或全部**子预设同步接受这次改动。

## 资产级别预设

资产级别预设**同时包含**：

- 顶级预设里的所有字段。
- 该资产类别**专属**的字段。例如股票（Stock）预设除了继承顶级的字段外，还多出 **Algorithm（算法）** 和 **Display Settings（显示设置）** 两大区域——这两块是股票独有的。

在资产级别预设之下，可以再创建**命名预设**和**标的级预设**。

## 命名预设（Named Preset）

命名预设**继承**资产级别预设的全部设置，并允许你**额外**定义针对具体策略的字段。

- 可以为同一资产类别**创建多个命名预设**，比如一个做跟踪止损（trailing stop）单、一个做分批（scale）单、一个做括号（bracket）单。
- 下单前，在行情行（market data line）上**先选中想要的命名预设**，再点下单面板即可。

## 标的级预设（Ticker Preset）

标的级预设**默认对该 ticker 生效**。它的行为与命名预设类似，只是触发条件变成了"看到这只代码就用这套设置"。需要时，你仍可以在行情行上手动切换到其他策略。

## 关键要点

- 三层结构 = **顶级 → 资产 → 命名/标的**，**子层继承父层**默认值。
- 改完高层级，**记得看 Propagate Settings 弹窗**——一次性把所有受影响的子预设同步好。
- 命名预设是"**按策略组织**"，标的级预设是"**按代码组织**"，两种粒度可以并存。
- 实际下单时，预设值会被带入订单面板，**你仍可在提交前覆盖**任何一个字段。

## 相关章节

- [订单类型 Order Types](./order-types.md)
- [订单管理 Order Management](./order-management.md)
- [基础配置 Configuration](./configuration.md)
- [下单面板 Order Ticket](./order-ticket.md)

## 原文参考

- [About Order Presets — ibkrguides.com](https://www.ibkrguides.com/traderworkstation/about-order-presets.htm)
