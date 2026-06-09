# 金融工具（合约）

> 原文：[TWS API – Financial Instruments](https://interactivebrokers.github.io/tws-api/contracts.html) · [Basic Contracts](https://interactivebrokers.github.io/tws-api/basic_contracts.html)
> 翻译：Mavis

## 概述

`Contract` 对象代表交易标的——股票、期货、期权等。每当你通过 TWS API 发起**任何需要合约的请求**（行情、下单等），TWS 都会尝试把你提供的 `Contract` 对象匹配到**唯一一个**真实合约上。

如果同一个描述匹配出**多个**合约，TWS 会返回 **ambiguous（歧义）** 错误，让你补充更多字段来唯一定位合约。

!!! tip "如何找合约的精确字段"
    在 TWS 界面里**双击**合约，或右键选 `Contract Info → Description`，可以看到完整的合约描述（包括所有字段）。要看更详细的，再选 `Contract Info → Details`。

**最简单的合约定义**需要 4 个字段：`symbol`、`secType`、`currency`、`exchange`。绝大多数股票、CFD、指数、外汇对用这 4 个字段就能唯一定位。更复杂的合约（期权、期货）需要额外字段。下面按标的类型给出示例。

!!! warning "ISLAND → NASDAQ 兼容性"
    历史交易所代码 `ISLAND` 即将改名为 `NASDAQ`，所有用了 `ISLAND` 的合约定义会失效。TWS 10.16+ 提供了兼容开关 `Compatibility Mode: Send ISLAND for US Stocks trading on NASDAQ`，但**强烈建议尽早改用 `NASDAQ`**。

---

## FX（外汇对）

| 字段 | 值 |
|---|---|
| symbol | EUR |
| secType | CASH |
| currency | GBP |
| exchange | IDEALPRO |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.symbol = "EUR"
        contract.secType = "CASH"
        contract.currency = "GBP"
        contract.exchange = "IDEALPRO"
        ```

    === "Java"

        ```java
        Contract contract = new Contract();
        contract.symbol("EUR");
        contract.secType("CASH");
        contract.currency("GBP");
        contract.exchange("IDEALPRO");
        ```

    === "C++"

        ```cpp
        Contract contract;
        contract.symbol = "EUR";
        contract.secType = "CASH";
        contract.currency = "GBP";
        contract.exchange = "IDEALPRO";
        ```

---

## 加密货币（Cryptocurrency）

| 字段 | 值 |
|---|---|
| symbol | ETH |
| secType | CRYPTO |
| exchange | PAXOS |
| currency | USD |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.symbol = "ETH"
        contract.secType = "CRYPTO"
        contract.currency = "USD"
        contract.exchange = "PAXOS"
        ```

    === "Java"

        ```java
        Contract contract = new Contract();
        contract.symbol("ETH");
        contract.secType("CRYPTO");
        contract.exchange("PAXOS");
        contract.currency("USD");
        ```

---

## 股票（Stocks）

基础股票合约：

| 字段 | 值 |
|---|---|
| symbol | SPY |
| secType | STK |
| currency | USD |
| exchange | ARCA |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.symbol = "SPY"
        contract.secType = "STK"
        contract.currency = "USD"
        contract.exchange = "ARCA"
        ```

### SMART 智能路由股票

当使用 SMART 智能路由时，`exchange` 和 `primaryExch` 同时存在。对于某些在 SMART 上有多个潜在源交易所的股票，必须指定 **`primaryExch`**（标的的"本交所"）才能唯一定位合约。

!!! tip "好习惯"
    **对所有股票都建议带上 `primaryExch`**，省去很多歧义错误。

| 字段 | 值 |
|---|---|
| symbol | SPY |
| secType | STK |
| currency | USD |
| exchange | SMART |
| primaryExch | ARCA |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.symbol = "SPY"
        contract.secType = "STK"
        contract.currency = "USD"
        contract.exchange = "SMART"
        contract.primaryExchange = "ARCA"
        ```

!!! note "行情请求的简写"
    请求行情时，可以把路由交易所和主交易所合并到一个 `exchange` 字段，用冒号或斜杠分隔，例如 `SMART:ARCA`。默认分隔符是 `:` 和 `/`，也可以在 TWS 全局配置的 `API → Settings` 里自定义。注意：**TWS 971 之前的版本里这个语法只对行情请求有效，下单不行。**

### 用 FIGI 定义合约

也可以通过 **FIGI**（Bloomberg 全球标识符）唯一定位合约：

| 字段 | 值 |
|---|---|
| secIdType | FIGI |
| secId | BBG000B9XRY4 |
| exchange | SMART |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.secIdType = "FIGI"
        contract.secId = "BBG000B9XRY4"
        contract.exchange = "SMART"
        ```

### 上市当日（IPO）股票

IPO 当天的股票合约定义同上，用 SMART 即可（symbol 是带 U 后缀的 placeholder，比如 `EMCGU`）。

---

## 指数（Indexes）

TWS 965+ 起，指数可以通过 ISIN 在 API 中查到：

| 字段 | 值 |
|---|---|
| symbol | DAX |
| secType | IND |
| currency | EUR |
| exchange | EUREX |

??? example "代码示例"

    === "Python"

        ```python
        contract = Contract()
        contract.symbol = "DAX"
        contract.secType = "IND"
        contract.currency = "EUR"
        contract.exchange = "EUREX"
        ```

---

## CFD（差价合约）

| 字段 | 值 |
|---|---|
| symbol | IBDE30 |
| secType | CFD |
| currency | EUR |
| exchange | SMART |

---

## 期货（Futures）

标准期货合约需要标的 + 到期月：

| 字段 | 值 |
|---|---|
| symbol | GBL |
| secType | FUT |
| exchange | EUREX |
| currency | EUR |
| lastTradeDateOrContractMonth | 202303 |

!!! tip "已到期期货的历史数据"
    期货到期后**最长 2 年内**仍可拿到历史数据，把 `Contract` 类的 `includeExpired` 字段设为 `True` 即可。

### 用 localSymbol 定义

`localSymbol` 是 IB 给期货自己定义的本地代码（在 TWS 的 Contract Description 窗口里能看到）。由于 `localSymbol` 本身就能唯一定位一个期货，**不需要再填到期月**：

| 字段 | 值 |
|---|---|
| secType | FUT |
| exchange | EUREX |
| currency | EUR |
| localSymbol | FGBL MAR 23 |

### 处理重复合约（歧义）

同一个标的、同一到期月，偶尔会有多个合约（合约乘数不同等）。这时需要补 **`multiplier`** 字段：

| 字段 | 值 |
|---|---|
| symbol | DAX |
| secType | FUT |
| exchange | EUREX |
| currency | EUR |
| lastTradeDateOrContractMonth | 202303 |
| multiplier | 1 |

### 连续期货（CONTFUT）

TWS 971+ 起支持连续期货：

| 字段 | 值 |
|---|---|
| symbol | GBL |
| secType | CONTFUT |
| exchange | EUREX |

!!! warning
    连续期货**只能用于历史数据请求**，不能用于实时行情和下单。

### 同时查期货 + 连续期货

把 `secType` 写成 `FUT+CONTFUT`，可以一次性查到某个标的所有普通期货和连续期货合约定义。**这个 secType 只能用来请求合约定义，不能做其他事。**

---

## 期权（Options）

期权比期货多 3 个必填字段：`strike`、`right`、`multiplier`：

| 字段 | 值 |
|---|---|
| symbol | GOOG |
| secType | OPT |
| exchange | BOX |
| currency | USD |
| lastTradeDateOrContractMonth | 20170120 |
| strike | 615 |
| right | C |
| multiplier | 100 |

### 用 tradingClass 消歧

经常出现多个期权合约字段几乎相同的情况（标的、行权日、行权价、乘数都一样），这时需要加 **`tradingClass`** 才能唯一定位：

| 字段 | 值 |
|---|---|
| symbol | SANT |
| secType | OPT |
| exchange | MEFFRV |
| currency | EUR |
| lastTradeDateOrContractMonth | 20190621 |
| strike | 7.5 |
| right | C |
| multiplier | 100 |
| tradingClass | SANEU |

### 用 OCC localSymbol 定义

OCC 期权代码可以直接填到 `localSymbol` 字段：

| 字段 | 值 |
|---|---|
| localSymbol | P BMW  20221216 72 M |
| secType | OPT |
| exchange | EUREX |
| currency | EUR |

!!! warning
    **`localSymbol` 里的空格必须保留**，比如 `"P BMW  20221216 72 M"`（`BMW` 后面是两个空格）。

---

## 期货期权（Futures Options）

| 字段 | 值 |
|---|---|
| symbol | GBL |
| secType | FOP |
| exchange | EUREX |
| currency | EUR |
| lastTradeDateOrContractMonth | 20230224 |
| strike | 138 |
| right | C |
| multiplier | 1000 |

!!! warning "行权价与价格放大因子"
    **TWS 972 之前**：如果期货期权有价格放大因子（price magnifier），API 的 `strike` 是 TWS 显示价除以放大因子。例如 ZW（小麦）以美元显示，但 API 用美分。
    **TWS 972 之后**：API 和 TWS 显示的行权价一致（不再除放大因子）。

    对于某些期货期权（如 GE），必须用 `tradingClass`、`localSymbol` 或 `conId` 才能唯一定位。

---

## 债券（Bonds）

债券可以用 **CUSIP** 或 **ISIN** 作为 symbol：

| 字段 | 值 |
|---|---|
| symbol | 912828C57 |
| secType | BOND |
| exchange | SMART |
| currency | USD |

也可以用 `conId` + exchange（适合所有证券类型）：

| 字段 | 值 |
|---|---|
| conId | 456467716 |
| exchange | SMART |

---

## 共同基金（Mutual Funds）

API 支持在**模拟账户和真实账户**下共同基金下单。

!!! warning "下单规则差异"
    不同基金的下单规则不同，比如 **买入 ARBIX 必须用 `cashQty`（按金额买）**，**卖出 ARBIX 可以用 `totalQuantity`（按份额卖）**。建议先用 TWS 界面搞清楚基金的下单规则，再写 API。

| 字段 | 值 |
|---|---|
| symbol | VINIX |
| secType | FUND |
| exchange | FUNDSERV |
| currency | USD |

---

## 大宗商品（Commodities）

| 字段 | 值 |
|---|---|
| symbol | XAUUSD |
| secType | CMDTY |
| exchange | SMART |
| currency | USD |

---

## 标准权证（Standard Warrants）

权证和期权类似，需要到期日、right、行权价、乘数。某些权证需要 `localSymbol` 或 `conId` 才能唯一定位。

| 字段 | 值 |
|---|---|
| symbol | GOOG |
| secType | WAR |
| exchange | FWB |
| currency | EUR |
| lastTradeDateOrContractMonth | 20201117 |
| strike | 1500.0 |
| right | C |
| multiplier | 0.01 |

---

## 荷兰权证 / 结构化产品（Dutch Warrants / IOPT）

必须用 **`conId`** 或 **`localSymbol`** 才能唯一定位。

!!! danger "小心 API 连接断开"
    如果用**定义不完整的 IOPT 合约**去 `reqContractDetails`，可能会返回**成千上万条**结果，直接把 API 连接搞挂。

    IOPT 合约定义经常变动，加载新定义通常需要**重启 TWS 或 IB Gateway**。

| 字段 | 值 |
|---|---|
| localSymbol | B881G |
| secType | IOPT |
| exchange | SBF |
| currency | EUR |

---

## 快速对照表

| SecType | 含义 | 关键额外字段 |
|---------|------|--------------|
| `STK` | 股票 | `primaryExch`（SMART 时必填） |
| `CASH` | 外汇对 | `currency`（=计价币种） |
| `CRYPTO` | 加密货币 | `exchange=PAXOS` |
| `CFD` | 差价合约 | - |
| `IND` | 指数 | - |
| `FUT` | 期货 | `lastTradeDateOrContractMonth` 或 `localSymbol` |
| `CONTFUT` | 连续期货 | 仅用于历史数据 |
| `FUT+CONTFUT` | 期货+连续期货查询 | 仅用于合约定义查询 |
| `OPT` | 期权 | `strike`、`right`、`multiplier` |
| `FOP` | 期货期权 | `strike`、`right`、`multiplier` |
| `BOND` | 债券 | `symbol` = CUSIP 或 ISIN |
| `FUND` | 共同基金 | - |
| `CMDTY` | 大宗商品 | - |
| `WAR` | 标准权证 | `strike`、`right`、`multiplier` |
| `IOPT` | 荷兰权证/结构化产品 | 必须 `localSymbol` 或 `conId` |

---

## 下一步

合约定义搞定之后，下一章讲**下单**：

👉 [下单（Orders）](orders.md)