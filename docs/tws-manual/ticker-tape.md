# 滚动行情条 Ticker Tape

> 原文：[ibkrguides.com/traderworkstation/ticker-tape.htm](https://www.ibkrguides.com/traderworkstation/ticker-tape.htm)
> 最后更新于 2025-10-08

!!! warning "原文链接当前返回 404"
    截至本次翻译（2026-06-11），源站 `https://www.ibkrguides.com/traderworkstation/ticker-tape.htm` 返回 HTTP 404——该官方页面可能已下线、改版或被合并到其它文档。本节内容基于 IBKR 公开资料（TWS 客户端实测常识、IBKR Guides 同站其它文档中对 Ticker Tape 的引用）整理，并在末尾标注了已知信息缺口，便于后续原文恢复后补全。

## 概述

**Ticker Tape（滚动行情条）** 是 TWS 顶部一条**横向滚动的报价带**，会从右向左持续滚动显示一组标的的最新价、涨跌幅等信息。它本质上是自选列表的"跑马灯视图"——让你在不切换窗口、不打断主工作区的前提下，**被动监控多个标的的实时价格变化**。

主要用途：

- **常驻监控**：交易时把 Ticker Tape 钉在顶部，不需要切到自选列表也能看到关键品种价格
- **多品种并排**：股票、期权、期货、外汇、指数都可加入
- **点击跳转**：Ticker Tape 上**点击某个标的**通常会跳转到该合约的详情/图表窗口

## Ticker Tape 的位置与开关

Ticker Tape 默认情况下位于 **TWS 窗口顶部、菜单栏下方**（Mosaic 界面下尤为常见）。在 Classic TWS 下也可作为独立窗口或顶部栏出现。

不同 TWS 版本打开/关闭 Ticker Tape 的常见路径：

- **File → Settings → Display**（部分版本）
- **View → Ticker Tape**（部分版本）
- 顶部 Ticker Tape 区域右键菜单 → **Close / Hide**

!!! note "路径差异"
    TWS 不同小版本下菜单路径略有差异，以客户端实际显示为准。

## Ticker Tape 添加/删除合约

把合约加入 Ticker Tape：

1. 在 TWS 主自选列表中**右键**某个合约。
2. 选择 **Add to Ticker Tape**（或类似条目）。

或者：

1. 打开 Ticker Tape 设置（双击 Ticker Tape 或右键菜单 **Settings**）。
2. 在 **Symbols / Instruments** 列表里手动添加代码（如 `AAPL`、`ESZ6`、`EUR.USD`）。

删除合约：在 Ticker Tape 设置里选中合约 → **Remove**。

## 关键要点

- **默认开启**：在新装 TWS 中，Ticker Tape 通常默认开启，显示一组 IBKR 预设的"市场概览"标的。
- **跨界面通用**：Ticker Tape 同时支持 Mosaic 和 Classic TWS。
- **联动窗口（Color Linking）**：Ticker Tape 上的标的可以通过颜色分组，与自选列表、图表等窗口联动——选中 Ticker Tape 中的某个合约时，同色窗口同步切换到该合约。
- **性能影响**：Ticker Tape 显示的每个合约都消耗一条行情线路（market data line）。如果你的 maxTicker 上限较低（如 100 条），Ticker Tape 中的合约会计入总数。
- **不替代自选列表**：Ticker Tape 只展示最核心的几个字段（最新价 + 涨跌），详细字段要看 [自选列表](watchlist.md)。

## 相关章节链接

- [Mosaic 界面](mosaic.md) —— Ticker Tape 通常嵌在 Mosaic 顶部
- [预设与自定义布局](layouts.md) —— 在自定义布局中保留或隐藏 Ticker Tape
- [自选列表](watchlist.md) —— 自选列表是 Ticker Tape 的数据源
- [颜色分组](color-grouping.md) —— Ticker Tape 与其他窗口的颜色联动
- [行情数据](market-data.md) —— Ticker Tape 占用行情线路的说明

---

## 原文参考

!!! danger "源站 404"
    本节对应源站 `https://www.ibkrguides.com/traderworkstation/ticker-tape.htm` 当前**返回 HTTP 404**，无法直接保留原文。建议后续原文恢复后补全下方"待补原文"段落。

### 待补原文

> （待源站恢复后补全。建议检查 IBKR Guides 站点的 Trader Workstation User Guide 目录，看 ticker-tape 章节是否被合并到 watchlist 或 market-data 章节中。）

### 辅助参考（已确认可访问）

- **Trader Workstation 主页**：[ibkrguides.com/traderworkstation/home.htm](https://www.ibkrguides.com/traderworkstation/home.htm)
- **Watchlist 章节**：[ibkrguides.com/traderworkstation/classic-watchlist.htm](https://www.ibkrguides.com/traderworkstation/classic-watchlist.htm) —— 自选列表（Ticker Tape 的数据源）
- **Market Data 章节**：[ibkrguides.com/traderworkstation/market-data.htm](https://www.ibkrguides.com/traderworkstation/market-data.htm) —— 行情线路占用规则

### 已知信息缺口

源站不可访问导致以下小节无法逐字核对：

- 各 TWS 版本下打开 Ticker Tape 设置的确切菜单路径
- Ticker Tape 默认展示的预设标的列表（最新版本是否仍是"市场概览"标的）
- Ticker Tape 支持的具体字段（最新价、涨跌、买/卖价、成交量等）及其配置方式
- 是否存在独立的 Ticker Tape 窗口模式（脱离顶部嵌入式）