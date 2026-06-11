# 风险导航器 Risk Navigator

> 原文：[ibkrguides.com/traderworkstation/risk-navigator.htm](https://www.ibkrguides.com/traderworkstation/risk-navigator.htm)
> 最后更新于 2025-10-08

## 概述

**Risk Navigator**（风险导航器）是 TWS 的**实时市场风险管理**模块。它以类似电子表格的界面，从**组合层面**出发，逐级下钻（drill-down）到**具体仓位/合约**，跨多个资产类别衡量**风险敞口**。支持实时刷新（含订单成交触发）、What-If 假设组合、风险场景分析、Greeks（Delta/Gamma/Vega/Theta）、VaR、压力测试、警报触发下单等。

!!! info "名词对照"
    **Risk Navigator** = 风险导航器；**What-If Portfolio** = 假设组合（红框标识）；**Drill-Down** = 下钻（点击展开更细粒度的明细）；**Greeks** = 期权希腊字母风险（Delta/Gamma/Vega/Theta）；**VaR** = Value at Risk（在险价值）；**VAR** = 同上，源站大小写不统一，本文档统一写 **VaR**。

## 打开 Risk Navigator

1. **Mosaic**：左上 **New Window** → 搜 `Risk Navigator` → 选以下之一：
    - **My Portfolio**：当前真实持仓。
    - **New What-If**：新建假设组合（可选择复制当前持仓或空白开始）。
    - **Saved What-If**：打开已保存的假设组合。
2. **Classic TWS**：**Analytical Tools** 菜单 → 搜 `Risk Navigator`。
3. 默认**每 10 秒**自动刷新数据；订单成交时**即时刷新**。
4. **Measure by Price Change / Volatility Change** 报告是唯一不实时刷新的 —— 它用**上一交易日收盘价** + **下一交易日收盘时间**作为场景参数。

> **找不到入口？** 在 New Window 列表底部点 **展开箭头**（→ Portfolio 类别下）。

## 界面结构

Risk Navigator 窗口分 6 块（按位置编号）：

1. **Risk Dashboard（顶部横条）**：账户关键指标快照（Net Liquidation / P&L / 维持保证金 / 初始保证金 / VaR / ES / Beta 等），始终显示。
2. **标题栏（Title Bar）**：显示组合名 + 类型 + 菜单（Portfolio / Edit / Report / Dimensions / Metrics / View / Settings / Margin）。
3. **产品 Tab 标签集**：在不同资产/数据类型间切换。
4. **Report Viewer（报告查看器）**：根据 Report Selector 选定的报告展示数据。每个 Tab 的 Report Viewer **独立维护**（改一个 Tab 不会影响其他 Tab）。
5. **Portfolio Relative P&L Graph（组合相对盈亏图）**：根据标的价格变动百分比展示组合价值变化。
6. **Report Selector（报告选择器）**：控制 Report Viewer 与 P&L 图的输出。可选内容随 Tab 变化（Equity Tab 上的报告在 Bond Tab 不一定适用）。

## 产品 Tab 列表

Risk Navigator 把持仓按**资产类别 + 风险视角**分成多个 Tab，**每个 Tab 的 Report Viewer 是独立的**，要看哪个 Tab 就点哪个 Tab → 选 Report：

- **Equity（股票/期权/期货/非债券衍生品）**
- **Bond（债券/票据）**
- **Forex（外汇现金与 FX 指数）**
- **Commodity（商品/商品指数）**
- **Money Market（货币市场）**
- **Structured Products（结构化产品）**
- **Volatility Products（波动率产品，如 VIX 期货/ETF）**
- **P&L Summary（盈亏汇总）**
- **VAR（VaR Tab，独立风险方法）**
- **Margin Sensitivity（保证金敏感性）**

下面把**最常用的 5 个 Tab 展开**说明。

### Equity Tab（最丰富）

容纳所有"不属于其他明确分类"的非债券仓位。报告清单：

- **Portfolio Report**：所有仓位的风险与敞口汇总。
- **Risk by Position Report**：按"标的"维度的每条仓位风险。
- **Risk by Underlying Report**：默认开启的"按标的"风险总览（提供 drill-down 深度控制）。
- **Risk by Industry Report**：按行业（可下钻到子行业/具体标的/衍生品）。
- **Risk by Country Report**：按国家（可指定"按注册地/发行地/母公司地/最终母公司地"四种口径）。
- **Plot Data by Underlying**：P&L 图上 ±3%/6%/9%/12%/15% 切分器的具体数值。
- **Measure by Underlying and Maturity**：按"标的 × 最后交易日"矩阵。
- **Measure by Price Change and Volatility Change**：175 个市场情景矩阵（标的价格 ±30% × 波动率 ±30% × 利率 ±100bp）。**必须**先从 Settings 菜单选 **Download Global Risk**。
- **Portfolio Statistics Report**：股票/期货汇总 + 期权汇总 + 现金余额 + Opaque Positions（无法算风险的仓位）。
- **Value at Risk Report**：1 天 95% / 99.5% 置信度下的最大损失。
- **P&L Pie Chart**：按仓位颜色的饼图（默认：亏红/盈绿/平蓝）。

### Bond Tab

所有 bill/bond/note 仓位。报告：

- **Risk by Position**：按标的的每条仓位。
- **Risk by Issuer**：按发行人排序。
- **Risk by Industry**：按行业（含下钻）。
- **Risk by State**：按州（仅市政债）。
- **Risk by Country**：四种口径（同 Equity）。

### Forex Tab

- **Portfolio / Risk by Position / Risk by Underlying / Plot Data / Portfolio Statistics / P&L Pie Chart**：与 Equity 类似。
- 关键差异：所有 FX 标的（如 EUR.USD / EUR.JPY）**会被拆解**为一两个以"参考货币"（一般是 USD）为分母的**主 FX 合约**，子组合的所有标的变动都由这些主 FX 合约的变动"组合"出来。
- **真实 FX 仓位不直接支持**（但**现金余额会被翻译成 FX 仓位**计入）。

### Commodity Tab

所有"商品"或"商品指数"最终标的的合约，按商品类别分组。报告清单与 Equity 相同（无 Country / Industry 的 Country 维度）。

### VAR Tab

- 整个组合的 **On Demand VaR**，按子组合 → 货币 → 组合聚合。
- **情景方法**：
    - **Historical（历史法）**：用过去数据估计。
    - **Monte Carlo（蒙特卡洛）**：用模型估计。
- **置信度**可选（100% 仅在 Historical 模式下可用）。
- **时间窗口**（天数）可调。
- **支持 What-If 组合**。

## 报告设计器（Report Designer）

不同 Tab 的 Report Viewer **独立维护字段**。要批量配置时用 Report Designer：

1. **Report** 菜单 → **Designer**。
2. 左侧选报告 → 中段看已显示字段（Shown Columns）→ 右侧选可添加字段（Available Columns）。
3. 可对每个报告**增删/重排字段**，不需逐个 Tab 改。
4. **Reset report** 单报告还原默认；**Restore factory configuration** 全部报告还原。
5. 改动可**仅作用于当前报告**或选 **Apply configuration for all portfolios (pfs)** 同步所有组合。

## 报告选择（按 Tab × Report 矩阵）

源站把"哪个报告出现在哪个 Tab"画成一张大表，最常用组合是：

| 报告名 | Equity | Bond | Forex | Commodity | Money Market | Structured | Volatility |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Portfolio | ✓ | – | ✓ | ✓ | ✓ | ✓ | ✓ |
| Risk by Position | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Risk by Underlying | ✓ | – | ✓ | ✓ | ✓ | ✓ | ✓ |
| Risk by Industry | ✓ | ✓ | – | – | – | ✓ | ✓ |
| Risk by Country | ✓ | ✓ | – | – | – | – | – |
| Risk by State | – | ✓ | – | – | – | – | – |
| Risk by Issuer | – | ✓ | – | – | – | – | – |
| Plot Data by Underlying | ✓ | – | ✓ | ✓ | – | – | ✓ |
| Measure by Underlying and Maturity | ✓ | – | – | – | – | – | – |
| Measure by Price Change & Volatility Change | ✓ | – | – | – | – | – | – |
| Portfolio Statistics | ✓ | – | ✓ | ✓ | ✓ | ✓ | ✓ |
| Value at Risk | ✓ | – | – | – | – | – | – |
| P&L Pie Chart | ✓ | – | ✓ | ✓ | – | – | – |

## 行业编辑器（Industry Editor）

**Edit** 菜单 → **Edit industry groups** 打开。把某个标的重新归到不同 Sector/Group/Sub-Group，或让它**同时属于多个行业**。

- **Edit 菜单 → New Entry for Underlying** 给同一标的建第二条行业归属行。
- 改过的字段旁出现**星号 `*`** 标识。

## Risk Dashboard 字段

Dashboard 横条（顶部）默认显示 8 个关键指标，每个都带 Info 图标的悬浮说明：

| 字段 | 含义 |
| --- | --- |
| Net Liquidation | 账户总净值（取自 Account Window） |
| P&L | 当日全组合 P&L（取自 P&L Tab 的 All Contracts 行的 P&L for the Day） |
| Maintenance Margin | 当前维持保证金（也支持 What-If 组合） |
| Initial Margin | 当前初始保证金（也支持 What-If 组合） |
| VAR | 全组合 VaR |
| Expected Shortfall (ES) | 期望损失（VaR 之后的所有损失的平均值） |
| Average Beta | 各仓位 raw beta 之和 / 仓位数 |
| Portfolio Beta | 各仓位加权 beta 之和 |

> 隐藏/显示：**View** 菜单 → **Risk Dashboard**。

## What-If 假设组合

What-If Portfolio 是**完全独立的假设组合**，用红框标识。**用来"先改后看"，不直接下单**。

### 打开 What-If

1. **New Window** → 搜 `Risk Navigator` → 选 **New What-If**。
2. 弹窗询问：
    - **基于当前组合**：把真实持仓复制过来，可在上面加减仓。
    - **空白开始**：手动点 **New** 加合约或从主窗口**拖拽合约**进来。
3. **P&L 标签** → 展开 **Cash** 段 → 双击币种单元格可改余额；右键 **Add New Cash Position** 加新币种。

### 增删改仓位

- 双击任一仓位的 **Position** 单元格，直接编辑。
- 点 **NEW** 加一条新合约（弹窗中输代码、定义资产、填数量）。
- **Edit 菜单**：
    - **Clear**：清空所有（仅 What-If）。
    - **Reload from file**：撤销未保存改动（仅未保存文件，标题末尾带 `*`）。
    - **Add From / Subtract From**：与其他组合合并/相减（自动按合约代码对冲）。
    - **Edit industry groups / Edit Beta Values / Edit Beta Calculation Method**：分别在 [Edit 菜单文档](risk-nav-menus.md) 中详述。

### 保存 / 重载

- **Portfolio 菜单 → Save As**：命名保存。
- **Portfolio 菜单 → Save**：覆盖保存。

### 把 What-If 变成真实订单

1. 打开 **Metrics 菜单**，确保 **Trade** 列已显示。
2. 在想真实下单的 What-If 仓位上：
    - 勾上 **Include/Exclude 复选框**（被排除的不参与风险计算且不能 Trade）。
    - 勾上 **Trade 复选框**。
3. 顶部点 **Trade 按钮**。
4. TWS 会自动按"现持仓 vs What-If 持仓"差额开订单（如现持 100 AAPL，What-If 设 700，订单会开 600 股）。
5. **手动 Transmit** 完成下单（**Risk Navigator 不会自动发送**）。

### 到期仓位处理

打开含**已到期**仓位的 What-If 时，会弹窗问"是否按交割规则转换成标的物"：

- **价内的期权** → 转成对应数量的正股 + 现金。
- **价外的期权** → 直接移除。
- 选 **Remember my decision** 后不再询问。

## 场景分析（Scenario Analysis）

Risk Navigator 提供两类场景分析，所有场景都是**简化的假设结果**，只用一两个参数描述所有市场价格的变动。**不要把场景分析当作市场预测**，目的是为组合行为提供一个**探索范围**。

### 波动率协调场景（Volatility-Coordinated Scenarios）

- 同时冲击市场价格和波动率：因为波动率变动是价格变动的**确定性函数**，仍是 1 维子空间。
- 公式（股票及股票衍生波动率产品）：`Y = -X (X>0), Y = -10X (X<0)`（X=价格冲击，Y=标的波动率冲击）。
- **VIX 有下限**（避免极不合理场景）。
- **波动率产品本身的波动率不在这些场景里变动**。

### 自定义场景（Custom Scenario）

- **View 菜单 → Custom Scenario** 打开编辑器。
- **All Underlyings / Any Underlyings / 单标的** 三个范围选项。
- 可改：**Date（未来某日）/ Underlying Price / Volatility**。
- **价格变动类型**：
    - **ExpV**：精确值（覆盖）。
    - **Chg**：增量。
    - **Chg%**：百分比变动。
- 注意：**每次修改都跟"实时市场"比较**（不会在上一 Custom Scenario 基础上叠加）。

## Portfolio Relative P&L 图

X 轴 = 标的价格变动百分比（默认 ±30%），Y 轴 = 组合价值变化。**4 个常用开关**：

- **X 轴范围**：右上角设置。
- **Beta Weighted Portfolio**（View 菜单）：标的变动按 Beta 加权（默认等百分比）。
- **Confidence Interval（黄色竖线）**：默认 99.5% 置信度下的"单日最坏损失"。可在 **Settings 菜单 → Confidence** 切 95% / 99% / 99.5%。
- **Vol-Coord（波动率协调）**：对含期权/波动率产品的组合，标的跌 X% 假设短端隐含波动率同步上升 10X%、长端衰减到 2X%；标的涨 X% 假设短端隐含波动率下降 X%、长端衰减到 X/5%。
- **Vol Up / Vol Down by 15%***（右键菜单）：在当前 IV 基础上 ±15% 重新画 P&L（不是绝对值，是**相对百分比变动**）。

## 组合 Beta 加权（Portfolio Beta Weighting）

- **View 菜单 → Beta Weighted Portfolio** 开启。
- P&L 图上同时显示**等百分比变动**与 **Beta 加权**两条线（**Dual Plots** 开关在同菜单）。
- **Edit 菜单 → Edit Beta Values** 手动改 Beta（Manual Beta Editor）。
- **Edit 菜单 → Edit Beta Calculation Method** 改 Beta 计算方法（参考指数、窗口等）。
- **Settings 菜单 → Beta Reference Index** 选参考指数（默认 SPX）。

## 订单预检（Check Risk Pre-Order）

下单前**模拟订单成交**对组合 P&L 的影响：

1. **未发送的订单上右键 → Check Risk**（或**Trade 菜单 → Check Risk** 批量）。
2. 弹出 Portfolio Relative P&L 图，**红实线 = 现状 P&L**，**蓝虚线 = 含未发送订单的 What-If P&L**。
3. **View Details** 按钮打开完整 What-If（Order Only / With Portfolio 二选一）。
4. 多个订单：按住 **Ctrl** 多选 → Trade 菜单 → Check Risk。

## 警报（Risk Navigator Alarms）

- **Right-click 合约 → Set Alarm** 弹出警报定义。
- **可监控的 measure**（"Position" 系列，**首字母大写**代表组合层级，不是合约层级）：Delta / Futures Delta / Gamma / Delta Dollars / Gamma Dollars / Vega / Theta。
- **Bond Tab 还可监控**：Dv01 / Duration / Convexity。
- **可设置位置**：单仓位 / All Underlying 级别。
- **Add Single Order**：警报触发时直接弹 **Order Ticket**（**建议用 Relative 订单**，触发时市价可能已变）。
- **View 菜单 → Alarms** 查看所有活跃警报。
- **Right-click 合约 → Remove Alarm** 删除。

## 关键菜单

### Portfolio 菜单

- **New / Open / Save / Save As / Import（CSV）/ Open 'My Portfolio' / Close**

### Edit 菜单

- **Clear / Reload from file / Add From / Subtract From**（仅 What-If）
- **Edit Industry groups / Edit Beta Values / Edit Beta Calculation Method**

### Report 菜单

- **Select report**（同 Report Selector）/ **Personality**（交易员角色，决定哪些字段显示）/ **Designer**（批量改字段）/ **Reset report** / **Restore factory configuration** / **Apply configuration for all portfolios** / **Export**（CSV/XLSX）/ **Stock Yield Enhancement** / **Exposure Fee**

### Dimensions 菜单

- **Country / Industry / Contract**（添加维度字段）/ **Filters**（按到期/资产类别/Right 过滤）/ **Scenario Risk Matrix**（仅 Measure by Price Change 报告时可用）

### Metrics 菜单

- **Size / Value / Unrealized P&L / Realized P&L / Total P&L / P&L for Day / Price / Price Change / Price Change % / Value / Value % NLV / Gross Value / Gross Value % NLV/GMV / Underlying Price / Average Cost / Time Value / Conversion Rate / Currency / VAR**
- **Portfolio Analysis Columns**：Mtd/Ytd Mark-to-Market & Realized & Unrealized P&L（绝对值 + %）
- **Position Risk Columns**：Position Delta / Delta Dollars / Delta Dollars % NLV/GMV / Futures Delta / Gamma / Gamma Dollars / Vega / Theta（首字母大写 = 仓位级）
- **Contract Risk Columns**：Contract Delta / Gamma / Vega / Theta / Implied Volatility / Historical Volatility / Tracking Factor（与 Position 区别：Contract = 单合约，Position = 仓位）
- **Plot data Columns**：3% / 6% / 9% / 12% / 15% / Settings（调切分器）
- **Descriptive Columns**：Description / Currency
- **Hedge**：Hedge Column（Hedge 按钮生成对冲订单，需手动 Transmit）/ **Trade Column / Include Positions**（仅 What-If）
- **Beta Risk Columns**（[参见 Beta 加权](portfolio-beta-weighting.md)）

### View 菜单

- **Refresh Table** / **Alarms** / **Risk Dashboard** / **Beta Weighted Portfolio** / **Dual Plots** / **Custom Scenario** / **Positions not included** / **Highlight measures** / **Span cells** / **Pie chart** / **Vertical crosshair**

### Settings 菜单

- **Confidence（95% / 99% / 99.5%）**
- **Reference Currency**（组合基准货币；FX Tab 的 FX 拆解也用它）
- **Beta Reference Index**
- **Country**（Bond Tab 的 Risk by Country 报告用：Registration / Issuer Domicile / Parent Domicile / Ultimate Parent Domicile）
- **Scaling**（缩放设置）
- **Percentages / Percentage Column Calculations**（用 NLV 还是 GDD）
- **Drilling**（下钻深度）
- **Greek Aggregations**（跨标的 Greeks 聚合方式）
- **Date Scenario**（Custom Scenario 的日期是否限于选中标的）
- **Pin First Row**（默认开，滚动时首行固定在表头下）
- **Exclude undefined values in aggregations**（聚合时排除 NaN 仓位）
- **Download Global Risk**（必须开才能用 Measure by Price Change & Volatility Change 报告 —— 较费 CPU/内存，**按需开**）

### Margin 菜单

- **Reference Margin Type**：My Account Type（默认）/ STKCASH / STKMRGN / STKNOPT / FUTONLY / FUTNOPT / IRAMRGN / PMRGN / GPMRGN / CRTMRGN / BET / AWAY
- **Margin Mode**（仅 What-If）
- **Refresh**

## 关键要点

- **Risk Dashboard** 始终在顶部；隐藏用 **View → Risk Dashboard**。
- **Measure by Price Change & Volatility Change** 是**唯一不用实时数据**的报告（用前收 + 次日收盘时间），记得先 **Download Global Risk**。
- **报告间数据不共享**：每个 Tab 的字段独立维护。
- **What-If 用红框标识**，含 Trade 按钮一键转真实订单（仍需手动 Transmit）。
- **市场情景是简化模型**，不要当预测用。
- **波动率协调场景**仅在含期权/波动率产品的组合上有意义。
- **Beta 加权** 对含高 Beta 衍生品的组合影响显著。
- **警报**支持 Greeks + Bond 风险指标 + 触发时下单。
- **Check Risk Pre-Order** 是下单前必走一步。

## 风险提示

- VaR 是**理论值**，不假设极端尾部事件。
- **场景分析**是简化模型，**不预测实际市场行为**，仅供"探索范围"。
- 真实市场压力下，结果会与任何 a priori 场景**显著不同**。

## 相关章节

- [账户窗口](account-window.md) — Risk Dashboard 字段的源数据
- [订单管理](order-management.md) — 下单流程
- [订单类型](order-types.md) — Relative 订单（警报触发时推荐）
- [订单预设](order-presets.md) — 订单属性配置
- [警报与通知](alerts-and-notifications.md) — TWS 全局警报系统（区别于 Risk Navigator 专属警报）
- [Mosaic 布局](layouts.md) — 怎么把 Risk Navigator 拼进 Mosaic

## 原文参考

源站 hub 页：[risk-navigator.htm](https://www.ibkrguides.com/traderworkstation/risk-navigator.htm) — 18 个子页：

**核心入口**：
- [Open Risk Navigator](https://www.ibkrguides.com/traderworkstation/open-risk-navigator.htm)
- [Understanding the Risk Navigator Interface](https://www.ibkrguides.com/traderworkstation/understanding-risk-navigator.htm)
- [Risk Dashboard](https://www.ibkrguides.com/traderworkstation/risk-dashboard.htm)
- [Products and Tabs](https://www.ibkrguides.com/traderworkstation/products-and-tabs.htm)
- [Risk Navigator Reports](https://www.ibkrguides.com/traderworkstation/risk-nav-reports.htm)
- [Risk Navigator Menus](https://www.ibkrguides.com/traderworkstation/risk-nav-menus.htm)

**各 Tab 详细报告**：
- [Equity Tab](https://www.ibkrguides.com/traderworkstation/risk-nav-equity.htm)
- [Bond Tab](https://www.ibkrguides.com/traderworkstation/risk-nav-bond.htm)
- [Forex Tab](https://www.ibkrguides.com/traderworkstation/risk-nav-forex.htm)
- [Commodity Tab](https://www.ibkrguides.com/traderworkstation/risk-nav-commodity.htm)
- [VAR](https://www.ibkrguides.com/traderworkstation/risk-nav-var.htm)

**场景与组合**：
- [Scenario Analysis](https://www.ibkrguides.com/traderworkstation/scenario-analysis.htm)（含 Vol-Coord / Portfolio Relative P&L Graph / Custom Scenario）
- [What-If Portfolios](https://www.ibkrguides.com/traderworkstation/what-if-portfolios.htm)
- [Portfolio Beta Weighting](https://www.ibkrguides.com/traderworkstation/portfolio-beta-weighting.htm)
- [Portfolio Relative P&L Graph](https://www.ibkrguides.com/traderworkstation/portfolio-relative-pnl-graph.htm)

**配置 / 工具**：
- [Trader Personalities](https://www.ibkrguides.com/traderworkstation/risk-nav-trader-personalities.htm)
- [Check Risk Pre-Order](https://www.ibkrguides.com/traderworkstation/check-risk-pre-order.htm)
- [Change Font Size](https://www.ibkrguides.com/traderworkstation/change-risk-nav-font-size.htm)
- [Stock Yield On Demand](https://www.ibkrguides.com/traderworkstation/stock-yield-on-demand.htm)
- [Create a Basket Hedge Order](https://www.ibkrguides.com/traderworkstation/create-a-basket-hedge-order.htm)
- [Upload a Portfolio](https://www.ibkrguides.com/traderworkstation/upload-a-portfolio.htm)
- [Increase Memory Size](https://www.ibkrguides.com/traderworkstation/increase-tws-memory-size.htm)
- [Alarms](https://www.ibkrguides.com/traderworkstation/risk-navigator-alarms.htm)

附加资源：[IBKR Campus Risk Navigator 课程](https://ibkrcampus.com/trading-course/ibkrs-risk-navigator/)（非 hub 子页，源站外）。
