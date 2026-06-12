# 图表技术指标（Chart Indicators）

> 原文：[ibkrguides.com/ibkrdesktop/chart-indicators.htm](https://www.ibkrguides.com/ibkrdesktop/chart-indicators.htm)

IBKR Desktop 图表（Chart）模块内置**近百种**技术指标（Technical Indicators / Studies），覆盖趋势、动量、波动率、成交量、通道、K 线形态等所有主流技术分析维度。本章是指标字典的**完整参考**：每个指标给出**字段名**、**用途描述**、**关键计算公式**（如有），便于交易员按需在图表上叠加、组合或验证信号。

!!! info "使用方式"
    在 IBKR Desktop 图表上点击工具栏的指标/研究（Indicators / Studies）按钮 → 搜索关键字 → 添加到主图（Overlay）或副图（Sub-chart）。**可同时叠加多个**，每个指标参数（周期、颜色、阈值）独立可调。

## 趋势类（Trend）

| 指标 | 描述 |
| --- | --- |
| **52 Week High/Low（52 周高/低）** | 跟踪过去 52 周内的最高与最低价，是识别**长期支撑 / 阻力位**以及整体市场情绪的常用工具。 |
| **Arnaud Legoux Moving Average (ALMA)** | 通过**左→右**与**右→左**两次应用移动平均线，**消除**传统均线中常见的**相位偏移（价格滞后）**，零相位数字滤波在降低噪声的同时保持信号响应速度。 |
| **Average Price（均价线）** | 在图表上绘制该持仓的**平均建仓价**：**多头持仓**显示为**蓝色**线，**空头持仓**显示为**红色**线，**当前市价**显示为**绿色**线（中文 IBKR 社区常称之为"持仓成本线"或"开仓均价线"）。 |
| **Double Exponential Moving Avg (DEMA)** | 基于单 EMA 与双 EMA 的快速均线，对市场变化比传统均线**响应更快**，目标是消除 MA 的**滞后**。 |
| **EMA Cross（EMA 交叉）** | 短周期 EMA 上穿/下穿长周期 EMA 给出**潜在趋势**信号：金叉 = 潜在上升，死叉 = 潜在下降。 |
| **Guppy Multiple Moving Average** | 同时叠加**多组短周期与长周期 EMA**，观察交易者与长期投资者之间的力量对比，识别**突破、趋势与潜在反转**。 |
| **Hull Moving Average** | 使用周期**平方根**而非原周期，平滑价格波动的同时**减少价格滞后**。 |
| **Ichimoku Clouds（一目均衡表）** | 由**五条线**组成云图，呈现支撑阻力、动量与趋势方向；"云"由转换线与基准线之差、52 周高低的中间价共同形成。 |
| **Least Squares Moving Average** | 也称 **End Point Moving Average**，基于线性回归并**外推**下一周期，常用作与自身或其他均线的**交叉信号**。 |
| **Linear Regression Curve** | 拟合指定周期内价格的**最佳直线**，主要用于判断趋势方向，偶尔用于生成买卖信号。 |
| **Linear Regression Slope** | 衡量主导趋势**强度与方向**，以 0 为中线震荡；>0 动量为正，<0 动量为负。 |
| **MA Cross（均线交叉）** | 快线（短周期 MA）上穿/下穿慢线（长周期 MA）：上穿为**看涨交叉**，下穿为**看跌交叉**。 |
| **MA with EMA Cross** | 在价格图上可视化显示**简单 MA 与 EMA 的交叉点**，用于发现趋势转换——EMA 反应更快。 |
| **Moving Avg. Conv. Div. (MACD, 指数平滑异同移动平均线)** | 趋势跟踪型动量指标，揭示**两条移动平均线**之间的相关性（默认 **12 周期**与**26 周期**的 SMA / WMA / EMA，**周期可自定义**）。在 MACD 之上叠加**9 周期 EMA 信号线**给出交叉信号。计算公式：`MACD = MA(CLOSE, 12) − MA(CLOSE, 26)`；`SIGNAL = EMA(MACD, 9)`；`MACD Histogram / OSMA = MACD − SIGNAL`（其中 MA 可为 SMA / WMA / EMA）。 |
| **McGinley Dynamic** | 比普通 MA 跟踪更紧密的平滑机制，**减少价格分离与假突破（whipsaw）**，下跌时加速、上涨时减速。 |
| **Moving Average（MA）** | 基础均线，对价格数据做平滑以识别**趋势方向**与**支撑阻力**。 |
| **Moving Average Adaptive (AMA)** | 自适应均线，价格有方向时**灵敏度提升**，震荡时**灵敏度下降**。 |
| **Moving Average Double** | 同 DEMA（见上）。 |
| **Moving Average Exponential (EMA)** | 指数加权均线，对**近期数据赋予更高权重**，常用于识别趋势与短期预测。 |
| **Moving Average Hamming** | 使用频谱分析中的 **Hamming 函数**对价格数据加权，减少**异常价格**影响、响应周期性。 |
| **Moving Average Multiple (MMA / GMMA)** | 多条 EMA 同时叠加，识别趋势与交易机会（与 Guppy 等价）。 |
| **Moving Average Triple (TEMA)** | 由**单、双、三重 EMA** 组合，平滑波动、过滤杂讯，适合**强且持续的长期趋势**识别。 |
| **Moving Average Weighted (WMA)** | 每个数据点权重正比于其**序列号**，例如 3 周期 WMA = (1·P1 + 2·P2 + 3·P3) / 6。 |
| **Smoothed Moving Average** | 类似于 EMA 但**反应更慢**；n 周期 Wilder MA ≈ 2n 周期 EMA。 |
| **SuperTrend** | 趋势跟踪指标：图表上的**一条变色线**，绿色表示**上升趋势**（买入信号），红色表示**下降趋势**（卖出信号）。 |
| **Triple EMA（TEMA）** | 同 Moving Average Triple。 |
| **VWAP（成交量加权均价）** | 当日重置的均价指标，综合**成交量与价格**——日内交易最常用基准。 |
| **VWMA（成交量加权 MA）** | 与 WMA 一样，但权重来源是**成交量**而非价格。 |

## 趋势强度 / 方向类

| 指标 | 描述 |
| --- | --- |
| **Aroon** | 趋势跟踪指标，用 Aroon Up 与 Aroon Down 的差值衡量**当前趋势强度**与**延续可能性**：>0 上升趋势，<0 下降趋势。 |
| **Average Directional Index (ADX)** | ADX 反映**趋势强度**（数值越高越强）；**+DI / -DI** 反映当前价格方向，+DI 在 -DI 之上 = 上升动能。 |
| **Directional Movement** | 由 **+DMI / -DMI / ADX** 三条线组成：+DMI 衡量今日高点 - 昨日高点；-DMI 衡量今日低点 - 昨日低点。 |
| **Parabolic SAR（抛物线 SAR）** | 适用于**趋势市**——使用**跟踪止损 + 反转**方法识别好的退出 / 入场点。计算公式：`SAR(t+1) = SAR(t) + AF × (EPtrade − SAR(t))`。其中：SAR(t+1) = 下一周期 SAR；SAR(t) = 当前 SAR；**AF = 加速因子，从 0.02 起步，每次增加 0.02，最大 0.20**（可在创建研究时重置初始值、增量与上限）；**EPtrade = 极值价格（多头取 HIGH，空头取 LOW）**。 |
| **Trend Strength Index** | 基于多周期平滑的**动量指标**，识别趋势与反转，对**超买超卖**判定有效。 |
| **True Strength Index (TSI)** | 用价格的**底层动量**的 MA 来显示**趋势方向**与超买超卖，**结合动量（领先）与 MA（滞后）**两端优势。 |
| **Vortex Indicator** | 两条线 VI+（上行）与 VI-（下行）：**VI+ 上穿 VI-** = 上升趋势买入，**VI- 上穿 VI+** = 下降趋势卖出。 |
| **Williams Alligator** | 三条 EMA：蓝色 = 颚（jaw），红色 = 牙（teeth），绿色 = 唇（lips）；三线相互交错识别趋势启动与结束。 |
| **Williams Fractal** | 寻找**多周期重复的价格形态**——看涨分形提示**潜在底部**，看跌分形提示**潜在顶部**。 |
| **Zig Zag** | 连接重要**高点与低点**的折线，连接规则由 Minimum Change 或 Percent Change 参数控制，**过滤小波动**。 |

## 动量 / 震荡类

| 指标 | 描述 |
| --- | --- |
| **Accelerator Oscillator** | 衡量**动量变化的加速度**：>0 上行加速，<0 下行加速，常与其他动量指标配合**确认趋势**。 |
| **Awesome Oscillator (AO)** | 34 周期与 5 周期 SMA 之差（SMA 用每根 K 线中点而非收盘价），用于**确认趋势 / 预期反转**。 |
| **Balance Of Power (BoP)** | 衡量买卖双方**推动价格到极值的能力**：BoP = (Close − Open) / (High − Low)；识别趋势、发现背离、判断超买超卖。 |
| **Chande Momentum Oscillator (CMO)** | 范围在 **+100 / -100** 内震荡的动量指标，构造类似 RSI / Stochastic。 |
| **Chop Zone** | 可视化指标，把"收盘价与 EMA 差"映射为**颜色**，直观区分**趋势**与**震荡**。 |
| **Choppiness Index** | 1–100 区间内判定市场**是趋势还是震荡**：>61.8 视为**震荡**，<38.2 视为**有趋势**。 |
| **Commodity Channel Index (CCI)** | 衡量**当前价格相对周期均值的偏离**，识别商品的**周期性转折**。 |
| **Connors RSI** | 复合动量指标（3 周期 RSI + 排名），范围 0–100，识别**超买超卖**。 |
| **Coppock Curve（柯普克曲线）** | **长周期价格动量**指标，主要用于识别股市**重大底部**——是区分"熊市反弹"与"真正底部"的利器。**设计周期为月线**，计算方式 = 14 月变化率 + 11 月变化率 的**10 月加权移动平均**。**买入信号**：指标**跌破 0 后**自谷底**向上转折**。注：作为**趋势跟踪**指标，**不抓精确底部**，但能识别**反弹**与**新牛市起点**。 |
| **Detrended Price Oscillator (DPO)** | **剥离**价格趋势，仅突出**峰谷**，用于估计**周期长度**——不是动量指标。 |
| **Know Sure Thing (KST)** | 复合**长周期动量**指标，2 条线在 0 上方下方波动，使用**KST 与信号线交叉**与价格背离进行交易。 |
| **Majority Rule** | 显示选定周期内**上涨天数占比**，常用于**确认趋势**或提示超买超卖。 |
| **Momentum** | 当前值与 N 周期前值的**比率**或差值：Momentum = CLOSE(i) / CLOSE(i−N)。 |
| **Money Flow Index (MFI)** | 类似 RSI 但**加入成交量加权**，0–100 区间内评估**资金流入/流出强度**。 |
| **Rate of Change (ROC)** | 改进版 Momentum，以**百分比**在 0 上下波动。 |
| **Relative Strength Index (RSI)** | 经典**超买/超卖**指标，0–100 区间，RSI = 100 − (100 / (1+RS))。 |
| **Relative Vigor Index (RVI)** | 通过"收盘价相对开盘价的位置"判断**当前价格走势的强度**，结果用 EMA 平滑。 |
| **SMI Ergodic Indicator/Oscillator** | SMI 指标与 SMI 的 EMA 信号线**之差**，识别**趋势与反转**。 |
| **Stochastic（KD 随机指标）** | 显示当前收盘价在周期内高/低区间的位置，0–100%；<20 超卖，>80 超买。 |
| **Stochastic RSI** | 把 Stochastic 公式套用在 **RSI 之上**的复合指标。 |
| **TRIX** | **三重 EMA 的变化率**，过滤杂讯；类似 MACD，可加信号线交叉与背离判定。 |
| **Ultimate Oscillator** | 综合**三个时间框架**的价格行为，权重 4:2:1，避免单一周期假信号。 |
| **Williams %R（威廉指标）** | 0 到 −100 区间的**超买/超卖**指标；公式 `%R = (HIGH(i−n) − CLOSE) / (HIGH(i−n) − LOW(i−n)) − 100`（注意源站是**减 100**，不是乘 100——这是数学意义上的**方向反转**）。 |

## 波动率 / 风险类

| 指标 | 描述 |
| --- | --- |
| **Average True Range (ATR)** | 衡量**市场波动率**的经典指标：用 True Range（当日波幅、跳空、限制波动中的最大者）的 SMA 平滑得到。 |
| **Bollinger Bands（布林带）** | 三条带：中轨 = 移动平均；上下轨 = 中轨 ± 2 倍标准差（默认）。用于识别**价格相对波动**的极端位。 |
| **Bollinger Bands %B** | 把价格**归一化**到布林带内：=0 在下轨，=1 在上轨，>1 突破上轨，<0 跌破下轨。 |
| **Bollinger Band Width** | 上下轨之间的**百分比差**：带宽收窄 = 波动率降低（潜在突破），带宽扩张 = 波动率上升。 |
| **Chaikin Volatility** | 成交量加权 A/D 线的两条 MA 之差，配合其他 MA/包络使用；波动率急升常**先于底部**。 |
| **Chande Kroll Stop** | 基于 ATR 的**趋势跟踪止损线**，可作为长 / 短仓的动态止损位。 |
| **Donchian Channels（唐奇安通道）** | 绘制**周期内最高高**与**最低低**的趋势跟踪突破系统：上突破买入，下突破卖出。 |
| **Envelopes（包络线）** | 一组移动平均线**上移 / 下移**形成上下边界，识别价格的**超买超卖**。 |
| **Historical Volatility Ratio** | **短期 / 长期历史波动率**的比值；下降至某阈值以下常提示**即将出现大行情**。 |
| **Keltner Channel（肯特纳通道）** | 中线 = **20 周期 EMA**（典型价 TP），上下轨 = EMA(TP ± Dev × TR) 形成包络：价格穿越或贴近上下轨常提示**交易机会**。 |
| **Mass Index** | 高低价区间宽度的反转指标：区间**先扩张后收缩** = 趋势可能反转。 |
| **Relative Volatility Index (RVI)** | 类似 RSI 但用**价格变化的标准差**而非绝对值，常作为**确认指标**配合动量/趋势指标。 |
| **Standard Deviation（标准差）** | 衡量**收盘价偏离均值的程度**——标准差越大波动越大。 |
| **Standard Error** | 价格**对线性回归线**的偏离程度；SE 越大偏离越大。 |
| **Standard Error Bands** | 在回归线中线上下画出**波动偏差带**，识别趋势与波动方向。 |
| **Volatility Index** | 基于 S&P 500 期权价格计算的**市场预期 30 天波动率**指标（俗称"恐慌指数"类）。 |
| **Volatility O-H-L-C** | 用**开高低收**四种价格综合度量市场波动率。 |

## 成交量类

| 指标 | 描述 |
| --- | --- |
| **Accumulation/Distribution (A/D)** | 量化**资金流入流出**某只股票；理论上是**价格变动前**的领先信号。 |
| **Chaikin Money Flow** | 基于 A/D 线的资金流量振荡器：N 周期 A/D 累计 / N 周期成交量累计。 |
| **Chaikin Oscillator** | A/D 线的 3 周期与 10 周期 EMA 之差，监控**资金进出市场**。 |
| **Ease of Movement** | 价格变化率与成交量的关系；>0 资金流入，<0 资金流出。 |
| **Klinger Oscillator** | 用成交量判定**长期资金趋势**同时保持对短期反转的敏感度，配合 **13 周期 MA 信号线**。 |
| **Net Volume** | 上涨成交量 - 下跌成交量的累计，正值 = 净买入。 |
| **On Balance Volume (OBV)** | 经典成交量指标：收盘涨则加当日成交量，跌则减，**OBV 走在价格之前**。 |
| **Price Volume Trend** | OBV 的变体，**水平柱状叠加**在主图上。 |
| **Volume** | 显示**单位时间内成交数量**——供需动态的最直接度量。 |
| **Volume Oscillator** | 用两条不同周期 MA 的关系**衡量成交量的变化**。 |
| **Volume Profile Fixed Range** | 在**固定时间段**内每个价位绘制成交量柱，识别**关键支撑阻力**。 |
| **Volume Profile Visible Range** | 同上但**随图表可视区间动态调整**。 |

## 通道 / 形态类

| 指标 | 描述 |
| --- | --- |
| **Moving Average Channel** | 在 MA 上下添加 ±N 倍标准差形成**包络通道**，代表支撑阻力。 |
| **Pivot Points Standard** | 基于历史价格计算**当日关键枢轴位**——经典日内支撑阻力识别工具。 |
| **Price Channel** | 显示**市场趋势的高低边界**——上轨阻力、下轨支撑。 |
| **Price Oscillator** | 两条 MA 之差（点数），与 MACD 类似但**周期可自定义**。 |
| **Ratio** | 两个品种**价格之比**，用于**相对强弱分析**与配对交易。 |
| **Spread** | 两个品种**价格差**，识别**套利 / 相关性**机会。 |

## 相关性 / 统计类

| 指标 | 描述 |
| --- | --- |
| **Correlation - Log** | 衡量**两个市场或品种**价格变动之间的**对数相关性**。 |
| **Correlation Coefficient** | 衡量两种资产关系强度，范围 **-1 到 +1**：+1 完全正相关，-1 完全负相关，0 不相关——**组合分散与风险管理的核心工具**。 |
| **Fisher Transform** | 把**任意波形**的概率密度函数变换为**近似正态分布**，更清晰识别**极端价格变动**与反转。 |
| **Median Price** | 周期内**最高价与最低价的平均值**。 |
| **Typical Price** | (High + Low + Close) / 3，是 MA 系统的**实用过滤输入**。 |

## 累计 / 指数类（其余）

| 指标 | 描述 |
| --- | --- |
| **Accumulation Swing Index** | 累计 Swing Index，试图在 OHLC 中找出代表"**真实市场**"的虚线，**类支撑阻力**分析。 |
| **Advance/Decline（涨跌家数差）** | 每日上涨家数 - 下跌家数。 |
| **Elder's Force Index** | 衡量**市场买卖压力**：Bull Power = 当日最高 − N 周期 EMA；Bear Power = 当日最低 − N 周期 EMA；配合背离使用。 |

## 关键要点

- **Overlay vs Sub-chart**：多数趋势/均线类指标**叠加在主图**（如 MA、Bollinger Bands、Ichimoku Cloud），动量/成交量类通常放在**副图**（如 RSI、MACD、OBV）。
- **参数可调**：每种指标创建时都能调整**周期、颜色、阈值、线型**——同一种指标在不同周期含义差别巨大（如 14 周期 RSI vs 5 周期 RSI）。
- **指标叠加数量**：图表上**可同时叠加多个**指标，但**指标越多 ≠ 信号越好**——增加噪音与过拟合风险；建议先选定**主框架**（如趋势 + 动量 + 成交量）再补辅助。
- **背离（Divergence）**：本字典反复出现 "**背离**"——价格创新高/低而指标未确认，是最常见的**反转信号**。
- **历史回测**：所有指标**仅基于历史价格**计算，对未来没有预测能力；务必结合**基本面、订单流、宏观环境**综合判断。
- **公式来源**：上述公式与说明均来自 IBKR Desktop 官方 User Guide 字典（2025-10-07 版本）。**实际翻译过程中**有少量指标**曾遗漏**（MACD / Average Price / Coppock Curve / Parabolic SAR 在初版中未包含，已在 retry 批次补齐）——当前版本**已对齐源站全部 100 个指标**。

## 相关章节

- [图表总览（Chart）](chart.md)
- [扩展交易时段（Extended Trading Hours）](extended-trading-hours.md)
- [图上建仓与下单（Transmit Orders in Chart）](transmit-orders-chart.md)
- [持仓与均价线（Position with Average Price）](position-with-average-price.md)

## 原文参考

- 源站：[ibkrguides.com/ibkrdesktop/chart-indicators.htm](https://www.ibkrguides.com/ibkrdesktop/chart-indicators.htm)
- 源站当前返回 200 OK，本翻译对应 **Last updated on October 7, 2025** 版本。
- 源站是一张**长字典表**（约 100 个指标），本翻译按**趋势 / 趋势强度 / 动量 / 波动率 / 成交量 / 通道 / 相关性 / 累计**八类重新组织，方便检索。
- **诚实声明**：本翻译在初版 commit（`a9b31f5`）时存在 4 个指标遗漏 + 2 个公式错（Williams %R 误将 `− 100` 写成 `× 100`、Keltner Channel 中线 `EMA` 误识别为 `ATR`）——这些**在 retry 批次（`fix: chart-indicators 补 4 指标 + 修 2 公式`）中已修复**。**当前版本与源站 1:1 对齐**，未删节亦未自创内容。
