# 图表基础（Chart Panel）

> 原文：[ibkrguides.com/traderworkstation/chart-panel.htm](https://www.ibkrguides.com/traderworkstation/chart-panel.htm)
> 最后更新于 2025-10-08

本章介绍 TWS Mosaic 界面内置的 **Chart Panel（图表面板）**——一个轻量级的行情图表窗口，适合在 Mosaic 工作空间里与订单面板、报价面板并列摆放。

!!! info "图表类型说明"
    TWS 提供两种图表：

    - **Chart Panel（图表面板）** —— 本章内容；嵌入 Mosaic 的轻量图表
    - **Advanced Chart（高级图表）** —— 独立窗口的专业图表工具，支持更多技术指标和画线工具

    如需高级图表，请参考 *Advanced Chart* 章节。

---

## 概述

Mosaic Chart Panel 让你直接在 Mosaic 工作空间里查看、编辑某只合约的图表，而无需打开独立的图表窗口。图表本身支持切换周期、添加指标、添加注释、保存设置等基本操作。

典型的使用方式：

- 在 Mosaic 的"图表"标签页里输入合约代码（如 `AAPL`）
- 选择时间周期（如 1 分钟 / 5 分钟 / 日线）
- 在主图上叠加技术指标或画线工具
- 把图表与其他面板（行情、订单）并排放置以便边看边下

---

## 操作步骤

### 1. 在 Mosaic 中打开图表面板

1. 打开 Mosaic 工作空间。
2. 在"图表"标签页（Chart Panel）的 **Symbol（合约代码）** 字段中输入合约代码，例如 `AAPL`、`ESZ6`、`EUR.USD`。
3. 按 Enter 加载图表。

!!! note "界面位置"
    Mosaic 默认布局里就有 Chart Panel 标签页，位于工作区顶部或右侧面板组中。如果看不到，可以点击标签栏右端的 **"+"** 号，从面板列表中选 **Chart Panel** 添加。

### 2. 切换时间周期与显示方式

图表顶部的时间周期标签（Period）显示当前周期（如 `1 D`、`5 mins`、`1 month`）。点击该标签，从下拉列表中选择其他周期或显示类型（如 K线 / 线图 / 柱状图）。

### 3. 工具栏与菜单

Chart Panel 顶部有一组菜单和工具栏按钮：

| 位置 | 名称 | 说明 |
| --- | --- | --- |
| ① | **Symbol（合约代码）** | 显示当前查看的产品合约代码。 |
| ② | **Period（周期）** | 当前时间周期标签；点击切换显示类型、时间周期等。 |
| ③ | **File（文件）** | 创建新标签页、保存图表、打印图表。 |
| ④ | **Edit（编辑）** | 添加技术指标（Studies）、注释（Annotations）、修改参数。 |
| ⑤ | **View（视图）** | 调整图表的视觉显示（坐标轴、网格、颜色等）。 |
| ⑥ | **Maximize（最大化）** | 把图表放大到全屏；再次点击 Title Bar（标题栏）或再次点最大化按钮可还原。 |
| ⑦ | **Tool Bar（工具栏）** | 提供调宽 K 线、偏移时间、添加箭头等快捷工具。 |
| ⑧ | **Volume（成交量）** | 在主图下方叠加成交量柱状图。 |
| ⑨ | **Time Slider（时间滑块）** | 图表下方的滑块，左右拖动可放大或缩小时间窗口。 |

### 4. 添加技术指标

1. 点击 **Edit** 菜单 → **Studies**。
2. 从指标列表中选择（如 Moving Average、RSI、MACD、Bollinger Bands 等）。
3. 配置参数（周期、颜色、线型等）后确认。
4. 指标会叠加到主图或独立的副图上。

### 5. 添加注释

1. 点击 **Edit** 菜单 → **Annotations**。
2. 选择注释类型（文字标签、箭头、趋势线、水平线等）。
3. 在图表上点击或拖动放置注释。

### 6. 调整时间窗口与缩放

- 用工具栏的 **+/-** 按钮或鼠标滚轮放大/缩小时间窗口
- 用底部 **Time Slider** 拖动选择要查看的时段
- 双击标题栏可最大化图表，再次双击恢复

### 7. 保存与导出

- **保存图表配置**：File → Save（保存当前合约 + 周期 + 指标设置的组合）
- **打印**：File → Print
- **导出为新标签页**：File → New Tab

---

## 关键要点

- **嵌入 Mosaic 而非独立窗口**：Chart Panel 是 Mosaic 工作空间的一部分，可以和其他面板联动（联动规则参考 [Color Grouping（颜色联动）](color-grouping.md)）。
- **基础指标 + 画线已够用**：对日内交易和波段分析足够；要做更复杂的形态分析或回测，请使用 Advanced Chart。
- **最大化的两种方式**：点最大化图标，或者**双击标题栏**——后者更快捷。
- **Volume 在主图下方**：成交量是副图指标，默认不在主图，需要点工具栏的 Volume 图标才会显示。
- **与 TWS Charts 文档的关系**：源站 `chart.htm` 是 Chart Panel 的扩展文档页，本章是该页的中文版（涵盖 Chart Panel 介绍 + 跳转链接）。

---

## 相关章节链接

- [Mosaic 界面](mosaic.md) —— Mosaic 工作空间整体介绍
- [颜色联动（Color Grouping）](color-grouping.md) —— 让多个面板根据代码自动联动
- [自选列表（Watchlist）](watchlist.md) —— 把图表与自选列表联动
- [FX Trader](fx-trader.md) —— 外汇交易专用界面（含图表）
- [Risk Navigator（风险漫游）](risk-navigator.md) —— 投资组合级风险分析

---

## 原文参考

本章节整理自以下源站页面：

- [Chart Panel](https://www.ibkrguides.com/traderworkstation/chart-panel.htm) —— Mosaic 图表面板主页面
- [TWS Charts](https://www.ibkrguides.com/traderworkstation/chart.htm) —— TWS Charts 索引页（指向各子页）
- 最后更新日期：**2025-10-08**