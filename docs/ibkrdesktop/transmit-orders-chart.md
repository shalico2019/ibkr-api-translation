# 图表内建仓与下单（Transmit Orders in Chart）

> 原文：[ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm](https://www.ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm)

IBKR Desktop 的 **Chart（图表面板）** 内置**图上下单**功能：交易员**无需离开图表**即可在某个价格点位直接挂出买入 / 卖出订单，特别适合**剥头皮 / 抢反弹 / 突破追单**等依赖价格行为的策略。

## 适用场景

- 看到关键支撑 / 阻力位想**立即挂单**而非切到独立订单面板。
- 在趋势线、通道线、指标触发点附近**快速止损 / 止盈**。
- 配合图上**持仓（Position）**显示，做**加减仓**与**反向开仓**的快速反应。

## 操作步骤

1. 点击 IBKR Desktop 左上角侧边栏的 **Quote（行情）菜单**图标 ![Quote 菜单图标（The quote menu icon）](resources/images/quote-icon.png "Quote Menu Icon")。
2. 在左上角的 **Portfolio 下拉菜单**里选择要展示的产品来源：**Watchlist（自选股） / Portfolio（投资组合） / Screener（选股器）**。

    !!! note "界面位置"
        左上角下拉，三选一：Watchlist / Portfolio / Screener。

        ![Portfolio 下拉菜单（The portfolio drop-down menu）](resources/images/charts-dropdown.png "Portfolio Drop-Down Menu")

3. 从列表中**选中一个合约**，图表自动加载该品种 K 线。
4. 图表在**页面中部**渲染（默认带主图 + 副图结构）。

    !!! note "界面位置"
        主图 + 副图结构，K 线默认在页面中部，右侧留出 Order Ticket 区域。

        ![图表渲染（IBKR Desktop chart）](resources/images/charts.png "Chart")

5. **将鼠标悬停在 Y 轴附近某个价格点**，会出现一个 **"+"** 浮动按钮，**点击 "+"** 在该价位上挂出订单入口。
6. 在弹出的方向菜单里选择 **Buy（买入）** 或 **Sell（卖出）**。

    !!! note "界面位置"
        鼠标悬停 Y 轴附近 → 弹出 "+" → 点击 → 在该价位弹出 Buy / Sell 方向菜单。

        ![图内 Buy/Sell 方向选择（Creating a buy or sell order within the chart.）](resources/images/charts1.png "Create Buy or Sell Within Chart")

7. 系统会**预填订单参数**（价格 = 选中的价格点，方向 = Buy/Sell），可以在右侧 **Order Ticket** 中继续修改。
8. 点击 **Submit Buy Order / Submit Sell Order（提交订单）** 完成下单。

    !!! note "界面位置"
        右侧 Order Ticket 已预填价格 / 方向 / 数量等参数，底部有 Submit 按钮。

        ![Order Ticket 已预填（The order ticket buy or sell）](resources/images/charts2.png "Order Ticket Buy or Sell")

9. **拖拽改价**：要修改已挂订单的价格，**点击图表上的买/卖小方块**（即订单标记），**上下拖动**水平价格线到新位置后释放，新的价格即生效。
   - **未提交订单**：拖拽改价后仍需点击 Submit。
   - **已挂出（working）订单**：拖拽改价**直接覆盖原订单**——**没有 Order Preview 步骤**，**不会弹出确认框**，新价格**立即发送到交易所**。

## 关键要点

- **价格点位下单**：图上下单的默认价格 = hover 到的 Y 轴价格点；不需要手输价格，**反应更快**也**减少误输**。
- **预填参数**：订单方向、数量等参数继承自账户/合约默认值，**务必在 Submit 前检查**。
- **拖拽改价 = 直接覆盖**：这是**最容易踩坑**的功能——拖动 working 订单的价位**不会弹任何确认**，**会立即改单并发送**。
  - 建议：**鼠标拖动**前确认当前是 buy 还是 sell 框；
  - 建议：**首次使用**可以先在模拟账户（Paper Account）练习。
- **不支持复杂订单**：图上下单入口默认生成**单一订单**（限价单 / 市价单）；括号（Bracket）、OCO、附加（Attached）等复杂订单需要回到 Order Entry Panel 完整面板创建。
- **品种过滤**：通过 Portfolio 下拉切换数据源，可以快速在自选股、持仓、选股器之间切换。
- **风险提示**：剥头皮 / 抢单等依赖图上下单的场景，**网络延迟与市价单滑点**会显著影响成交价，建议先在模拟账户验证策略。

## 相关章节

- [图表总览（Chart）](chart.md)
- [图表技术指标（Chart Indicators）](chart-indicators.md)
- [扩展交易时段（Extended Trading Hours）](extended-trading-hours.md)
- [持仓与均价线（Position with Average Price）](position-with-average-price.md)
- [下单与成交（Orders and Trades）](orders-and-trades.md)

## 原文参考

- 源站：[ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm](https://www.ibkrguides.com/ibkrdesktop/transmit-orders-chart.htm)
- 源站当前返回 200 OK，本翻译对应 **Last updated on October 7, 2025** 版本。
- **截图已全部嵌入**：5 张源站截图均已下载并 1:1 嵌入译稿操作步骤下方，与源站 HTML 中 `<img>` 位置一一对应：

    | 文件 | 嵌入位置 | sha256（前 8 位） | bytes |
    |------|----------|-------------------|-------|
    | `quote-icon.png` | 步骤 1（Quote 菜单图标，行内） | `500cc3bc` | 1498 |
    | `charts-dropdown.png` | 步骤 2（Portfolio 下拉菜单） | `35761b5d` | 14958 |
    | `charts.png` | 步骤 4（图表渲染） | `fc87e3d1` | 270130 |
    | `charts1.png` | 步骤 6（Y 轴 + 号 + Buy/Sell 菜单） | `0bde677c` | 280644 |
    | `charts2.png` | 步骤 8（Order Ticket 已预填） | `997cbd96` | 217045 |
