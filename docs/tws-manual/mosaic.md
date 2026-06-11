# Mosaic 界面

> 原文：[ibkrguides.com/traderworkstation/mosaic.htm](https://www.ibkrguides.com/traderworkstation/mosaic.htm)
> 最后更新于 2025-10-08

!!! warning "原文链接当前返回 404"
    截至本次翻译（2026-06-11），源站 `https://www.ibkrguides.com/traderworkstation/mosaic.htm` 返回 HTTP 404——该官方页面可能已下线、改版或被合并到其它文档。本节内容基于 IBKR 公开资料（TWS 主页、`getting-started.htm`、`home.htm`、IBKR Campus 介绍及 TWS 客户端实测常识）整理，并在末尾标注了已知信息缺口，便于后续原文恢复后补全。

## 概述

**Mosaic** 是 TWS（Trader Workstation）的**默认界面**，也是当前最新版本 TWS 启动时呈现的工作区。另一可选界面是 **Classic TWS**（经典模式）——保留 IBKR 早期的电子表格风格布局。两者可以在登录界面顶部切换。

Mosaic 的设计目标：

- 把行情、图表、订单、持仓、新闻、监控等**常用窗口整合到同一屏**，减少切换窗口的次数
- **可定制**：用户可以增加/删除/重排窗口、保存为自定义布局
- 配合 **Layout Library**（布局库）使用，按"场景"一键切换（详见 [预设与自定义布局](layouts.md)）

## Mosaic 界面主区域

Mosaic 启动后的工作区大致由以下几部分组成：

| 区域 | 默认位置 | 用途 |
| --- | --- | --- |
| 菜单栏 | 顶部 | File / Edit / View / Trade / 等（Mosaic 下 File 菜单） |
| 工具栏 | 菜单栏下方 | 快速新建窗口/标签页/下单 |
| 主工作区 | 屏幕中央 | 自选列表、图表、订单簿、监控等窗口 |
| 底部标签栏 | 底部 | 多个布局/标签页切换，末尾的 **+** 用于加载预设布局 |
| 状态栏 | 最底部 | 账户状态、连接状态、已绑定快捷键等 |
| **Ticker Tape**（滚动行情条） | 顶部可选显示 | 横向滚动的报价带（详见 [滚动行情条](ticker-tape.md)） |

> 图示说明：Mosaic 默认界面采用"窗格化"布局，左侧常驻自选列表与账户摘要；中间是图表或订单簿；右侧是订单输入面板。窗口之间有可拖动的分割条。

## 切换 Mosaic 与 Classic TWS

首次启动 TWS 时，登录界面顶部会提供两个选项：

- **Mosaic** —— 推荐新用户使用，整合度高
- **Classic TWS** —— 保留早期 TWS 布局，适合习惯老界面的用户

后续切换方法：

1. 登录 TWS 后，**File → New Layout** 或顶部的界面切换按钮（不同版本位置略有差异）。
2. 或者通过 **Global Configuration → General** 中的界面偏好设置（部分版本支持）。

## 在 Mosaic 中使用预设布局

Mosaic 界面与 Layout Library 深度集成：

1. 底部标签栏右侧点 **+**。
2. 在弹出面板里点 **Browse** 打开 Layout Library。
3. 选择预设布局（Option Trading、Chart Trading、FX Trading 等）→ **Add Layout**。

详见 [预设与自定义布局](layouts.md)。

## 自定义 Mosaic 工作区

Mosaic 的每个窗口都可以：

- **拖动**：改变位置或合并到其他标签页
- **拉伸**：拖动窗口间的分割条调整大小
- **删除**：通过窗口右上角 X 关闭
- **保存**：File → Save Layout As… 把当前布局另存
- **恢复**：File → Open Layout… 加载已保存布局

## 关键要点

- **Mosaic 是 TWS 默认界面**：新装 TWS 启动后看到的就是 Mosaic。
- **Classic TWS 仍保留**：登录时可在 Mosaic 与 Classic 之间选择，老用户继续可用。
- **窗口联动（Window Linking）**：通过**颜色分组**（color linking），一组窗口会随选中合约联动——选新合约时同色窗口同步刷新。详见 [颜色分组](color-grouping.md)。
- **快捷键**：Mosaic 走 **File** 菜单进入 Global Configuration；Classic TWS 走 **Edit** 菜单。这是两套界面最常见的差异之一。详见 [快捷键](hot-keys.md)。
- **预设布局和自定义布局**：Mosaic 和 Classic TWS 都可加载同一套 Layout Library 中的预设布局。

## 相关章节链接

- [预设与自定义布局](layouts.md) —— Layout Library 的全部预设布局说明
- [快捷键](hot-keys.md) —— Mosaic/Classic TWS 菜单差异、快捷键录制
- [滚动行情条 Ticker Tape](ticker-tape.md) —— Mosaic 顶部的横向报价带
- [自选列表](watchlist.md) —— Mosaic 默认工作区的核心窗口
- [颜色分组](color-grouping.md) —— 跨窗口颜色联动机制
- [入门](getting-started.md) —— 首次启动 TWS 的设置流程

---

## 原文参考

!!! danger "源站 404"
    本节对应源站 `https://www.ibkrguides.com/traderworkstation/mosaic.htm` 当前**返回 HTTP 404**，无法直接保留原文。建议后续原文恢复后补全下方"待补原文"段落。

### 待补原文

> （待源站恢复后补全。建议检查 IBKR Guides 站点的 Trader Workstation User Guide 目录，看 mosaic 章节是否被合并到 getting-started 或 home.htm 中。）

### 辅助参考（已确认可访问）

- **Trader Workstation 主页**：[ibkrguides.com/traderworkstation/home.htm](https://www.ibkrguides.com/traderworkstation/home.htm) —— TWS 整体介绍
- **Getting Started**：[ibkrguides.com/traderworkstation/getting-started.htm](https://www.ibkrguides.com/traderworkstation/getting-started.htm) —— 首次启动设置
- **IBKR Campus**：[ibkrcampus.com](https://ibkrcampus.com/) —— IBKR 官方培训平台

### 已知信息缺口

源站不可访问导致以下小节无法逐字核对：

- Mosaic 界面各窗口的具体默认尺寸与位置
- Mosaic 与 Classic TWS 的菜单项级差异（除 File/Edit 入口差异外）
- 最新版本 TWS 是否仍保留 Mosaic/Classic 二选一登录界面