# 账户窗口（Account Window）

> 原文：[ibkrguides.com/traderworkstation/account-window.htm](https://www.ibkrguides.com/traderworkstation/account-window.htm)
> 最后更新于 2025-10-08

## 概述

账户窗口（Account Window）是 TWS 中监控账户活动的核心界面。首次打开时，它会默认展示关键账户数值（见下方界面位置说明），并**实时**刷新你当前可用于新交易的资金、保证金预测等指标。

!!! note "界面位置"
    账户窗口内容总览：顶部是账户汇总数字，下方分 6 个独立小节（Balances / Margin Requirements / Available for Trading / Market Value / FX Portfolio / Portfolio），右侧带滚动条可上下翻动。

---

## 打开账户窗口

按你使用的 TWS 界面不同，打开方式略有差异：

=== "Mosaic"

    1. 进入**监控面板**（Monitor Panel）
    2. 切换到 **Portfolio（持仓）** 选项卡
    3. 点击右侧的 **+Account** 按钮

=== "Classic TWS（经典版）"

    1. 点击顶部工具栏的 **Account** 按钮

!!! note "界面位置"
    Mosaic 中：底部 Monitor 面板 → 顶部 Portfolio 标签页 → 右上角 "+Account" 按钮。
    Classic TWS 中：最上方主工具栏 → "Account" 按钮。

---

## 账户窗口的 6 个分区

账户窗口按以下分区组织信息（请用窗口右侧的滚动条浏览）：

### 1. Balances（账户余额）

显示你在证券、**大宗商品（commodities）**和合计层面的账户余额。**注意**：余额数据**不包含**保证金要求。

### 2. Margin Requirements（保证金要求）

基于当前持仓，实时显示**初始保证金（initial margin）**和**维持保证金（maintenance margin）**要求。

!!! tip "对比 Reg T 与 Portfolio Margin"
    使用 Reg T 保证金模型的客户，可点击 **Try PM** 按钮，把当前保证金与 **Portfolio Margin（组合保证金）**模型下的预测值做对比。

### 3. Available for Trading（可用于交易）

告诉你"还有多少资金可以下新单"，以及在触发**强制平仓（liquidation）**之前还有多少**安全垫（cushion）**。该数值根据你的余额和保证金要求综合计算。

### 4. Market Value - Real FX Position（市值 - 真实外汇头寸）

按货币排序，显示所有头寸的总市值。

### 5. FX Portfolio - Virtual FX Position（外汇组合 - 虚拟外汇头寸）

只显示**外汇市场**执行的货币对交易。**Position** 字段的值仅反映在外汇市场上成交的交易，不一定反映实时外汇头寸，因为可能还包含非基础货币换算。

### 6. Portfolio（持仓）

按**标的（underlying）**列出所有当前持仓，并显示每个持仓的当前总市值。

---

## 多账户（Advisor / 顾问）功能

顾问和其他**多客户账户**持有人会在 Account 和 Summary 选项卡上看到一个**下拉选择框**，可以选择：

- 某个**单个账户**（含 Master 主账户）
- 一个**账户组（Account Group）**——自己定义的一组账户子集

!!! note "界面位置"
    Account 页面：左上方 "Display Accounts" 下拉框。Summary 页面：可选择 Models（模型）/ Groups（组）/ ALL 视图。

顾问还可以通过 **File 菜单 → Print Summary** 打印 Summary 页面。

---

## 关键要点

- 账户窗口的所有数据**实时刷新**，是交易时段判断"还能不能开仓"的最快入口。
- 余额（Balances）和保证金（Margin Requirements）是**分开的两组数据**，不要混用。
- 单一账户的视图与账户组视图看到的余额和保证金**可能完全不同**——下单前务必确认你看的是正确的账户/组。

---

## 相关章节

- [账户余额（Balances）](https://www.ibkrguides.com/traderworkstation/account-balances.htm)
- [保证金监控（Margin Requirements）](https://www.ibkrguides.com/traderworkstation/margin-monitoring.htm)
- [可用于交易（Available for Trading）](https://www.ibkrguides.com/traderworkstation/available-for-trading.htm)
- [市值 - 真实外汇头寸](https://www.ibkrguides.com/traderworkstation/market-value-real-fx-position.htm)
- [FX 组合 - 虚拟外汇头寸](https://www.ibkrguides.com/traderworkstation/fx-portfolio-virtual-fx-position.htm)
- [持仓（Portfolio）](https://www.ibkrguides.com/traderworkstation/portfolio-values.htm)
- [监控面板总览](https://www.ibkrguides.com/traderworkstation/monitor-panel.htm)
- 外部：[IBKR Campus - Monitoring Positions and the Account Window](https://ibkrcampus.com/trading-lessons/monitoring-positions-and-the-account-window/)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/traderworkstation/account-window.htm>
- 最后更新：2025-10-08
- 引用图片：`resources/images/accountwindow.jpg`（账户窗口总览）、`accountwindow1.jpg`（Display Accounts 下拉）、`accountwindow2.jpg`（Summary 页面）
