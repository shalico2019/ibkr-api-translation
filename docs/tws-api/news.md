# 新闻数据（News）

> 原文：[TWS API – News](https://interactivebrokers.github.io/tws-api/news.html)
> 翻译：Mavis

TWS API 可以拿**合约相关**或**全市场（BroadTape）**新闻。**注意：API 新闻订阅独立于 TWS 新闻订阅**——大部分 TWS 新闻在 API 端不可用，需要单独订阅 API 版本。

---

## TWS 默认启用的 API 新闻源（TWS v966+）

| 代码 | 名称 | 是否默认启用 |
|------|------|--------------|
| `BRFG` | Briefing.com General Market Columns | ✅ |
| `BRFUPDN` | Briefing.com Analyst Actions | ✅ |
| `DJNL` | Dow Jones Newsletters | ✅ |

## 需要在 Account Management 单独订阅的 API 新闻源

| 代码 | 名称 |
|------|------|
| `BRF` | Briefing Trader |
| `BZ` | Benzinga Pro |
| `FLY` | Fly on the Wall |

!!! danger "收费不同"
    API 版本的订阅**和 TWS 版本分开计费**，价格也不同。订阅时务必选 "API" 版本。

---

## 1. 查询已订阅的新闻源（API v973.02+）

```python
ib.reqNewsProviders()
```

回调：

```python
def newsProviders(self, newsProviders):
    for p in newsProviders:
        print(f"{p.providerCode}: {p.providerName}")
```

输出示例：

```
BRFG: Briefing.com General Market Columns
BRFUPDN: Briefing.com Analyst Actions
DJNL: Dow Jones Newsletters
```

---

## 2. 合约相关实时新闻（Contract Specific News）

通过 `reqMktData` + 特殊 `genericTickList` 订阅。**核心参数：`292:<news_code>`**：

| 参数 | 含义 |
|------|------|
| `mdoff` | 关闭市场行情（只拿新闻） |
| `292:BZ` | Benzinga Pro |
| `292:BRFG` | Briefing.com General Market |
| `292:BRFG+DJNL` | 同时订阅多个，用 `+` 分隔 |
| `292:DJ-RT` | Dow Jones real-time |

```python
# 订阅 AAPL 的 Briefing.com General Market Columns 实时新闻
ib.reqMktData(aapl, "mdoff,292:BRFG", False, False)
```

新闻通过 `tickNews` 回调推送：

```python
def tickNews(self, tickerId, timeStamp, providerCode, articleId, headline, extraData):
    print(f"[{providerCode}] {headline} (articleId={articleId})")
```

!!! warning "没订阅会报错"
    如果用户名下没订阅对应 API 新闻源，会收到 `invalid tick type` 错误。

---

## 3. 全市场新闻（BroadTape News）

定义一个**特殊合约**来订阅整条新闻流：

| Source | symbol | secType | exchange |
|--------|--------|---------|----------|
| Briefing Trader | `BRF:BRF_ALL` | `NEWS` | `BRF` |
| Benzinga Pro | `BZ:BZ_ALL` | `NEWS` | `BZ` |
| Fly on the Wall | `FLY:FLY_ALL` | `NEWS` | `FLY` |

```python
from ib_insync import Contract

bz = Contract(symbol="BZ:BZ_ALL", secType="NEWS", exchange="BZ")
ib.reqMktData(bz, "mdoff,292", False, False)
```

!!! note "Briefing Trader 特别说明"
    Briefing Trader 的实时新闻**API 版本只能按 case-by-case 申请**。需要直接联系 Briefing.com 申请 API 权限。

---

## 4. 历史新闻头条（API v973.02+）

调用 `reqHistoricalNews` 拉历史新闻：

```python
ib.reqHistoricalNews(
    reqId=10003,
    conId=8314,             # 合约 conId（如 IBM）
    providerCodes="BRFG",   # 多个用 + 分隔
    startDateTime="",       # 空 = 最早
    endDateTime="",         # 空 = 现在
    totalResults=10,        # 最多拿多少条
)
```

回调 `historicalNews` 返回历史头条，`historicalNewsEnd` 表示结束。

---

## 5. 获取新闻正文（API v973.02+）

拿到头条后，用 `articleId` 拿正文：

```python
ib.reqNewsArticle(
    reqId=10002,
    providerCode="BRFG",
    articleId="BRFG$04fb9da2",
)
```

回调 `newsArticle` 返回正文内容（HTML 或纯文本格式，看 provider）。

---

## 实战示例：搭建一个简易新闻监控

```python
from ib_insync import IB, Stock

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)

aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

# 订阅 Briefing.com + Dow Jones 实时新闻
ib.reqMktData(aapl, "mdoff,292:BRFG+DJNL", False, False)

def on_tick_news(tickerId, timeStamp, providerCode, articleId, headline, extraData):
    print(f"[{providerCode}] {headline}")

ib.tickNewsEvent += on_tick_news

ib.run()  # 阻塞，持续处理消息
```

---

## 下一步

- [合约](contracts.md) —— 拿合约的 `conId` 用来查新闻
- [市场数据](market_data.md) —— 行情和新闻可以一起订阅