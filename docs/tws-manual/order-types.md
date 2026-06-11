# 订单类型（Order Types）

> 原文：[ibkrguides.com/traderworkstation/order-types.htm](https://www.ibkrguides.com/traderworkstation/order-types.htm)
> 最后更新于 2025-10-08

## 概述

TWS 提供 **90 多种订单类型**，覆盖基础单、进阶单、**算法单（algos）**、**订单属性（attributes）**和**时效（times in force）**。本章是 TWS 订单类型的**总目录**，每个类型给一句话定义 + 详细说明链接。

!!! warning "订单的根本限制"
    任何订单**只可能在"保证成交"和"保证价格"中二选一**。极端行情下，市价单可能按你**不想要**的价格成交；限价单可能**完全无法成交**。这是所有订单类型的共同前提，不是某一种订单的缺陷。

---

## 选择订单类型

按你使用的 TWS 界面不同，操作略有差异：

=== "Mosaic"

    1. 在**订单输入面板（Order Entry Panel）**顶部
    2. 点击 **Order Type** 下拉菜单
    3. 选择订单类型，填入相应参数

=== "Classic TWS（经典版）"

    1. 点击左上角 **Order Ticket** 按钮
    2. 点击 **Order Type** 下拉菜单
    3. 选择订单类型，填入相应参数

!!! note "界面位置"
    Mosaic 顶部"Order Entry"面板最上方第一行就是 "Order Type" 下拉框；Classic TWS 在左上角 "Order Ticket" 弹出窗内最上方。

---

## 基础订单类型（Basic Order Types）

最常用的订单类型，每个交易者都该熟悉：

- **Limit（限价单）** —— 最基础的订单之一，按指定价格或更优价格买入/卖出合约。详见 [Limit Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=limitModal)。
- **MidPrice（中间价单）** —— 尝试按当前 NBBO 中间价或更优价格成交。可设置可选的**价格上限（price cap）**，限定买入方愿意接受的最高价 / 卖出方愿意接受的最低价。详见 [MidPrice Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=midPriceModal)。
- **Market（市价单）** —— 按当前市场上 bid 或 offer 价成交。**没有任何价格保证**。详见 [Market Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=marketModal)。
- **Market-to-Limit（市价转限价）** —— 先以市价单发出，若无法立即全部成交，剩余部分自动转限价单，限价 = 已成交部分的市价。详见 [Market to Limit Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=markettoLimitModal)。
- **Stop（止损单）** —— 当用户指定的**触发价（stop trigger price）**被触及后，提交一个买入或卖出的市价单。卖出止损单**总是挂在市价下方**（常用于多头止损/锁利）；买入止损单**总是挂在市价上方**（常用于空头止损/锁利）。详见 [Stop Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=stopModal)。
- **Stop Limit（止损限价单）** —— 触发价被触及后，提交一个**限价单**而非市价单。需要设置两个价格：触发价 + 限价。详见 [Stop Limit Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=stopModal)。

    !!! tip "限价自动跟随触发价"
        启用"自动调整限价"功能后，修改触发价时系统会按**原始触发价-限价的偏移量**自动调整限价。打开方式：菜单 **Edit → Global Configuration → 左侧 Order** → 勾选 **Auto-adjust limit price for STP LMT and LIT orders**。

- **Trail（追踪止损单）** —— 追踪止损单，仅在 Pro 平台、**美股和部分非美产品**上可用。Mosaic、Classic TWS 和手机端均可使用。详见 [Trail Stop Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=trailingModal)。
- **Trail Limit（追踪止损限价单）** —— 追踪止损 + 限价组合，触发后按限价单方式提交。详见 [Trail Limit Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=trailingLimitModal)。
- **Relative（相对单）** —— 进阶订单，价格由**最优 bid/ask** + 用户指定的**偏移量（offset）**动态推导。以限价单方式提交，提交后会按定价逻辑持续调整。可设价格上限。详见 [Relative/Pegged-to-Primary Orders](https://www.interactivebrokers.com/en/trading/orders/pegged-to-primary.php)。
- **Retail Price Improvement（零售价改善单，RPI）** —— 类似 Relative 单，但要求偏移量 > 0（可填**亚分位**）。RPI 单被路由到 NYSE 的独立簿册，与符合资格的订单撮合。详见 [RPI Orders](https://www.interactivebrokers.com/en/trading/orders/rpi.php)。
- **PEG Best（挂单最优价）** —— 给你的 IBKR ATS 一个**优待**：卖出挂单**比最优 bid 高 1 tick**，买入挂单**比最优 ask 低 1 tick**，提高与对手方撮合的速度。详见 [IBKR ATS Pegged-to-Best](https://www.interactivebrokers.com/en/trading/orders/ibkrats-pegbest.php)。
- **Market-On-Close（收盘市价单，MOC）** —— 尽可能在收盘价附近成交。详见 [Market-on-Close Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=marketCloseModal)。
- **Limit-On-Close（收盘限价单，LOC）** —— 当收盘价**等于或优于**你提交的限价时按收盘价成交，否则**取消**。详见 [Limit-on-Close Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=limitCloseModal)。
- **Adaptive（自适应算法）** —— 可与限价/市价单配合的算法。尝试在**买卖价差内**成交市场和进取型限价单，争取比普通限价/市价单更好的平均成本。算法窗口中可通过"**priority/urgency**"选择器调节紧迫度。详见 [Adaptive Algo](https://www.interactivebrokers.com/en/index.php?f=19091)。
- **IB Algo** —— 一类统称算法，用于实现**最优交易策略**——在**市场冲击（market impact）**和**风险**之间取得平衡，让大单获得**最佳执行（best execution）**。
- **Limit if Touched（触及限价单，LIT）** —— 触及触发价后转为限价单。详见 [Limit if Touched Orders](https://www.interactivebrokers.com/en/trading/orders/lit.php)。
- **Market if Touched（触及市价单，MIT）** —— 触及触发价后转为市价单。详见 [Market if Touched Orders](https://www.interactivebrokers.com/en/trading/orders/mit.php)。
- **MidPrice Orders（中间价单）** —— 同上面的 MidPrice，详见 [MidPrice Orders](https://www.interactivebrokers.com/en/trading/orders/midprice.php)。

---

## 进阶订单类型（Advanced Order Types）

组合多个订单，或为特定场景设计：

- **Auto Trailing Stop（自动追踪止损）** —— 限价单 + 追踪止损单的组合。初始止损价设在市价下方固定距离，订单成交后追踪止损**自动激活**。详见 [Auto Trailing Stop](https://www.interactivebrokers.com/en/trading/orders/trailing-stops.php)。
- **Basket（篮子）** —— 用 TWS BasketTrader 一次性管理一篮子证券或其他资产。组合经理可把代码清单导入 TWS 或直接在 TWS 页面里添加并保存。详见 [BasketTrader](https://www.ibkrguides.com/traderworkstation/baskettrader.htm)。
- **Bracket（括号单）** —— 用两个反向单"夹"住一个主单。**买**主单被一个**高卖限价单 + 低卖止损单**夹住；**卖**主单被一个**高买止损单 + 低买限价单**夹住。详见 [Bracket Orders](https://www.interactivebrokers.com/en/trading/orders/bracket.php)。
- **Box Top** —— 市价单发出后，若不能立即全部成交，剩余部分**自动转限价单**（限价 = 已成交部分的市价）。详见 [Box Top Orders](https://www.interactivebrokers.com/en/trading/orders/boxtop.php)。
- **Conditional（条件单）** —— **仅当**你指定合约的条件被满足时才会自动提交/取消。详见 [Conditional Orders](https://www.interactivebrokers.com/en/trading/orders/conditional.php)。
- **Currency Conversion（货币转换单）** —— 用一个工具轻松把一种货币换成另一种。选源币种、填金额，系统自动建市价单执行转换。详见 [Currency Conversion Orders](https://www.interactivebrokers.com/en/trading/orders/currency-conversion.php)。
- **Direct Routing（直接路由）** —— 显式指定订单到**某个特定交易所/场所**执行，**不走** SmartRouting。详见 [Direct Routing Orders](https://www.interactivebrokers.com/en/trading/orders/direct-routing.php)。
- **Fractional Shares（碎股单）** —— 按**美元金额**而非股数建仓，若价格不整除则买入/卖出**碎股**。详见 [Fractional Shares Order](https://www.interactivebrokers.com/en/trading/orders/fractional-share-orders.php)。
- **Funari Orders（Funari 单）** —— 仅 TSE（**东京证券交易所**）可用：先按用户指定限价发出，未成交部分在收盘时**转为 MOC（Market-on-Close）**单重发。详见 [Funari Orders](https://www.interactivebrokers.com/en/trading/orders/funari.php)。
- **IBKR ATS Orders** —— 非可成交美股订单路由到 IBKRATS，进入我们自己的订单簿，与其他 IBKR 客户 SmartRouting 进来的对手方撮合。详见 [IBKRATS Orders](https://www.interactivebrokers.com/en/index.php?f=4485)。
- **IBKR ATS Pegged-to-Best** —— 卖出比最优 bid 高 1 tick、买入比最优 ask 低 1 tick。详见 [IBKR ATS Pegged-to-Best Orders](https://www.interactivebrokers.com/en/trading/orders/ibkrats-pegbest.php)。
- **IBKR ATS Pegged-to-Midpoint** —— 在 NBBO 中间价位置**挂单等待成交**，并支持**可选偏移量**去竞争流动性。详见 [IBKR ATS Pegged-to-Midpoint](https://www.interactivebrokers.com/en/trading/orders/ibkrats-pegmid.php)。
- **Iceberg/Reserve（冰山/隐藏单）** —— 大笔订单一次性提交，但**只对外显示一小部分**。详见 [Iceberg/Reserve](https://www.interactivebrokers.com/en/trading/orders/iceberg.php)。
- **Limit + Market（限价 + 市价）** —— 仅对**部分多腿组合单**有效。先以限价单发出，若第一条腿成交/部分成交，**剩余腿重发为市价单**。
- **Market with Protection（带保护市价单）** —— 市价单发出后，若不能立即全部成交，**取消并按限价单重发**。限价由交易所设定，卖出略高于市价，买入略低于市价。详见 [Market with Protection Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=marketProtectionModal)。
- **Minimum Quantity（最小成交量）** —— 订单属性，确保只有**达到指定最小数量**的部分才会成交。
- **NYSE Closing Auction D-Quote（NYSE 收盘 D-quote）** —— 在 NYSE 收盘拍卖中**以电子方式**发送**自主报价单（D-quote）**给我们指定的 NYSE 场内经纪人。详见 [NYSE Closing Auction D-Quote Orders](https://www.interactivebrokers.com/en/trading/orders/closing-auction-d-quote.php)。
- **Passive Relative（被动相对单）** —— 类似 Relative 单，但偏移方向**相反**——Passive 让单子**更不进取**，Relative 让单子**更进取**。详见 [Passive Relative Orders](https://www.interactivebrokers.com/en/trading/orders/passive-relative.php)。
- **Pegged to Market（挂单市价）** —— 主动型挂单：买挂最优卖价、卖挂最优买价。详见 [Pegged to Market Order](https://www.interactivebrokers.com/en/index.php?f=616)。
- **Pegged to Midpoint（挂单中间价）** —— 按 NBBO 中间价挂单。详见 [Pegged to Midpoint Orders](https://www.interactivebrokers.com/en/trading/orders/pegged-to-midpoint.php)。
- **Pegged to Stock（挂单正股）** —— 期权价格随正股价格**自动调整**，调整幅度由你输入的数据计算。详见 [Pegged-to-Stock Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=peggedStockModal)。
- **Pegged to Benchmark（挂单基准）** —— 价格随**用户指定的参考资产**变化自动调整。系统监控：指数用 Last 价，普通资产用 Bid（买）/ Ask（卖）价。详见 [Pegged to Benchmark Order](https://www.interactivebrokers.com/en/index.php?f=7100)。
- **Price Improvement Auction（价改善拍卖）** —— 发往 **BOX（Boston Options Exchange）**的期权订单可参与 BOX 的**亚分位价改善拍卖**。详见 [Price Improvement Auction Orders](https://www.interactivebrokers.com/en/index.php?f=614)。
- **Relative/Pegged-to-Primary（相对/挂单主市场）** —— 让交易者**比 NBBO 更进取**：在订单簿中挂出比当前报价更进取的买/卖单，提高成交概率。详见 [Relative/Pegged-to-Primary Orders](https://www.interactivebrokers.com/en/trading/orders/pegged-to-primary.php)。
- **Relative + Market（相对 + 市价）** —— 部分多腿组合单可用。**首条腿**以 Relative 限价单提交（买挂 bid、卖挂 ask，**加单不删单**），若首条腿成交/部分成交，**剩余腿重发为市价单**。
- **Request for Quote（询价单，RFQ）** —— 用 RFQ 功能为**美国公司债/市政债**和**非美期权**询价。详见 [RFQ User Guide](https://www.ibkrguides.com/traderworkstation/submit-an-rfq.htm)。
- **Retail Price Improvement Orders（RPI 单）** —— 在 NYSE RPI 项目下**提供流动性的订单**，与符合资格的隐藏 RPI 订单撮合。详见 [RPI Orders](https://www.interactivebrokers.com/en/index.php?f=4509)。
- **Snap to Market（瞬时挂市价）** —— 类似 pegged 单：原始价格 = 当前 bid/ask ± 偏移，但**"snap to"价格在价变动后不会跟随**。买 = ask − 偏移，卖 = bid + 偏移。详见 [Snap to Market Order](https://www.interactivebrokers.com/en/trading/orders/snap-to-market.php)。
- **Snap to Midpoint（瞬时挂中间价）** —— 买 = 中间价 − 偏移，卖 = 中间价 + 偏移。详见 [Snap to Midpoint Order](https://www.interactivebrokers.com/en/trading/orders/snap-to-midpoint.php)。
- **Snap to Primary（瞬时挂主市场）** —— 买 = bid + 偏移，卖 = ask − 偏移。详见 [Snap to Primary Order](https://www.interactivebrokers.com/en/trading/orders/snap-to-primary.php)。
- **Spread（价差单）** —— 多个**腿（legs）**组合的订单，代表一条完整交易策略。价差类型包括：期货价差、期权/期权、期权/股票、股票/股票组合。详见 [Spread Orders](https://www.interactivebrokers.com/en/trading/orders/spread.php)。
- **Stop - Adjustable（可调止损）** —— 给 stop / stop limit / trailing stop / trailing stop limit 附加**一次性调整**：设置触发价后，触发时**修改父单**而非提交新单。详见 [Stop-Adjustable Order](https://www.interactivebrokers.com/en/trading/orders/adjustable-stop.php)。
- **Stop Order with Protection（带保护止损单）** —— 兼具 stop limit 和 market with protection 的特性。**仅 Globex 上的期货单**可用：在触发价触发，并在 Globex 设定的保护价范围内成交。详见 [Stop with Protection Orders](https://www.interactivebrokers.com/en/index.php?f=3077)。
- **T + 0 Stock Settlement（T+0 股票结算）** —— 卖出**备兑看涨期权**的客户可选 T+0 结算方式买入新股来履行交割义务，**避免动用旧股导致更高税负**。
- **Trailing Stop（追踪止损）** —— 卖出追踪止损的初始止损价设在市价下方固定距离。市价上涨时止损价**同比例上移**（保持初始间距），市价下跌时止损价**不动**。触发时提交市价单。详见 [Trailing Stop Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=trailingModal)。
- **Trailing Stop Limit（追踪止损限价）** —— 同 Trailing Stop 类似，但触发时提交**限价单**（而非市价单），限价 = 触发价 ± 用户偏移。详见 [Trailing Stop Limit Orders](https://www.interactivebrokers.com/en/trading/orders/trailing-stop-limit.php)。
- **Trailing Market if Touched（追踪触及市价，TRAIL MIT）** —— 类似追踪止损单，但**卖出**单初始止损价设在市价**上方**（而非下方）。触发后转为市价单。详见 [Trailing Market if Touched Orders](https://www.interactivebrokers.com/en/trading/orders/trailing-market-touched.php)。
- **Trailing Limit if Touched（追踪触及限价，TRAIL LIT）** —— 类似追踪止损限价单，但**卖出**单初始止损价设在市价**上方**（而非下方）。触发后转为限价单。详见 [Trailing Limit if Touched Orders](https://www.interactivebrokers.com/en/trading/orders/trailing-limit-touched.php)。
- **Trailing Limit + Market** —— 仅部分多腿组合单可用。定义追踪量，触发后行为同 Limit + Market。
- **Trailing Relative + Market** —— 仅部分多腿组合单可用。定义追踪量，触发后行为同 Relative + Market。

---

## 对冲订单（Hedging Orders）

把对冲单附加到主单上：

- **Attach a Beta Hedge Order（附加 Beta 对冲单）** —— 给股票单附加 ETF 对冲单，按 Beta 系统性降低风险敞口。
- **Attach a Delta Hedge Order（附加 Delta 对冲单）** —— 给期权单附加 Delta 对冲单，可替代 Volatility 单上直接设对冲属性的方式。
- **Attach an FX Order（附加外汇单）** —— 主单合约币种 ≠ 基础币种时，附加一个外汇单把基础币种转换为合约币种以**支付交易成本**。
- **Attach a Pair Trade（附加配对交易）** —— 把一个合约与同行业的另一个合约**对冲**，按比例消除价差。
- **Auto Combo Limit Order（自动组合限价单）** —— 给多腿组合单附加反向限价单，限价由 **Combo Order Preset** 的"Target Order"决定。子单与父单用 OCA（one-cancels-other）标签自动关联，父单成交时**子单自动提交**。
- **Auto Combo Market Order（自动组合市价单）** —— 同上，但附加的是市价单。

---

## 订单属性（Order Attributes）

附加在订单上的**修饰属性**，改变订单行为而非订单类型本身：

- **All or None（AON）** —— 订单在交易所（或 IBKR 系统）一直保留，**直到全部数量可成交**。详见 [All or None Orders](https://www.interactivebrokers.com/en/trading/orders/aon.php)。
- **Block（大宗单）** —— 大额限价单，**至少 50 张合约**。详见 [Block Orders](https://www.interactivebrokers.com/en/trading/orders/block.php)。
- **Discretionary（自主决定单）** —— 限价单 + 用户指定的**自主量（discretionary amount）**，扩大可成交的价格区间。原始限价仍对外显示。把这个属性加到 SmartRouting 限价单上就成了 Discretionary 单。详见 [Discretionary Orders](https://www.interactivebrokers.com/en/trading/orders/discretionary.php)。
- **Hidden（隐藏单）** —— 一般是大额订单，**行情和深度簿上都不显示**。详见 [Hidden Orders](https://www.interactivebrokers.com/en/trading/orders/hidden.php)。
- **One Cancels Other（一单撤另一单）** —— 一对订单：一个成交后，另一个**自动撤销**。本质是 stop + limit 的组合，常用于**风险对冲**。
- **One-Cancels-All（OCA，整体撤单）** —— 多个订单用**客户端自定的标题**绑成一组。默认一组中**任一订单成交，其他全部取消**。**部分成交**时其他订单按剩余数量**等比例缩减**。**客户主动取消**一单时其他全部撤销，但**单子被系统拒绝/撤销**时其他订单**不会**自动取消。详见 [OCA](https://www.interactivebrokers.com/en/trading/orders/oca.php)。
- **Sweep-to-Fill（扫单成交）** —— 自动**扫描多个价位**：找最优价 + 该价上的可成交量 → 立即成交对应数量 → 继续扫下一个价位。详见 [Sweep-to-Fill](https://www.interactivebrokers.com/en/trading/orders/sweep-to-fill.php)。

---

## 波动率订单（Volatility Orders）

专门为**期权波动率交易**设计的订单类型：

- **Pegged to Primary Volatility Order（挂单同侧波动率）** —— 起始价 peg 在**同侧波动率**上：买入（call/put 都一样）挂波动率 bid，卖出挂波动率 ask。支持正向偏移或 0 偏移。详见 [Pegged to Primary Volatility](https://www.interactivebrokers.com/en/index.php?f=14735)。
- **Pegged to Market Volatility Order（挂单反向波动率）** —— 起始价 peg 在**反向波动率**上：买入挂波动率 ask，卖出挂波动率 bid。**要求正向偏移**。详见 [Pegged to Market Volatility Order](https://www.interactivebrokers.com/en/index.php?f=14735)。
- **Pegged to Midpoint Volatility Order（挂单波动率中间价）** —— 起始价 peg 在波动率 bid/ask 的**中间价**（bid + ask / 2）。支持正、负、0 偏移。详见 [Pegged to Midpoint Volatility Order](https://www.interactivebrokers.com/en/index.php?f=14735)。
- **Pegged to Surface Volatility Order（挂单隐含波动率曲面）** —— 起始价 peg 在**隐含波动率（implied volatility）**上。Call：买挂波动率 bid、卖挂 ask；Put：买挂 bid、卖 ask。支持任意偏移。详见 [Pegged to Surface Volatility Order](https://www.interactivebrokers.com/en/index.php?f=14735)。
- **Volatility Trading（VOL 波动率单）** —— 直接**按波动率下单**，并提供动态管理期权订单的能力。详见 [Volatility Trading Order](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=volatilityModal)。

---

## 时效（Times in Force）

订单在自动撤销前**保持有效的时间长度**。TWS 支持以下时效：

- **At Auction（拍卖单）** —— 在盘前开盘期间以**计算开盘价（COP）**撮合；若开盘未成交，转为限价单（限价 = COP 或开盘后最优 bid/ask）。详见 [Auction Order](https://www.interactivebrokers.com/en/trading/orders/auction.php)。
- **Fill or Kill（FOK，全部成交或撤销）** —— 必须**立即全部成交**，否则**整单撤销**。多用于期权。详见 [FOK Orders](https://www.interactivebrokers.com/en/trading/orders/fok.php)。
- **Good After Time（GAT，定时发送）** —— 订单保留在系统中，**到你指定的日期/时间**再发到交易所。详见 [GAT Orders](https://www.interactivebrokers.com/en/trading/orders/gat.php)。
- **Good-Til-Canceled（GTC，长期有效）** —— 一致有效到成交或被取消。允许在大多数资产类上以**远低于市价**的 bid 或**远高于市价**的 offer 挂单，挂**数天、数周、数月**。详见 [GTC Orders](https://www.interactivebrokers.com/en/trading/orders/gtc.php)。
- **Good-Til-Date/Time（GTD，到期有效）** —— 指定一个**到期日期/时间**，订单到期前一直有效。详见 [GTD Orders](https://www.interactivebrokers.com/en/trading/orders/gtd.php)。
- **Immediate or Cancel（IOC，即时成交否则撤销）** —— **未立即成交**的部分**自动撤销**。详见 [IOC Orders](https://www.interactivebrokers.com/en/trading/orders/ioc.php)。
- **Limit-On-Open（LOO，开盘限价）** —— 开盘价**等于或优于**限价时按开盘价成交。详见 [LOO Orders](https://www.interactivebrokers.com/en/trading/orders/loo.php)。
- **Market-on-Open（MOO，开盘市价）** —— 开盘时按开盘价成交。详见 [MOO Orders](https://www.interactivebrokers.com/en/trading/orders/moo.php)。
- **Overnight Trading（隔夜交易）** —— 所有有美股交易权限的客户可参与**美股隔夜交易**，**免费**接收隔夜行情。美股/ETF 隔夜时段：ET 20:00 — 次日 03:50；每周日 ET 20:00 开始、周五 ET 03:50 结束。详见 [Overnight Trading Orders](https://www.interactivebrokers.com/en/trading/us-overnight-trading.php)。
- **Regular Trading Hours（RTH，常规交易时段）** —— 泛指某交易所/地区的**主要交易时段**。例如美股 RTH = ET 09:30 — 16:00。盘前/盘后统称 **extended trading hours**。详见 [Regular Trading Hours](https://ibkrcampus.com/trading-lessons/trading-outside-regular-trading-hours-rth/)。
- **OVERNIGHT + SMART** —— 在**隔夜时段**提交的订单，**次日 04:00 起**会**同时**作为 SMART 单工作到 ET 20:00 收盘。
- **Time in Force for Orders** —— 时效总览。详见 [Time in Force for Orders](https://www.interactivebrokers.com/en/trading/ordertypes.php?m=goodTilDateTimeModal)。

---

## 关键要点

- TWS 90+ 订单类型 = **基础单 × 时效 × 属性** 的组合，**没有哪个类型是孤立存在的**。
- IB Algo / Adaptive 这类**算法单**在交易量大时**显著优于**手挂市价单，尤其在买卖价差大的标的上。
- RPI、PEG Best、IBKR ATS 这类**流动性提供单**（passive / add liquidity）通常**回佣更低**甚至**返佣**，适合不着急成交的策略。
- Volatility 类订单是**期权专业玩家**的武器：直接以**波动率维度**思考，对习惯用 delta 的交易者门槛较高。
- Times in Force 选错 = **白等一晚**或**过早失效**：挂隔夜单忘了设置 GTC，凌晨就被自动撤销了。

---

## 相关章节

- [订单预设（Order Presets）](order-presets.md)
- [订单共享模式（Order Sharing Modes）](order-sharing-modes.md)
- [订单管理（Order Management）](order-management.md)
- [订单票（Order Ticket）](order-ticket.md)
- [TWS 入门概览](getting-started.md)
- 外部：[IBKR Campus - Introduction to TWS Order Types](https://ibkrcampus.com/trading-course/introduction-to-tws-order-types/)

---

## 原文参考

- 原文 URL：<https://www.ibkrguides.com/traderworkstation/order-types.htm>
- 最后更新：2025-10-08
- 引用图片：`resources/images/mosaicordertype.png`（Mosaic Order Type 下拉）、`classicordertype.png`（Classic TWS Order Type 下拉）
