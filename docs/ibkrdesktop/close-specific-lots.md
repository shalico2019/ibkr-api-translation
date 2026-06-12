# 关闭指定批次（Tax Lot）

> 原文：[ibkrguides.com/ibkrdesktop/close-specific-lots.htm](https://www.ibkrguides.com/ibkrdesktop/close-specific-lots.htm)

IBKR Desktop 提供 **Close Specific Lots（关闭指定批次）** 工具，让交易员可以在 **View Lots（查看批次）** 窗口里**多选**任意税务批次（Tax Lot）一次性平仓。对于做税务成本优化（Tax-Lot Optimization）、分批止盈止损、或者多策略分仓管理时**只想平掉部分批次**而保留其他批次的场景，这一功能尤为关键。

## 适用场景

- **税务优化**：选择**高成本**批次优先平仓，**降低当年应税收益**；或反过来用**低成本**批次平仓做止盈。
- **分批止盈**：同一品种多批次建仓后，希望分批平仓而非一次性清仓。
- **配对交易 / 套利**：精准控制每个 legs 的批次组合。

## 关键概念

- **Tax Lot（税务批次 / 成本批次）**：每一笔**建仓成交**都会产生一个独立批次，IBKR 会记录该批次的建仓价（Cost Basis）、建仓时间与数量。平仓时**指定批次**可以精准匹配**哪些批次**被卖出、剩余批次继续持仓。
- **FIFO / LIFO 默认行为**：若不指定批次，IBKR 默认按"先进先出 / 后进先出"等账户设置决定卖出哪些批次；**Close Specific Lots** 用来**覆盖**这一默认行为。

## 操作步骤

1. 在投资组合（Portfolio）中**右键单击**要平仓的**持仓行**。
2. 在弹出菜单中选择 **View Lots（查看批次）**。  
   > 截图：右键菜单中部出现 "View Lots" 选项。
3. 在 View Lots 窗口顶部点击 **Close Specific Lots（关闭指定批次）** 按钮进入多选模式。  
   > 截图：标题栏右侧多出 "Close Specific Lots" 按钮。
4. 屏幕上会弹出 **条款与条件（Terms and Conditions）**，阅读后点击 **Agree（同意）**。  
   > 截图：居中模态框显示 "Terms and Conditions"，底部 Agree / Cancel 按钮。
5. 在批次列表中，**勾选（check box）** 左侧复选框选择要平仓的批次（可多选）。
6. 点击 **Create Order（创建订单）**。  
   > 截图：选中若干批次后，列表上方出现 Create Order 按钮。
7. 系统把所选批次的合计数量与加权平均成本装入左侧 **Order Entry Panel（订单输入面板）**。  
   > 截图：订单面板显示已选批次的合计数量与建议价格。
8. 根据需要修改订单参数（订单类型、价格、限价/止损价等），然后：
   - 点击 **Submit Sell Order（提交卖单）** 直接发送；
   - 或点击 **Preview（预览）** 先查看订单摘要再决定是否提交。

## 关键要点

- **多选支持**：可一次性勾选**多个不连续**批次，订单数量是所选批次数量的**加总**。
- **首次使用需同意条款**：仅首次使用 Close Specific Lots 时弹出条款，后续不会再弹。
- **订单方向**：对于多头持仓，平仓为**卖单（Sell Order）**；做空方向的平仓逻辑对称，但需在选批次前先在投资组合中确认持仓方向。
- **加权利 vs 加权价**：订单面板里的"成本基础"是所选批次的**加权平均成本**，不是 FIFO 推算的默认基础。
- **修改限制**：未提交前可在 Order Entry Panel 调整价格/订单类型；提交后**修改订单**会作为新订单走修改流程。
- **仅平不反向开仓**：此功能**只**用于平仓，不会自动开反向仓位。

## 相关章节

- [投资组合（View Positions）](view-positions.md)
- [下单与成交（Orders and Trades）](orders-and-trades.md)
- [退出策略（Exit Strategy）](exit-strategy.md)

## 原文参考

- 源站：[ibkrguides.com/ibkrdesktop/close-specific-lots.htm](https://www.ibkrguides.com/ibkrdesktop/close-specific-lots.htm)
- 源站当前返回 200 OK，本翻译对应 **Last updated on October 14, 2025** 版本。
- 截图资源（仅供 verifier 核对原文图位）：`close-specific-lots.jpg`（右键菜单）、`close-specific-lots1.jpg`（多选按钮）、`close-specific-lots2.jpg`（条款弹窗）、`close-specific-lots3.jpg`（勾选批次）、`close-specific-lots4.jpg`（订单面板）。
