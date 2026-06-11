# 基础配置

> 原文：[ibkrguides.com/traderworkstation/global-configuration.htm](https://www.ibkrguides.com/traderworkstation/global-configuration.htm)
> 最后更新于 2025-10-08

## 概述

**Global Configuration**（全局配置）窗口是 TWS 的"控制中心"，用于定义影响整个 TWS 行为的**系统级默认配置**。你在这里设置的参数会作为所有交易窗口、行情面板、下单工具等的默认行为。

几乎所有 TWS 偏好设置都集中在 Global Configuration，包括但不限于：

- 行情 / 报价显示
- 订单默认值与下单行为
- 通知、警报、声音
- 快捷键与按钮
- 显示主题与配色
- 键盘 / 鼠标 / 触摸行为

!!! tip "何时用 Global Configuration"
    任何"我希望 TWS 默认就这么做"的需求，都应该先去 Global Configuration 找对应设置页。局部窗口里的右键菜单只能改**当前窗口**的临时行为，Global Configuration 改的是**全局默认**。

## 打开 Global Configuration

根据你使用的 TWS 界面风格，从以下位置进入：

- **Mosaic 界面**：点击 TWS 主界面左上角的 **File** 菜单 → 选择 **Global Configuration**。
- **Classic TWS 经典界面**：点击 TWS 主界面左上角的 **Edit** 菜单 → 选择 **Global Configuration**。

!!! note "界面位置"
    在 Mosaic 界面下，Global Configuration 位于 **File 菜单**（左上角首项）中。在 Classic TWS 下，它在 **Edit 菜单**中。两种界面下菜单位置不同，但打开的是同一个 Global Configuration 窗口。

### 替代入口

你也可以从 TWS 内**任何子窗口或工具**打开 Global Configuration：

- 点击该窗口右上角或工具栏上的 **配置扳手图标**（wrench icon，🔧）即可。

!!! note "界面位置"
    扳手图标通常出现在 TWS 子窗口的右上角工具栏，与其它小图标（齿轮、帮助标志等）排成一行。点击后会自动打开 Global Configuration，并定位到与当前窗口相关的配置页。

## Global Configuration 窗口结构

打开后，Global Configuration 是一个独立的对话框，主要由以下三部分组成：

1. **左侧导航栏**：分类列出所有配置页面（按"显示 / 订单 / 行情 / 快捷键 / 通知 …"等主题分组）。点击分类可展开 / 折叠子项。
2. **右侧设置面板**：选中左侧某个配置页后，右侧会显示该页的所有具体选项。
3. **顶部搜索框**：在窗口顶部有一个**文本过滤框**，输入关键词后左侧列表会自动筛选——只显示标题中包含该关键词的配置页。例如输入 "order" 就能快速定位到所有订单相关的设置。

### 操作流程

1. 在左侧导航栏**点击**某个配置页。
2. 在右侧面板中**修改**对应选项（勾选复选框 / 输入数值 / 选择下拉项 / 点击按钮）。
3. 修改通常**实时生效**；少数需要重启 TWS 的项目会在界面中明确提示。
4. 大多数配置页有 **Restore Defaults**（恢复默认）按钮，可一键回到出厂设置。

## 关键要点

- **左侧树形导航 + 右侧详情页**：先选大类别，再选具体配置页。配置项按主题分组，避免一页堆几百个选项。
- **顶部过滤框**：当你不知道某项设置在哪个分类时，直接在过滤框输入关键词（例如 "alert"、"commission"、"color"、"hotkey"）是最快的定位方式。
- **配置变更范围**：在 Global Configuration 里改的是**全局默认**——会作用于所有同类型的窗口。如果你只想改**当前这个窗口**的临时行为，应使用窗口内的右键菜单 / 本地设置，而不是 Global Configuration。
- **生效时机**：大部分选项实时生效；少数选项（如部分显示相关的开关）需要关闭并重新打开对应窗口才生效；极个别需要重启 TWS。
- **恢复默认**：每个配置页的 Restore Defaults 按钮可恢复该页的出厂设置；如需整体重置，可删除 TWS 设置目录（`C:\Jts` 或 `~/Jts`）下的对应配置文件后重启 TWS（**注意**：这会清空所有自定义布局、预设、快捷键等）。
- **配置同步**：Global Configuration 里的设置保存在 TWS 本地（默认 `C:\Jts` / `~/Jts`），**不**与账户管理端（Account Management）同步，也不跨设备同步。如果你换了电脑，需要在新机器上重新配置。

## 推荐的新手配置

刚装好 TWS、第一次登录时，建议在 Global Configuration 里先调整以下几项：

1. **显示 → 显示行数 / 列宽**：调整行情 / 持仓表的默认显示密度。
2. **行情 → 颜色与字体**：选择舒服的配色（深色 / 浅色 / 自定义）。
3. **订单 → 默认有效期（Time in Force）**：新手可固定为 "Day"（当日有效），避免挂单过夜。
4. **通知 → 声音 / 弹窗**：打开成交 / 警报提示。
5. **快捷键**：根据个人习惯绑定常用动作（详见 [快捷键](hot-keys.md)）。

!!! tip "先不改太多"
    第一次配置不要一次改太多项。建议一次只调 1-2 项，观察一段时间再决定是否保留。Global Configuration 里的所有设置都可以随时恢复默认。

## 相关章节链接

- [Mosaic 界面](mosaic.md)：Mosaic 界面下的局部配置与右键菜单
- [快捷键](hot-keys.md)：Global Configuration → Hotkeys 配置页详解
- [预设与自定义布局](layouts.md)：布局相关的设置（含本地 vs 全局）
- [IBKR Campus — Global Configuration 课程](https://ibkrcampus.com/trading-lessons/getting-started-with-tws/)：官方视频教程

## 原文参考

- 源站 URL：https://www.ibkrguides.com/traderworkstation/global-configuration.htm
- 源站最后更新日期：2025-10-08
- **说明**：原任务给的 `configuration.htm` 路径在源站 404；本章实际翻译自 `global-configuration.htm`（TOC 顺序 i=446，"Global Configuration"）。
