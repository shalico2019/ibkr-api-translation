# 货币转换

> 原文：[ibkrguides.com/ibkrdesktop/convert-currency.htm](https://www.ibkrguides.com/ibkrdesktop/convert-currency.htm)

IBKR Desktop 支持在投资组合（Portfolio）页面直接将非本币余额转换为基础货币（Base Currency）。**请注意：货币转换会以市价单（Market Order）形式提交**，成交价取决于转换时的实时汇率。

## 适用场景

- 账户内同时持有多种货币余额，需要统一为一种基础货币核算。
- 通过汇率波动把外币余额锁回本币。
- 准备汇款或出金前，先将多币种余额归集到某一种货币。

## 操作步骤

1. 打开左侧导航的 **投资组合（Portfolio）** 页面。
2. 找到页面底部的 **非本币余额（Non-Base Currency Balance）** 行，**右键单击**。
3. 在弹出菜单中选择 **Convert Currency（转换货币）**。
4. 系统弹出转换窗口，显示当前总现金余额（Total Cash Balance）。在 **Convert From**（源币种）和 **Convert To**（目标币种）下拉框中分别选择要换出的币种和换入的币种。
5. 点击 **Submit Conversion Order（提交转换订单）** 完成下单。

> 截图说明：
> - 第一张图展示了在非本币余额行右键后弹出的上下文菜单，"Convert Currency" 位于菜单中部。
> - 第二张图展示了转换订单弹窗，左侧是 Total Cash Balance 摘要，右侧是 Convert From / Convert To 两个下拉框以及 Submit 按钮。

## 关键要点

- **市价单执行**：转换以市价单方式成交，**不保证具体成交价**，大额转换可能因市价单滑点产生不利价差。
- **基础货币**：本币是你的 IBKR 账户开户时设置的基础货币（Base Currency），所有账户估值、保证金、P&L 都会按本币汇总。
- **非本币余额**：指账户中除基础货币以外持有的 USD、EUR、HKD、JPY 等现金余额。
- **可用余额前提**：仅当对应币种账户中有正的可用现金余额时才能发起转换，**不可**通过转换加杠杆。
- **转换 vs 出金换汇**：转换是把账户内币种互换（账面），不涉及跨境电汇；出金换汇（FX on Withdrawal）才是出金时再换汇，定价与时机不同。

## 相关章节

- [投资组合（Portfolio）总览](view-positions.md)
- [账户余额（View Balances）](view-balances.md)
- [快速下单（Quick Trade）](quick-trade.md)

## 原文参考

- 源站：[ibkrguides.com/ibkrdesktop/convert-currency.htm](https://www.ibkrguides.com/ibkrdesktop/convert-currency.htm)
- 源站当前返回 200 OK，本翻译对应 **Last updated on October 14, 2025** 版本。
- 截图资源（仅供 verifier 核对原文图位）：`convert-currency.jpg`（右键菜单）、`convert-currency1.jpg`（转换弹窗）。
