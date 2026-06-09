# 最小价格变动（Minimum Price Increment）

> 原文：[TWS API – Minimum Price Increment](https://interactivebrokers.github.io/tws-api/minimum_increment.html)
> 翻译：Mavis

**最小变动价位（minimum price increment）** 是合约价格在交易时允许的最小跳动单位。

- 大部分合约：**所有价位都用同一个最小变动**
- 部分合约：**不同交易所、不同价位区间**用不同的最小变动

---

## 如何查询合约的最小变动

### 简单查询：`ContractDetails.minTick`

调用 `reqContractDetails` 拿到的 `ContractDetails` 对象里有一个 **`minTick`** 字段：

> `minTick` 是该合约在**任何交易所、任何价位**遇到过的**最小可能最小变动**——只能做粗略参考。

### 精确查询：Market Rule

`ContractDetails` 还有一个 **`marketRuleIDs`** 字段，对应一个或多个 market rule。每个 market rule 定义了**特定价位区间**的最小变动。

要拿到完整规则，调用 `reqMarketRule(marketRuleId)`：

```python
# 查询指定 market rule
ib.reqMarketRule(26)
ib.reqMarketRule(240)
```

回调 `marketRule(marketRuleId, priceIncrements)` 返回**价位区间 → 最小变动**的映射：

```python
def marketRule(self, marketRuleId, priceIncrements):
    print(f"Rule {marketRuleId}:")
    for inc in priceIncrements:
        print(f"  价格 >= {inc.lowEdge} → 最小变动 {inc.increment}")
```

输出示例：

```
Rule 26:
  价格 >= 0 → 最小变动 0.01
  价格 >= 1.0 → 最小变动 0.05
  价格 >= 5.0 → 最小变动 0.1
```

---

## 外汇的特殊情况

外汇和外汇 CFD 的 market rule 默认是 **1/2 pip**（不是 1/10 pip）。要切换到 1/10 pip：

> TWS 全局配置 → Display → Ticker Row → **Allow Forex trading in 1/10 pips**

---

## 非美股合约的最小手数

部分非美股合约（如港交所 SEHK 的标的）有**最小手数**限制。这个信息**API 拿不到**，要去 [IB Contracts and Securities search](https://www.interactivebrokers.com/en/index.php?f=2222) 网站查。

如果下单手数不满足最小手数，订单会被拒，并在 error message 里提示。

---

## 实战示例：下单前先查最小变动

```python
from ib_insync import IB, Stock

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)
aapl = Stock('AAPL', 'SMART', 'USD')

details = ib.reqContractDetails(aapl)
cd = details[0].contractDetails

print(f"AAPL minTick（粗略）: {cd.minTick}")
print(f"AAPL marketRuleIDs:   {cd.marketRuleIds}")
# 想看完整阶梯规则，可以再调一次 reqMarketRule
```

---

## 下一步

- [下单](orders.md) —— 拿到 market rule 后就能精确下单
- [错误处理](error_handling.md) —— 价格不合法时报什么错