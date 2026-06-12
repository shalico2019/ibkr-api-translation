# 期权策略构建器

> 原文：[ibkrguides.com/ibkrdesktop/strategy-builder.htm](https://www.ibkrguides.com/ibkrdesktop/strategy-builder.htm)
> 最后更新于 2025-12-18

## 概述

**策略构建器（Strategy Builder）** 是 IBKR Desktop 期权链（Option Chain）内置的多腿（multi-leg）期权策略下单工具。你可以直接在期权链的展示页面上点击组合出日历价差（Calendar Spread）、跨式（Straddle）、宽跨式（Strangle）、铁鹰（Iron Condor）等常见策略，无需在 TWS Mosaic 中手动叠加多张腿。

它把"选策略 → 选合约腿 → 看报价 → 下单"压缩成**一条龙操作**，尤其适合：

- 已知策略名称、希望快速生成腿组合的活跃期权交易者
- 需要快速对比多个到期日组合报价的场景
- 在 IBKR Desktop 单页界面内完成分析 → 下单的工作流

## 操作步骤

1. **进入期权链并开启 Strategy Builder**：打开任意标的的 Option Chain（期权链）面板，找到并开启 **Strategy Builder** 开关。开关位置在期权链窗口内部；启用后 Strategy Builder 子窗口会出现在屏幕底部。

    > 界面位置：期权链（Option Chain）窗口 → 顶部工具栏切换"Strategy Builder"。示意图：在期权链下方弹出一条新窗口，标题为"Strategy Builder"。

2. **选择策略模板**：点击 Strategy Builder 顶部的 **Custom** 下拉菜单，从内置列表里选一个策略（例如 **Calendar Spread 日历价差**、**Vertical Spread 垂直价差**、**Straddle 跨式** 等）。

    > 界面位置：Strategy Builder 窗口 → 顶部策略选择栏 → Custom 下拉。

3. **从期权链选取合约腿（Leg）**：在期权链中点击所需的行（Strike / 到期日 / Call 或 Put），所选腿会自动出现在 Strategy Builder 中，并按策略规则（买腿/卖腿、行权价关系）联动更新组合报价。

    > 示意图：选腿后，Strategy Builder 窗口同步刷新净 debit/credit、最大盈利、最大亏损等组合指标。

4. **（可选）一键平值（Auto-Place At Money）**：选完策略后，再次打开策略下拉菜单并选 **Auto-Place At Money**。系统会自动把组合放在**接近当前市价的平值（at-the-money）位置**，省去手动选 Strike 的步骤。

    > 适用场景：标的快速移动、需要立刻挂出"平值附近"组合时。

5. **设置订单参数并提交**：在 Strategy Builder 窗口底部填写订单参数（数量、价格类型、限价/止损价、TIF 等），点击 **Submit Order**（提交订单）按钮发送到交易所。

    > 重要：提交前请确认每个腿的方向（买/卖）、数量、Strike 是否正确；多腿订单一旦成交，**逐腿退出较为复杂**。

## 关键要点

- **位置**：期权链窗口内（开关开启后弹出于屏幕底部），不是独立窗口。
- **支持的策略**：策略下拉菜单内置常见组合（Calendar、Vertical、Straddle、Strangle、Iron Condor 等）；具体列表以 UI 显示为准。
- **联动报价**：策略选定后，从期权链选腿即触发组合报价重算；删除/替换腿也会即时刷新。
- **Auto-Place At Money**：以标的当前市价为中心，自动挑选合适 Strike；适合快速建仓。
- **订单提交**：与 IBKR Desktop 其他下单面板一致，支持限价、市价、止损等多种订单类型。

## 与 TWS 的差异

- **TWS Mosaic** 的策略构建器位于 Mosaic 窗口内，与 Option Chain 同窗口不同区域。
- **IBKR Desktop** 把 Strategy Builder 直接挂在 Option Chain 下方，**单页工作流**——选合约、组合、下单不需要切换面板。
- 底层使用的是同一套期权组合定价引擎，组合指标（净 debit/credit、希腊字母）含义一致。

## 相关章节链接

- [快速下单](rapid-order-entry.md)（基础下单流程）
- [高级订单](advanced.md)（订单类型与附加参数）
- [图表内下单（源站链接）](https://www.ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm)（图表区域内的下单方式）

## 其他资源

- [IBKR Campus — Strategy Builder 课程](https://ibkrcampus.com/trading-lessons/ibkr-desktop-strategy-builder/)
- [IBKR Desktop 官网介绍](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

## 原文参考

- 源站 URL：https://www.ibkrguides.com/ibkrdesktop/strategy-builder.htm
- 源站最后更新日期：2025-12-18
- 截图：源站含 5 张截图（开启 Strategy Builder / 选择策略 / 选腿 / 自动平值 / 订单参数），均为 IBKR Desktop 官方 UI 截图；本译本以文字描述替代。