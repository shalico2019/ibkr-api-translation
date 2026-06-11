# 市场扫描器 Market Scanners

> 原文：[ibkrguides.com/traderworkstation/market-scanners.htm](https://www.ibkrguides.com/traderworkstation/market-scanners.htm)
> 最后更新于 2025-10-08

## 概述

**Market Scanners**（市场扫描器）按你设定的**合约类型 + 地域 + 筛选条件 + 排序参数**快速扫描相关市场，返回**满足条件的顶部合约列表**。支持**直接从扫描结果下单**，可把**配置保存为模板**反复使用。

主要类型：

- **Advanced Market Scanner**：通用型扫描器（按合约类型 + 地域 + 筛选 + 参数自由组合）。
- **US Corporate Bond Scanner**：美国公司债/市政债专用（含债专属筛选 + 排序）。
- **Complex Orders and Trades Scanner**：扫描某标的所有**有报价/今日成交的复杂组合策略**（垂直/水平/时间价差等）。
- **TICK & TRIN Market Indicators**：扫描纽约证交所的 **TICK 指数**（上涨股 - 下跌股）和 **TRIN（Arms Index）**（涨/跌家数比 ÷ 涨/跌成交量比），用于判断市场广度。
- **After-Hours Scanner Snapshot**：盘后/休市时仍可用的"快照扫描器"（数据为前收盘）。
- **Non-Subscribed Scanner Locations**：未订阅的地域市场——可扫描但**没有实时行情**（仅可订阅或用免费延迟数据）。

!!! info "名词对照"
    **Scanner** = 扫描器；**Scan** = 扫描（动词/结果）；**Parameter** = 排序参数（决定返回的"Top N"按什么排）；**Filter** = 筛选条件（缩窄候选范围）；**Template** = 模板（保存的扫描配置）；**Instrument** = 合约类型（Stock / Option / Future / Bond / Future Option 等）；**Location** = 地域（交易所/国家）。

## 打开 Advanced Market Scanner

1. **Mosaic**：**New Window** → 搜 `Advanced Market Scanner` → 选 **Advanced Market Scanner**。
2. **Classic TWS**：**Analytical Tools** 菜单 → **Advanced Market Scanner**（菜单项右侧小图标可"新窗口/新 Tab"二选一）。

## 定义扫描条件

按 6 步配置：

1. **选 Instrument（合约类型）**：Stock / Option / Future / Future Option / Bond / Index / Forex Pair / Combo / Market Statistics 等。**Scan 标题会随选择自动变**。
2. **选 Location（地域）**：随 Instrument 变化（如 Stock 模式下可选 US / Canada / Europe / Global 等）。**Global** 类扫描器可跨地域扫。
3. **设 Filter（筛选条件）**：缩窄候选合约（如 P/E 范围、市值 > 2,000,000、波动率区间等）。
4. **选 Parameter（排序参数）**：见下方 [Advanced Market Scanner 章节](#advanced-market-scanner) 内的"扫描参数清单"小节，决定"Top N"按什么排。
5. **点 Search**：**每 60 秒自动更新**结果。默认返回前 50 条，**Max results 字段**可改上限。
6. **Auto Refresh 复选框**：勾上后自动重跑扫描。

## 保存 / 加载模板

- **保存**：配置好后点 **Max results 字段右侧的"Save" 磁盘图标** → **Save Template** → 命名保存。
- **加载**：在任一 Market Scanner 页面点同一 Save 图标 → **Load Template** → 选文件 → Open。

## 扫描参数清单

源站列了 50+ 扫描参数，按"看的视角"分类如下。

### 价格 / 成交量活跃度

| 参数 | 含义 |
| --- | --- |
| Top% Gainers | 距前收盘涨幅 Top N |
| Top% Losers | 距前收盘跌幅 Top N |
| Top% Gainers Since Open | 距开盘价涨幅 Top N |
| Top% Losers Since Open | 距开盘价跌幅 Top N |
| Top Close-to-Open % Gainers | 前收 → 开盘涨幅 Top N |
| Top Close-to-Open % Losers | 前收 → 开盘跌幅 Top N |
| Most Active | 当日成交量（股数）Top N |
| Most Active($) | 当日成交额（美元）Top N |
| Most Active (Avg$) | 90 日均成交额 Top N |
| Top Volume Rate | 每分钟成交量 Top N |
| Top Trade Count | 当日成交笔数 Top N |
| Top Trade Rate | 最近 60 秒成交笔数/分钟 Top N |
| Hot Contracts by Volume | 今日成交量/30 日均成交量最高 |
| Hot Contracts by Price | `(lastTradePrice - prevClose) / avgDailyChange` 最高（绝对值） |
| Hot by Price Range | 当日振幅/波动率最高 |
| Top Price Range | 当日振幅最大（若今日在昨收范围内） |
| Halted | 已停牌合约 |
| Not Open | 当日尚未成交 |

### 52 周区间

| 参数 | 含义 |
| --- | --- |
| 13-Week High / Low | 13 周新高/低 |
| 26-Week High / Low | 26 周新高/低 |
| 52-Week High / Low | 52 周新高/低 |

### 高 / 低

| 参数 | 含义 |
| --- | --- |
| High Dividend Yield | 美国股票 dividend yield 最高的 750 只 |

### 期权隐含波动率（V30，30 日）

V30 是"距今 30 个日历日"的平值期权隐含波动率，计算方法：100 步二叉树（美式）/ Black-Scholes（欧式） → 用两个连续到期月份各 4 个最接近平值的 strike → 抛物线拟合 → 线性插值得 30 日方差 → 开平方根。**注：波动率产品本身的 V30 不会被改变**。

| 参数 | 含义 |
| --- | --- |
| Highest Option Imp Vol | V30 最高 |
| Lowest Option Imp Vol | V30 最低 |
| Top Option Imp Vol % Gainers | V30 较昨日 15 分钟均值涨幅最高 |
| Top Option Imp Vol % Losers | V30 较昨日 15 分钟均值跌幅最高 |
| High Option Imp Vol Over Historical | V30 vs Historical Vol 最大 |
| Low Option Imp Vol Over Historical | V30 vs Historical Vol 最小 |

### 期权量 / 持仓

| 参数 | 含义 |
| --- | --- |
| Most Active by Opt Volume | 期权成交量最高 |
| Most Active by Opt Open Interest | 期权持仓量最高 |
| High / Low Opt Volume P/C Ratio | 期权成交量 Put/Call 比率最高/最低 |
| High / Low Option Open Interest P/C Ratio | 期权持仓 Put/Call 比率最高/最低 |
| Hot by Option Volume | 期权量 / 10 日均值 最高 |

### Reuters 财务比率（基本面扫描）

| 参数 | 含义 |
| --- | --- |
| High / Low Growth Rate (EPS) | EPS 增长率最高/最低 Top 50 |
| High / Low P/E Ratio | 市盈率最高/最低 Top 50 |
| High / Low Quick Ratio | 速动比率最高/最低 Top 50 |
| High / Low Dividend Yield | 股息率最高/最低 Top 50 |
| High / Low Return on Equity | ROE 最高/最低 Top 50 |
| High / Low Price/Book Ratio | P/B 最高/最低 Top 50 |

> 财务比率扫描结果会在 Description 字段后插入对应字段（Growth Rate / P/E Ratio / Quick Ratio / Div Per Share / Return on Equity / Price/Book Ratio），鼠标悬停看具体值。

### Market Statistics（市场统计）

Instrument 选 **Market Statistics** + Location 选具体交易所后，扫描会显示该交易所的：

- **Advancing / Declining / Unchanged**（上涨/下跌/平盘家数）
- **Up / Down / Unchanged / Total Volume**（上涨/下跌/平盘/总成交量）
- **TRIN & TICK 指标**

## US Corporate / Municipal Bond Scanner

1. **New Window** → 搜 `Bond Scanner`（或 **Analytical Tools** 菜单 → **Bond Scanner**）。
2. **Instrument** 选 **Corporate Bonds** 或 **US Municipal Bonds**。
3. 设**筛选条件**：
    - **数量**（按面值千计）、**价格**、**当前收益率**、**yield-to-worst**。
    - **代码** 包含/不包含。
    - **发行人** 包含/不包含。
4. 选**排序条件**（排序项同时成为页面名）。
5. **Max results** 限返回数量。
6. **行业勾选框**：包含/排除某些行业债。
7. 点 **Search**；**Auto Refresh** 自动重跑。

> 更多：[IBKR Campus Bond Scanner 课程 Part 1](https://ibkrcampus.com/trading-lessons/using-fixed-income-scanners-part-1/) / [Part 2](https://ibkrcampus.com/trading-lessons/using-fixed-income-scanners-part-2/)

## Complex Orders and Trades Scanner

扫描**某标的所有复杂组合策略**（含价差、跨期、蝶式等）的**当日报价或成交**。

1. **New Window** → 搜 `Complex Orders and Trades Scanner`。
2. **点 Volume 列排序**可找出当日最活跃的策略。
3. 可作为 Mosaic 预定义扫描器 Tab 嵌入 Monitor Panel（详见 [Mosaic 自选列表](watchlist.md#mosaic)）。

## TICK & TRIN Market Indicators

- **Tick Index**：上涨股数 - 下跌股数（瞬时市场情绪指标，正值强势 / 负值弱势）。
- **TRIN（Arms Index）**：(上涨家数 / 下跌家数) ÷ (上涨股成交量 / 下跌股成交量)。< 1.0 偏多 / > 1.0 偏空。
- 用法：**Search** 输 `tick` 或 `trin` → 选 Index → 数据行 + Index Arb 表打开。
- **注：这些指标 Index 不可交易**。

## After-Hours Scanner Snapshot

- **盘后 / 休市**仍可使用的大多数 TWS Market Scanners。
- 数据用**前一日收盘**静态快照，结果以**灰色背景**标识。
- 等市场（含延长时段）完全关闭后生效。

## Non-Subscribed Scanner Locations

- 未订阅的市场数据 Location 在 Location 列表中**斜体 + 锁图标**显示。
- 包含这类 Location 时：
    - **可扫描出合约**，**但无实时行情**。
    - 搜索参数也斜体化以提醒。
    - 点 Search 时弹窗提示，可直接**加订**或选**免费延迟数据**。
    - 数据行**黄色高亮**表示在用延迟数据。
    - 配合 [After-Hours Scanner Snapshot](#after-hours-scanner-snapshot)，可看到盘后灰色背景的延迟数据。

## 关键要点

- **Advanced Market Scanner** 是主力 —— 6 步配置（Instrument / Location / Filter / Parameter / Max results / Auto Refresh）。
- **每个扫描参数都有特定语义**，选错参数会导致"Top N"完全不是你想要的（如 Top% Gainers 与 Top% Gainers Since Open 是两个不同视角）。
- **TICK / TRIN 是市场广度指标**，**不可交易**，只用于判断市场情绪。
- **盘后 / 休市**用 [After-Hours Scanner Snapshot](#after-hours-scanner-snapshot)（灰色背景）。
- **未订阅 Location** 可扫出合约但**无实时行情**（黄色高亮延迟数据或加订）。
- **V30 隐含波动率** 是 IBKR 专属计算，详见参数说明。
- **扫描结果可直接下单**（在结果行上点右键 → Buy/Sell）。
- **扫描模板可保存**反复用。

## 相关章节

- [Mosaic 布局](layouts.md) — 把多个 Scanner 拼进 Mosaic
- [市场数据](market-data.md) — Market Data Subscription 与 Scanner 的关系
- [订单类型](order-types.md) — Scanner 结果能下的订单类型
- [订单管理](order-management.md) — 从 Scanner 下单后的流程
- [警报与通知](alerts-and-notifications.md) — 把扫描结果转成条件警报

## 原文参考

源站 hub 页：[market-scanners.htm](https://www.ibkrguides.com/traderworkstation/market-scanners.htm) — 7 个子页：

- [Advanced Market Scanner](https://www.ibkrguides.com/traderworkstation/create-a-market-scanner.htm)
- [Market Scanner Types](https://www.ibkrguides.com/traderworkstation/market-scanner-types.htm)（50+ 参数清单）
- [Use the US Corporate Bond Scanner](https://www.ibkrguides.com/traderworkstation/us-corporate-bond-scanner.htm)
- [Non-Subscribed Scanner Locations](https://www.ibkrguides.com/traderworkstation/non-subscribed-scanner-locations.htm)
- [After Hours Scanner Snapshot](https://www.ibkrguides.com/traderworkstation/after-hours-scanner-snapshot.htm)
- [TICK & TRIN Market Indicators](https://www.ibkrguides.com/traderworkstation/tick-and-trin-market-indicators.htm)
- [Complex Orders and Trades Scanner](https://www.ibkrguides.com/traderworkstation/complex-orders-and-trades-scanner.htm)

附加资源：[IBKR Campus Mosaic Market Scanner 课程](https://ibkrcampus.com/trading-lessons/mosaic-market-scanner/)（非 hub 子页，源站外）。
