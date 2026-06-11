# 市场数据（Market Data）

> 原文：[ibkrguides.com/traderworkstation/market-data.htm](https://www.ibkrguides.com/traderworkstation/market-data.htm)
> 最后更新于 2025-10-08

## 概述

TWS 中的"市场数据"涵盖一切**与行情订阅、报价显示、合约搜索**相关的操作。本章是行情相关功能的主题页（hub page），下面分 5 个子主题详细介绍。每一个子主题都对应 TWS 里的一个具体使用场景：延迟报价兜底、快捷输入、切换交易所、用代码添加行情等。

!!! note "TWS 中行情数据的来源"
    TWS 默认从 IBKR 的行情系统取数据。是否能看到**实时**行情取决于你是否订阅了对应交易所的行情包；未订阅的标的会自动回退到**延迟（delayed）** 行情。

---

## 行情子主题索引

以下子主题全部在 TWS 内可触发，涵盖"获取行情 → 在面板里显示"这一整条链：

### 1. 接收延迟行情（Receive Delayed Market Data）

当某个标的你**没有实时行情订阅**时，TWS 默认会切换到延迟 15-20 分钟的报价。本节说明：

- 怎么判断当前显示的是不是延迟行情
- 延迟模式的开关位置
- 延迟行情的字段标记（多数数据列会显示 "Delayed"）

[查看子页 →](https://www.ibkrguides.com/traderworkstation/receive-delayed-market-data.htm)

### 2. 使用 Quick Data（Use Quick Data）

**Quick Data** 让你**不用先建 watchlist 也能看到报价**。在 TWS 各处输入合约代码或名称时，弹出的搜索结果会附带关键行情指标，方便快速决策。

[查看子页 →](https://www.ibkrguides.com/traderworkstation/use-quick-data.htm)

### 3. 启用 Quick Stock Entry（Enable Quick Stock Entry）

允许你在**订单输入面板**里直接用代码搜索并下单，省去先加 watchlist 再下单的步骤。适合**频繁交易同一批股票**的短线用户。

[查看子页 →](https://www.ibkrguides.com/traderworkstation/enable-quick-stock-entry.htm)

### 4. 切换交易所（Switch Exchange）

同一支股票可能在多个交易所上市（如 ARCA、NYSE、NASDAQ）。本节说明怎么在 TWS 里**切换主交易所**，以及这对订单路由和报价的影响。

[查看子页 →](https://www.ibkrguides.com/traderworkstation/switch-exchange.htm)

### 5. 用 Class 或 Symbol 添加行情（Add Market Data using Class or Symbol）

如果你知道**底层 Class ID**（如期货的 CL、ES），可以直接通过 Class 快速加一整组行情，省去逐个输入合约代码的麻烦。本节说明两种添加方式的差异。

[查看子页 →](https://www.ibkrguides.com/traderworkstation/add-market-data-using-class-or-symbol.htm)

---

## 关键要点

- 行情显示模式（**实时 vs 延迟**）是 TWS 中**最容易被忽视**的差异。下一单前确认行情时间戳，避免按延迟报价挂市价单造成意外滑点。
- Quick Data 和 Quick Stock Entry 适合**短线 / 高频**用户；长线投资者通常还是用标准的 Watchlist + 订单面板组合。
- "切换交易所"改变的是 TWS 显示行情的**主来源**，但**下单路由**仍由 SmartRouting 决定（除非显式使用 Direct Routing）。
- 用 Class 加行情在**期货**场景特别有用——一个 Class 通常包含数十个合约月份。

---

## 相关章节

- [行情线路与订阅规则（API 视角）](../tws-api/market_data.md)
- [TWS 入门概览](getting-started.md)
- [自选列表（Watchlist）](watchlist.md)
- [市场扫描器（Market Scanners）](market-scanners.md)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/traderworkstation/market-data.htm>
- 最后更新：2025-10-08
- 本章性质：hub page（5 个子主题的入口页）
