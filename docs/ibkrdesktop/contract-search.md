# 合约搜索

> 原文：[ibkrguides.com/ibkrdesktop/contract-search.htm](https://www.ibkrguides.com/ibkrdesktop/contract-search.htm)
> 最后更新于 2025-10-07

## 概述

**合约搜索（Contract Search）**是 IBKR Desktop 内置的**综合搜索工具**——你输入关键字后，它会根据筛选条件返回一组相关产品列表；点击任意结果，IBKR Desktop 会打开该产品的**报价窗口（Quote）**，并显示对应的资产图表。从报价窗口你可以直接**买入、卖出**，或把该产品**加入自选列表（Watchlist）**。

合约搜索是交易员在 IBKR Desktop 中找到目标品种的**第一站**——尤其是当你只记得名称、地区或交易所，而记不清完整 ticker 时。

!!! note "对照 TWS"
    IBKR Desktop 的合约搜索是**顶栏搜索框 + 弹出层**的形式（聚焦"快速找到一只产品"）；TWS 的合约搜索则是独立窗口，支持更复杂的过滤条件组合（聚焦"批量搜索"）。两者底层数据相同，但交互模式不同。

## 操作步骤

1. **打开搜索框**：在 IBKR Desktop 主界面**左上角的搜索框**中点击，弹出合约搜索面板（一个浮层或弹窗）。
2. **输入关键字**：在弹出的搜索字段中输入一个**词或短语**——可以输入产品名称（如 "Apple"）、代码（如 "AAPL"）、或部分拼写。
3. **选择资产类别标签**：搜索结果会按**资产类别（Asset Class）标签**分组显示，点击顶部的不同标签（如股票、期权、期货、外汇、债券等）可**缩小结果范围**。
4. **细化搜索**：在查询字符串里添加**限定词（specifier）**，进一步过滤结果。可用的限定词包括：
    - **Region（地区）**：`AMERICAS` / `ASIA` / `CANADA` / `EUROPE` / `MIDEAST`
    - **Country（国家）**：支持**两位或三位**国家代码（如 `US` / `USA`）
    - **Exchange（交易所）**：如 `NYSE` / `SEHK`
    - **Currency（结算货币）**：如 `USD` / `GBP`
5. **打开目标产品**：在搜索结果中**点击**你感兴趣的产品，IBKR Desktop 会弹出该产品的报价窗口（含图表）。
6. **下单或加入自选**：在报价窗口中你可以直接**买入 / 卖出**，或点击 **加入自选（Add to Watchlist）**把它加入已有的自选列表。

!!! note "界面位置"
    搜索框是 IBKR Desktop 窗口**最左上角**的输入框，旁边有放大镜图标。点击后弹出的是一个独立搜索面板，顶部有资产类别标签，结果以列表形式展示。

!!! note "Top 标签的特别行为"
    如果你点击搜索结果上方的 **Top（热门）**标签（而非具体资产类别），IBKR Desktop 会按搜索条件展示**每个资产类别最多 15 个**热门标的——适合"我想看看这个关键字下大家都关注什么"的场景。
    如果你点击**具体资产类别**标签（如 Stocks / Options / Futures），则每个资产类别最多展示 **50 个**结果。

## 搜索限定词（Specifier）速查

| 限定词 | 取值示例 | 用途 |
| --- | --- | --- |
| `region` | `AMERICAS`, `ASIA`, `CANADA`, `EUROPE`, `MIDEAST` | 按地区过滤 |
| `country` | `US`, `USA`, `CN`, `HKG`（2 或 3 位） | 按国家过滤 |
| `exchange` | `NYSE`, `NASDAQ`, `SEHK`, `TSE` | 按交易所过滤 |
| `currency` | `USD`, `GBP`, `EUR`, `HKD`, `JPY` | 按结算货币过滤 |

**使用示例**（伪语法示意）：

- `AAPL US` —— 在美国市场找 AAPL
- `TSMC TW` —— 在台湾市场找 TSMC
- `RELIANCE IN INR` —— 在印度市场以印度卢比结算的 RELIANCE

!!! tip "组合限定词"
    同一搜索框内可叠加多个限定词（地区 + 国家 + 货币等），IBKR Desktop 会按所有条件**取交集**过滤结果。当你不确定关键字但想锁定特定市场时尤其有用。

## 关键要点

- **入口位置**：IBKR Desktop 主界面**最左上角**搜索框。
- **搜索范围**：覆盖盈透所有可交易产品（股票、期权、期货、外汇、债券、基金等）。
- **资产类别标签**：顶部多个标签用于切换 / 缩小结果范围。
- **Top 标签**：每类最多 15 个热门结果；具体资产标签：每类最多 50 个。
- **限定词（Specifier）**：通过地区 / 国家 / 交易所 / 货币组合，精确定位市场。
- **从搜索到下单**：点击结果 → 报价窗口 → 直接买入 / 卖出 / 加入自选。
- **底层数据与 TWS 一致**：都是盈透的合约数据库，搜索质量可靠。

## 相关章节链接

- [入门概览](getting-started.md)：登录后第一步做什么
- [账户头像](account-avatar.md)：账户管理入口
- [自选列表](watchlists.md)：如何管理自选列表

## 其他资源

- [IBKR Campus — IBKR Desktop 界面课程](https://ibkrcampus.com/trading-course/ibkr-desktop/)
- [IBKR Desktop 官网介绍页](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

## 原文参考

- 源站 URL：https://www.ibkrguides.com/ibkrdesktop/contract-search.htm
- 源站最后更新日期：2025-10-07
- 本章为合约搜索的功能说明与操作步骤；底层合约数据库与 TWS / Client Portal 共用，但 Desktop 的弹出式交互是其特色。