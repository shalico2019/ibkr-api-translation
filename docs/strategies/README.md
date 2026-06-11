# 实战策略

> 基于 `ib_insync` 的可运行量化策略示例。每个文件都包含**完整可执行的 Python 代码** + 详细中文说明 + 风险提示 + 改进方向。

## 目录

- [均线交叉策略](ma-crossover.md) —— 5/20 日均线金叉死叉，最经典的趋势跟踪入门
- [突破策略](breakout.md) —— Donchian 通道 + ATR 止损，海龟交易法则的简化版
- [网格交易](grid.md) —— 区间内等间距挂单，赚震荡市的钱

## 适用场景速查

| 策略 | 核心思想 | 最适合行情 | 最不适合 | 调参难度 | 手续费敏感度 |
|------|---------|-----------|---------|---------|------------|
| [均线交叉](ma-crossover.md) | 快慢均线交叉判断趋势 | 强趋势、流动性好的大盘股 | 长时间震荡、单边反转 | ⭐ | 中 |
| [突破策略](breakout.md) | 价格突破 N 日高/低入场 | 波动率扩张、趋势启动初期 | 长时间窄幅震荡 | ⭐⭐ | 中 |
| [网格交易](grid.md) | 区间内反复挂单赚差价 | 区间震荡、商品/币圈 7×24 品种 | 强单边（爆仓风险） | ⭐⭐⭐ | **高** |

## 选哪个？

- **新手入门 / 想理解趋势跟踪** → [均线交叉](ma-crossover.md)
- **想抓大波段、可以承受较大回撤** → [突破策略](breakout.md)
- **判断当前是震荡市、资金量小、想频繁交易** → [网格交易](grid.md)
- **生产环境部署** → 不要直接用以上示例，至少加上：手续费模型、风险预算、监控告警、日志持久化

## 使用前的统一准备

1. 安装依赖：
   ```bash
   pip install ib_insync pandas
   ```
   `ib_insync` 是 [erdewit/ib_insync](https://github.com/erdewit/ib_insync)，是 [TWS API](../tws-api/introduction.md) 的 Pythonic 异步封装。

2. 启动 [TWS 或 IB Gateway](../tws-api/tws_settings.md)，开启 API 连接（默认端口 7497 模拟 / 7496 实盘）。

3. **强烈建议先用 Paper Account 跑至少 1 个月**，再用真实账户。

4. 三个示例代码都是**同步可读**风格，**没有**用 `asyncio` 直接驱动 ib_insync——这会让初学者更容易理解。生产版本可改为 `ib.run()` 事件循环。

## 与本项目其它文档的关系

- 想理解 TWS API 的底层：看 [TWS API 目录](../tws-api/README.md)
- 想理解 IB Gateway / TWS 配置：看 [TWS 设置](../tws-api/tws_settings.md)
- 想理解订单类型：看 [订单类型详解](../tws-api/order_types.md)
- 想理解历史 K 线：看 [历史数据](../tws-api/historical_data.md)

策略只是把上面这些原子能力**组合起来**形成交易逻辑。
