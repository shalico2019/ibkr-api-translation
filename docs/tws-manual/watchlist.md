# 自选列表（Watchlist）

> 原文：[ibkrguides.com/traderworkstation/classic-watchlist.htm](https://www.ibkrguides.com/traderworkstation/classic-watchlist.htm)
> 最后更新于 2025-10-08

**自选列表（Watchlist）** 是 TWS 里集中查看一组合约行情的工作窗口。新旧 TWS 都有自选列表功能：

- **Classic TWS**：经典版的 Watchlist 窗口（本章主体内容）
- **Mosaic**：新版 TWS 的 Monitor Panel + 自选列表组件（在底部"Mosaic 中的自选列表"补充）

无论哪个版本，自选列表都会**自动在你所有交易平台之间同步**——你在桌面 TWS 改的列表，在手机 IBKR Mobile 上立刻能看见。

---

## 概述

自选列表把一组合约的实时行情集中在一个紧凑的窗口里，每一行（一个合约）显示：

- 合约代码（Symbol）
- 最新价（Last）
- 涨跌（Change / % Change）
- 买卖价（Bid / Ask）
- 其他可定制的列

每个合约前的圆点用颜色表示涨跌方向（涨红/跌绿或反之，取决于你的配色设置）。在任意合约上点右键，可快速访问交易、分析工具和编辑功能。

!!! tip "适用场景"
    - 监控一组感兴趣的股票/期权/期货
    - 在一个窗口内下多笔交易（不用挨个合约打开图表）
    - 把"分组"逻辑（Group Header）搬进自选列表，把一类合约汇总到一起

---

## 操作步骤（Classic TWS）

### 1. 添加一个自选列表窗口

1. 把 TWS 切换到 **Classic TWS** 标签页（左下角的 "Classic" 按钮）。
2. 在标签栏左端的黑色 **"+"** 号点击。
3. 在弹出的窗口中输入 Watchlist 名称（如 "美股科技"、"外汇主要品种"），配置需要的页面设置。
4. 点击 **OK**，会出现一个空白的 Watchlist。

### 2. 往自选列表里添加合约

有三种方式：

- **直接输入**：在 **Contract（合约）** 列的空白行点一下，输入底层合约代码（如 `AAPL`、`EUR.USD`、期货代码 `ESZ6`），按 Enter。
- **拖拽**：从另一个 TWS 窗口（比如 Quote Monitor、Portfolio）拖一个 ticker 行到 Watchlist 中。
- **复制分组**：从另一个窗口拖一个 **Group Header（分组标题）** 过来，会把整个分组及其下所有合约复制过来。

### 3. 调整列宽与字段

- 拖动列与列之间的边界，调整 **Contract / Last / Change** 等列的宽度
- 想增加/删除字段，进入 **Global Configuration → Watchlist Layout** 配置页

### 4. 从自选列表直接下单

在自选列表的某个合约上点右键，弹出菜单，选择：

- **Buy（买入）**
- **Sell（卖出）**
- **Close a Position（平仓）**
- 或者某个分析工具

选择 Buy/Sell/Close 后，Watchlist 下方会出现一个订单行，可以修改参数再点 **Transmit（提交）**。

!!! note "界面位置"
    右键菜单在下单操作里是核心入口；想要最快，可以直接点 Watchlist 里当前 Bid（卖一价，对应 Sell）或 Ask（买一价，对应 Buy），再点 Transmit 按钮。

### 5. 一键提交所有待发订单（Transmit All）

如果一个 Watchlist 上有多笔已经准备好但还没提交的订单：

1. 在该 Watchlist 窗口顶部左侧找到 **Trade** 按钮。
2. 鼠标悬停 **Transmit** 选项。
3. 选择 **Transmit All Orders on Page "Watchlist"（提交本 Watchlist 上所有订单）**。
4. 在确认弹窗中点 **Yes**。

### 6. 重命名 Watchlist

在 Watchlist 顶部标签上点右键 → **Rename Page（重命名页面）**，输入新名字。

---

## Mosaic 中的自选列表

新版 TWS 默认是 Mosaic 布局，没有独立的"Watchlist 窗口"，但功能由以下几个组件共同承担：

| Mosaic 组件 | 自选列表对应功能 |
| --- | --- |
| **Quote Panel（报价面板）** | 显示一组合约的实时行情（相当于 Watchlist 主体） |
| **Monitor Panel（监控面板）** | 持仓 + 自选合约的混合视图，包含账户汇总和分组（Group Header） |
| **Portfolio（投资组合）** | 当前持仓的明细视图 |

在 Mosaic 中添加 Mosaic 自选列表：

1. 在 Mosaic 工作空间的 Quote Panel 标签上点击。
2. 在 **Symbol（合约）** 列直接输入代码。
3. 想添加分组（Group Header）：在 Monitor Panel 上点右键 → **Create Group Header**。
4. 想配置哪些列显示：进入 **Global Configuration → Mosaic → Watchlist**。

Mosaic 与 Classic 的自选列表数据是**实时同步**的：你在 Classic 加的合约会出现在 Mosaic 的 Quote Panel，你在 Mosaic 的改动也会同步到 Classic 和 IBKR Mobile。

---

## 添加行情数据行（Market Data Lines）

第一次打开 Classic TWS 时，会出现一个示例 Quote Monitor，里面有几行样例行情。**Market Data Line（行情数据行）** 是自选列表里的一个条目，代表一个 ticker，显示合约类型、订单目的地、买卖价等关键属性。

### 如何添加一行

1. 在 **Financial Instrument（金融工具）** 列的空白行点击。
2. 输入底层合约代码，按 **Enter**。
3. 在下拉列表中选择该标的的**资产类型**（Stock / Option / Future / Forex / Bond 等）。
4. 选定具体合约后，这一行就会出现在自选列表中。

**外汇合约**用 `xxx.yyy` 格式输入，例如 `EUR.USD`、`USD.JPY`。

### Smart 行情聚合

如果选 **Smart** 作为交易所（而不是先选 Directed 再选具体目的地），行情数据会被**聚合**，默认订单路由也是 Smart。显示上，使用 Smart 聚合行情的 ticker 行**不会显示具体的交易所**，只有当你选择 Directed 路由时才会显示交易所。无论选哪种行情，下单时都可以单独修改 Destination 字段来改路由。

---

## 行情数据使用注意事项

- **行情行"激活"的条件**：该行在屏幕上可见时算激活。
- **警报占用行情**：你设置的每个警报（不论价格警报还是时间警报）无论你当前是否在查看相关合约，**都永久占用一条行情线路**。
- **行情优先级**：通过 TWS API 申请的行情优先级最高，其次是警报，最后才是普通行情显示。举例：你的交易页有 100 行行情 + 6 个价格警报挂在其他 6 个合约上，这 6 个警报合约会抢到行情，**交易页实际只显示 94 个合约的行情**。
- **OptionTrader 期权链不占用**：OptionTrader 中的期权链不计入可用行情线路。
- **费用与分配规则**：见 IBKR 官网的 [Market Data and News Subscriptions](https://www.interactivebrokers.com/en/index.php?f=14193) 页面。

!!! note "添加衍生品时的提示"
    当你为某个衍生品（如期权、期货）添加一行行情数据时，系统会询问是否要把**对应底层证券**也加入页面。如果选"是"，底层证券会出现在衍生品行的**上方**。

---

## 关键要点

- **跨平台自动同步**：自选列表的更改在桌面 TWS、Mosaic、IBKR Mobile、Client Portal 之间实时同步，无需手动操作。
- **右键菜单是下单与分析的核心**：Buy / Sell / Close / Chart / Alert / Fundamentals 等所有操作都从右键进入。
- **颜色圆点快速判断涨跌**：自选列表每行前面的圆点颜色直接对应涨跌方向（按你的配色设置）。
- **行情线路是稀缺资源**：API + 警报 + 显示优先级，必要时关闭不需要的行情行腾出名额。
- **Smart 行情聚合**：不指定具体交易所时使用 Smart，行情聚合、下单也用 Smart 智能路由。

---

## 相关章节链接

- [账户窗口（Account Window）](account-window.md) —— 看持仓和盈亏
- [行情数据（Market Data）](market-data.md) —— 行情订阅、费用、线路数
- [订单类型（Order Types）](order-types.md) —— 在自选列表右键下单时可选的订单类型
- [警报与通知（Alerts & Notifications）](alerts-and-notifications.md) —— 在自选列表里设置价格/时间警报
- [Ticker Tape](ticker-tape.md) —— 滚动行情条
- [颜色联动（Color Grouping）](color-grouping.md) —— 让多个面板根据合约代码自动联动

---

## 原文参考

- [Classic TWS Watchlist](https://www.ibkrguides.com/traderworkstation/classic-watchlist.htm) —— 本章主体内容
- [Monitor Panel](https://www.ibkrguides.com/traderworkstation/monitor-panel.htm) —— Mosaic 中"持仓 + 自选"的对应组件
- [Quote Panel](https://www.ibkrguides.com/traderworkstation/quote-panel.htm) —— Mosaic 的实时报价面板
- [Market Data and News Subscriptions](https://www.interactivebrokers.com/en/index.php?f=14193) —— IBKR 官方行情订阅说明
- 最后更新日期：**2025-10-08**