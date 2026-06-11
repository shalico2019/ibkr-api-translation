# 逐笔成交 Time & Sales

> 原文：[ibkrguides.com/traderworkstation/time-and-sales.htm](https://www.ibkrguides.com/traderworkstation/time-and-sales.htm)
> 最后更新于 2025-10-08

## 概述

逐笔成交（Time & Sales）窗口用于查看市场上已经达成的成交记录。默认显示的列包括：成交时间、成交价（Last）、成交量（Size）、交易所（Exchange）和成交条件（Condition），你可以切换查看任意标的（underlying）的逐笔成交数据。

## 窗口状态说明

窗口中可能出现的两种视觉状态：

- **浅灰色背景**：表示**实时数据流**（Live Stream）模式——成交数据随着市场推送实时滚动。
- **深灰色背景**：表示你已经翻页（Page backwards）回到**历史静态数据**——此时数据定格在某个历史时点。

窗口顶部有 **Search（搜索）** 按钮，可以按特定日期/时间定位、按价格区间过滤成交条目，或者从图表上选择目标时点。

## 使用方法

### 1. 打开逐笔成交窗口

- **Mosaic 界面**：点击右上角 **New Window** 下拉菜单，选择 **Time & Sales**。
- **经典 TWS（Classic TWS）**：从顶部菜单栏的 **Analytical Tools** 菜单中选择 **Time & Sales**。

切换查看的标的：直接在窗口的代码输入框中输入新代码，或者让窗口**跟随组（grouped）当前自选列表中选中**的代码。

### 2. 右键菜单与字段配置

在任意列标题上**右键单击**，会弹出完整的命令列表，其中常用项包括：

- **NBBO entries**：配置要显示的最优买卖价（NBBO）相关字段。
- **Block filter（大单过滤）**：选择是否隐藏/显示大单，并自定义判定"大单"的最低手数。

### 3. 上标数字与"+"号

成交价旁边若出现**上标数字**，表示这是经过多笔报价**聚合**后的价格，且系统给出了更高的精度（extra precision）。

若价格前出现 **"+"** 号，则表示该刻度（tick）是对一段时间窗口内多笔 tick 的**聚合结果**——系统在市场活跃时启用该聚合以减少噪声。鼠标悬停在 "+" 上，可以查看被聚合的 tick 总数。

## 从图表选择时点

1. 在逐笔成交窗口的 **Search** 菜单中选择 **Select from chart**。当前标的的图表会打开，光标进入"Time and Sales"模式。
2. 在图表上**点击**你希望定位的日期/时间点。
3. 逐笔成交窗口会自动跳转到对应时点的成交记录。

## 查看成交条件

1. 鼠标悬停在 **Last（成交价）** 或 **Size（成交量）** 上，会弹出**当前成交条件**的说明（条件可用时显示）。点击 **More Information** 可查看条件代码（condition codes）的完整释义。
2. 此外，你也可以把 **Exchange（交易所）** 和 **Conditions（成交条件）** 两列添加到逐笔成交窗口中，让成交条件**作为独立列**直接显示。

## 配置逐笔成交窗口

1. 在逐笔成交窗口**右上角**点击 **Configure Wheel（配置齿轮）** 按钮。
2. 在弹出的设置窗口中可以**添加或移除**需要显示的列。

## 关键要点

- 逐笔成交窗口是回看**已成交交易**的工具，而**不是**下单工具——研究盘口微观结构、判断大资金动向时才用它。
- 实时流 vs. 历史静态的区别来自背景色，看到深灰就知道数据不会动了。
- **上标**和 **"+" 号**是 IBKR 聚合后的提示，在市场快速波动时尤为常见，不要误以为是显示错误。
- 成交条件字段（Conditions）默认可能不显示，**主动加列**才能看到完整的交易条件。

## 相关章节

- [滚动行情条 Ticker Tape](./ticker-tape.md)
- [市场数据 Market Data](./market-data.md)
- [图表基础 Charts](./charts.md)
- [订单类型 Order Types](./order-types.md)
- [基础配置 Configuration](./configuration.md)

## 原文参考

- [Time & Sales — ibkrguides.com](https://www.ibkrguides.com/traderworkstation/time-and-sales.htm)
