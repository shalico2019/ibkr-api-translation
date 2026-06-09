# 行情数据（Streaming Market Data）

> 原文：[TWS API – Streaming Market Data](https://interactivebrokers.github.io/tws-api/market_data.html)
> 翻译：Mavis

TWS API 提供三类行情数据：

1. **Top of Book（Level I）** —— 一档行情
2. **Market Depth（Level II）** —— 深度行情（盘口）
3. **5 秒实时 K 线** —— 5-second real time bars

---

## 实时行情的前置条件

通过 API 拿实时一档 / 深度 / 历史数据之前，必须满足以下三个条件：

1. **该标的的交易权限**（trading permissions）
2. **账户已入金**（外汇和债券除外）
3. **用户名下的行情订阅**（market data subscriptions）

### 如何订阅

1. 登录 **Account Management**
2. 进入 `Manage Account → Trade Configuration → Market Data`
3. 选择你要订阅的行情包 / 订阅

!!! tip "如何知道某标的要订阅哪个行情包"
    - 在 TWS 自选列表里**右键合约 → Launch Market Data Subscription Manager**，会跳转到对应行情订阅页面
    - 或者用 "Market Data Assistant" 工具查

!!! danger "收费规则"
    行情订阅**按整月计费，不按天比例**（即使月中订阅也是收一整月的钱）。

---

## 共享行情订阅

行情订阅是绑定到 **TWS 用户名**的，不是绑定到账户的。也就是说你有几个 live TWS 用户，就要买几份订阅。

**唯一例外**：paper trading（模拟交易）用户可以共享 live 用户的订阅。

设置方法：

1. 进入 **Account Management**
2. `Manage Account → Settings → Paper Trading`
3. 配置共享

!!! warning "生效时间"
    共享设置**最长 24 小时**生效。

!!! danger "共享条件"
    模拟账户能用 live 行情的前提：

    1. 已按上面方法配置共享
    2. **同时**没有在另一台机器上用 live 用户名登录

---

## 行情线路（Market Data Lines）

每次你在 TWS 里或通过 API 请求一个标的的实时行情，都**占用一条行情线路**。行情线路数 = 你当前活跃的行情请求数。

**举例**：假设你最多有 10 条行情线路（maxTicker = 10），且已经在 TWS 里看了 5 只股票的实时行情。然后 API 客户端再请求另外 5 个标的的实时行情——这时你已经有 10 条被占用。**如果再请求第 11 个标的，TWS 会报"超出最大同时请求数"的错误。** 必须先取消一些订阅。

!!! info "默认上限"
    每个用户默认 maxTicker = **100 条**，可以通过购买 quote booster pack 或增加账户资产/佣金来提高上限。具体规则见 IBKR 官网 "Research, News and Market Data" 页面下的 "Market Data Display" 章节。

!!! note
    行情线路的概念**不仅影响实时一档行情**，对**深度行情和实时 K 线**同样适用。

---

## 报价单位（Quotes in Shares）

**TWS 985 之前**：美股报价 size 用 round lots（每手 100 股）。
**TWS 985 起**：bid / ask / last 的 size 直接用**股数**显示，不再换算成手数。

API 用户可以在 TWS 配置兼容老程序（`Global Configuration → API → Settings → Bypass US Stocks market data in shares warning for API orders`），但**官方强烈建议尽早迁移到新格式**。

---

## 请求实时行情

TWS API 通过 `reqMktData` 请求实时一档行情。客户端需要实现 `tickPrice` 和 `tickSize` 回调接收 tick：

```python
class TestWrapper(wrapper.EWrapper):
    def tickPrice(self, reqId, tickType, price, attrib):
        print(f"reqId={reqId} tickType={tickType} price={price}")

    def tickSize(self, reqId, tickType, size):
        print(f"reqId={reqId} tickType={tickType} size={size}")

# Python 示例（ib_insync）
from ib_insync import IB, Stock
ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

ticker = ib.reqMktData(aapl, '', False, False)
ib.sleep(5)  # 拿 5 秒行情
print(f"AAPL 最新价：{ticker.marketPrice()}")
ib.cancelMktData(aapl)
```

---

## 下一步

- [历史数据](historical_data.md) —— 拿 K 线 / 历史 tick 数据
- [账户与持仓](account_portfolio.md) —— 看账户余额、持仓、盈亏