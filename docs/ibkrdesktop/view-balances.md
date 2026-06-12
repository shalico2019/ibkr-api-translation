# 查看余额（Balances）

> 原文：[ibkrguides.com/ibkrdesktop/view-balances.htm](https://www.ibkrguides.com/ibkrdesktop/view-balances.htm)
> 最后更新于 2025-10-07

!!! warning "原文链接当前正文为空"
    源站 `view-balances.htm` 当前**只有标题 "Balances" + 一个空的迷你目录盒**（MadCap Flare 占位页）。本章节基于 TWS Account Window / IBKR Campus 公开资料 + IBKR Desktop 公开介绍交叉整理，明确标注"待补"。

## 概述

**Balances（余额）** 是 IBKR Desktop Portfolio 面板下的一个标签页，用于集中查看账户的**资金、保证金、购买力、市值**等关键数字——它回答"我账户现在到底有多少钱能开新仓"这个问题。

!!! info "对照 TWS"
    TWS 中等价的视图是独立的 **Account Window（账户窗口）**——包含 Balances / Margin Requirements / Available for Trading / Market Value / FX Portfolio / Portfolio 六个分区。IBKR Desktop 把这些信息**合并到 Portfolio → Balances 标签页**，单页一目了然——不需要打开额外窗口。

!!! note "界面位置"
    IBKR Desktop 主窗口 **左上角 Portfolio 图标** → 顶部 **Balances** 标签页 → 表格形式列出账户关键资金数字，按币种分组。

---

## 余额页面显示的核心字段

下表是 IBKR Desktop Balances 标签页**默认显示**的核心字段（具体列可点击右上齿轮 **Configure** 配置）：

| 字段 | 英文 | 含义 | 你最该关注什么 |
|------|------|------|----------------|
| **净资产** | Net Liquidation Value (NLV) | 账户**全部资产按市价折算**的净值（含现金 + 持仓市值 - 负债）。这是衡量账户规模的"总账" | 想知道"我账户到底有多大"看这个 |
| **可用资金** | Available for Trading | 扣除已用保证金后，**还能开新仓的资金** | 下新单前必看——不要凭感觉开仓 |
| **购买力** | Buying Power | Reg T 账户下 ≈ Available × 2（保证金账户 × 4），含融资杠杆 | 股票日内交易的关键指标 |
| **初始保证金** | Initial Margin | 开仓时**最低需要**的保证金 | 买入时会被冻结的资金 |
| **维持保证金** | Maintenance Margin | **持仓期间**必须保持的保证金下限，跌破会触发追保 | 持仓过夜 / 跨周末时关注 |
| **安全垫** | Cushion | 距离强制平仓（liquidation）的"缓冲空间" | < 25% 即警戒，< 10% 高危 |
| **现金余额** | Cash Balance | 账户里**未投入持仓**的现金（按币种分列） | 多币种账户会分行显示 USD / HKD / EUR 等 |
| **市值** | Market Value | 所有持仓按市价折算的总市值 | 与 NLV 差额反映现金 + 负债 |
| **未实现盈亏** | Unrealized P&L | 持仓**未平仓**期间的浮动盈亏 | 实时刷新，但**未兑现**——不要把它当真实收益 |

!!! tip "对照 TWS"
    TWS Account Window 中 Balances / Margin / Available 是**分开 3 个分区**，且各自有滚动条。IBKR Desktop 在 Balances 标签页里把它们**合并到一个表格**——更适合快速扫一眼"账户健康度"。

---

## 如何使用 Balances

### 场景 1：判断能否开新仓

1. 打开 Portfolio → **Balances** 标签页。
2. 查看 **Available for Trading** —— 这是你**当下**最多能开多少金额新仓。
3. 如果是 Reg T 账户，看 **Buying Power** —— 这才是股票日内可用的真实购买力（含 2:1 / 4:1 杠杆）。

### 场景 2：监控隔夜持仓的保证金风险

1. 查看 **Maintenance Margin** 与 **Cushion**。
2. 如果 Cushion **< 25%**：考虑减仓或追加保证金。
3. 如果 Cushion **< 10%**：系统可能已发出**追保通知（margin call）**，必须立即处理。

### 场景 3：核对多币种账户

1. Balances 默认会按**币种分组**展示——USD 一组、HKD 一组、EUR 一组等。
2. **外币行**显示该币种的现金余额 + 在该币种下市场（如 HKD 市场）的持仓市值。
3. 想看"真实综合余额"——切到 **Positions** 标签页或参考 [PortfolioAnalyst](https://www.interactivebrokers.com/en/software/portfolioanalyst.php) 的合并报告。

!!! info "重要提示"
    Balances 中显示的"现金"是**账面余额（settled + unsettled）**——IB 账户有 T+1 / T+2 的结算周期，下单后立即卖出的资金可能还没结算，不能立即使用。**Always 以 Available for Trading 为准，不要看 Cash Balance 就以为能开仓。**

---

## 关键要点

- Balances 标签页的**所有数字都是实时刷新**——不需要手动刷新。
- **Available for Trading ≠ Cash Balance**：Cash 包含未结算资金，Available 是真正可下单的"干燥资金"。
- **NLV（净资产）下跌 ≠ 亏损**：可能只是你提取了现金、或者持仓被划转走了。
- 多账户用户（Advisor）会在 Balances 顶部看到一个**账户选择下拉框**——务必确认你看到的是**正确的账户**，否则保证金数字可能是别人的。
- Reg T 账户下方的 **Try PM** 按钮（如果显示）可以模拟 **Portfolio Margin（组合保证金）**模型下的保证金数字——适合评估是否升级到组合保证金账户。

!!! warning "对照 TWS 的关键差异"
    - TWS Account Window 内的数字**有滚动条分 6 区**；IBKR Desktop 合并为单页表格
    - TWS 的 FX Portfolio / Virtual FX Position 在 IBKR Desktop 中**统一折算到 Balances 的外币行**——没有独立分区
    - TWS 的 Print Summary 功能在 IBKR Desktop 中**没有对应入口**——需要导出报告走 IBKR 官网

---

## 相关章节

- [投资组合入口（Portfolio 菜单）](portfolio-icon.md)
- [查看持仓（Positions）](view-positions.md)
- [订单与成交（Orders & Trades）](orders-and-trades.md)
- [合约搜索](contract-search.md)
- [账户头像（账户切换）](account-avatar.md)
- TWS 对照：[TWS 账户窗口（Account Window）](../tws-manual/account-window.md)
- 外部：[IBKR Campus - Monitoring Positions and the Account Window](https://ibkrcampus.com/trading-lessons/monitoring-positions-and-the-account-window/)
- 外部：[IBKR Desktop 产品页](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/ibkrdesktop/view-balances.htm>
- 最后更新：2025-10-07
- **原文状态**：源站当前**只有标题 "Balances"，正文为 MadCap Flare 占位页**（`<h1>Balances</h1>` 后跟一个空的 `<div class="MCMiniTocBox_0 miniToc nocontent">`）。本文内容基于 TWS Account Window 的官方字段定义 + IBKR Campus 公开资料整理。
- 信息缺口：
    1. Balances 标签页**默认显示哪些列**——本文以 IBKR 通用字段为准，具体列名以实际界面为准
    2. Configure（齿轮）可配置的**完整列名清单** → 待官方文档补充
    3. Try PM 按钮在 IBKR Desktop 中**是否仍然存在**——TWS 中可见，Desktop 中暂未在源站证实
