# 行情（Market Data）

> **英文原文**：[Endpoints Explorer → Market Data](https://interactivebrokers.github.io/cpwebapi/endpoints) + [Use Cases → Snapshot Requests / Option Chains](https://interactivebrokers.github.io/cpwebapi/use-cases)
> **翻译版本**：v1
> **译者**：@shalico2019

## 概述

Client Portal API 的行情（Market Data）分组提供两类数据：

1. **快照（Snapshot）** —— 单次拉取一次行情，不订阅流。包含两种端点：`/md/snapshot`（Beta，老版）和 `/iserver/marketdata/snapshot`（推荐）。
2. **历史 K 线（History）** —— `/iserver/marketdata/history` 拉日 / 周 / 月 / 年 / 分钟级历史数据。
3. **订阅取消** —— `/iserver/marketdata/{conid}/unsubscribe`、`/iserver/marketdata/unsubscribeall`。

> ⚠️ **重要前置**：
>
> - 必须 [认证 + 切换账户](./session.md)。
> - 行情属于"用户级订阅"——一个用户名订阅了 NBI/UTP 等行情商，按 IBKR 计费规则会单独计费。详细规则见 [Use Cases → Multiple usernames](https://interactivebrokers.github.io/cpwebapi/use-cases)。
> - **限频**：snapshot 端点 **10 req/s**；history 端点 **5 concurrent requests**。

## 1. `GET /iserver/marketdata/snapshot` — 行情快照（推荐）

**注意**：这是**订阅型**调用——第一次调用建立订阅，**第二次**才会返回真实数据。官方没有明说间隔时间，但 5 秒是经验值。

```python
import time, requests
BASE = "https://localhost:5000/v1/api"
FIELDS = "31,84,85,86,88,7051,7052,7053,7054"  # 字段编号见下表

conid = 265598  # 示例：AAPL

# 第一次：建立订阅（注意 conid 放在 query string，fields 同样在 query）
r1 = requests.get(
    f"{BASE}/iserver/marketdata/snapshot",
    params={"conids": conid, "fields": FIELDS, "useAdmin": False},
    verify=False, timeout=10,
)
print("first call:", r1.json())  # 通常返回 {"conid": ..., "data": []}

time.sleep(5)

# 第二次：拿到真实数据
r2 = requests.get(
    f"{BASE}/iserver/marketdata/snapshot",
    params={"conids": conid, "fields": FIELDS, "useAdmin": False},
    verify=False, timeout=10,
)
print(r2.json())
```

典型响应：

```json
{
  "conid": 265598,
  "data": [
    {
      "conid": 265598,
      "31": "180.50",     // Last Price
      "84": "10",         // Bid Size
      "85": "180.45",     // Bid Price
      "86": "12",         // Ask Size
      "88": "180.55",     // Ask Price
      "7051": "180.62",   // Mark
      "7052": "180.50",   // Last
      "7053": "100"       // Volume
    }
  ]
}
```

**常用 field 编号**（完整列表见 [官方 Swagger](https://interactivebrokers.github.io/cpwebapi/endpoints)）：

| 编号 | 含义 |
| --- | --- |
| `31` | Last Price（最新价） |
| `32` | Bid Size |
| `33` | Ask Size（部分文档中编号 83/86 互换，以实际为准） |
| `55` | Symbol |
| `70` | High |
| `71` | Low |
| `84` | Bid Size |
| `85` | Bid Price |
| `86` | Ask Size |
| `88` | Ask Price |
| `7051` | Mark（IBKR 内部标记价） |
| `7052` | Last（含盘后最新） |
| `7053` | Volume |
| `7054` | 30 天平均成交量 |

> 想看完整字段定义，请在 Swagger 页面点击端点 "Try it out" 后查 `fields` 参数的枚举。

## 2. `GET /md/snapshot` — 行情快照（Beta，旧版）

老版端点，行为类似 `/iserver/marketdata/snapshot` 但参数结构不同。建议新项目直接用上面的版本，仅在维护老代码时使用。

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(
    f"{BASE}/md/snapshot",
    params={"conid": 265598, "fields": FIELDS},
    verify=False, timeout=10,
)
print(r.json())
```

## 3. Option Chains（期权链）

[Use Cases → Option Chains](https://interactivebrokers.github.io/cpwebapi/use-cases) 写得很简单：

> 请求期权行情时，**把 strike（行权价）设为 0**，即可一次性拿到该标的的整条期权链。

也就是说，先用 `/trsv/secdef` 查到期日，再对每个 (conid, strike=0) 调 snapshot 即可拿到 call/put 完整链。具体 `secdef` 流程本节不展开。

## 4. `GET /iserver/marketdata/history` — 历史 K 线

最常用的"拉历史数据"端点。支持日 / 周 / 月 / 年以及分钟级 K 线。

```python
import requests
BASE = "https://localhost:5000/v1/api"

params = {
    "conid": 265598,
    "period": "1w",        # 1d / 1w / 1m / 1y
    "bar": "1d",           # 1min / 5min / 1h / 1d / 1w / 1m
    "outsideRth": False,   # 是否含盘外
    "startTime": "20250601000000",  # 起始时间，格式 yyyyMMddHHmmss
}

r = requests.get(f"{BASE}/iserver/marketdata/history",
                 params=params, verify=False, timeout=30)
print(r.json())
```

返回结构示意：

```json
{
  "symbol": "AAPL",
  "text": "APPLE INC",
  "priceFactor": 1,
  "startTime": "20250601000000",
  "high": "182.00",
  "low": "177.50",
  "data": [
    {
      "o": 180.10, "h": 181.20, "l": 179.80, "c": 180.95,
      "v": 52340000, "t": 1717200000000
    }
  ]
}
```

`bar` 取值速查：

| bar | 说明 |
| --- | --- |
| `1min` / `2min` / `3min` / `5min` / `10min` / `15min` / `30min` | 分钟级（视订阅等级而定） |
| `1h` | 小时级 |
| `1d` | 日 K（最常用） |
| `1w` | 周 K |
| `1m` | 月 K |
| `1y` | 年 K |

`period` 表示"往前回溯多长时间"——`1d` 是 1 天，`1w` 是 1 周。两者结合即"过去 N 个单位时间内、bar 为 M 的 K 线"。

> **限频**：`/iserver/marketdata/history` 是 **5 concurrent requests**——同时并发最多 5 路。超过会触发 `429`。
> **常见错误码**：
>
> - `400 Bad Request` —— `period`/`bar` 不匹配（如 `period=1w, bar=1y` 无意义）。
> - `429` —— 并发超限，等待几秒后重试。

## 5. `GET /iserver/marketdata/{conid}/unsubscribe` — 取消单 conid 订阅

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(
    f"{BASE}/iserver/marketdata/265598/unsubscribe",
    verify=False, timeout=5,
)
print(r.json())
```

## 6. `GET /iserver/marketdata/unsubscribeall` — 取消所有订阅

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/iserver/marketdata/unsubscribeall",
                 verify=False, timeout=5)
print(r.json())
```

建议在脚本退出 / 切换账户 / 长时间暂停时调用，避免累计订阅。

## 7. 与 WebSocket 的关系

Client Portal API 还提供 `/ws` WebSocket 端点用于**订阅式**行情推送（详见 [Websockets](https://interactivebrokers.github.io/cpwebapi/websockets)）。简单对照：

| 维度 | REST snapshot（`/iserver/marketdata/snapshot`） | WebSocket `smd+{conid}` |
| --- | --- | --- |
| 模式 | 拉取式（pull） | 订阅式（push） |
| 延迟 | 取决于两次调用间隔 | 实时 |
| 适合场景 | 一次性查价、cron 任务 | 实时盘面、自定义 UI |

建议：低频策略用 REST，高频 / UI 用 WebSocket，两者共用同一份订阅数据。

## 8. 行情接口限频速查

| 端点 | 限频 |
| --- | --- |
| `/iserver/marketdata/snapshot` | **10 req/s** |
| `/iserver/marketdata/history` | **5 concurrent requests** |
| `/iserver/marketdata/{conid}/unsubscribe` | 默认 |
| `/iserver/marketdata/unsubscribeall` | 默认 |

## 与 TWS API 的差异

| 维度 | Client Portal API Market Data | TWS API Market Data |
| --- | --- | --- |
| 实时订阅 | REST 多次轮询 / WebSocket | `reqMktData()` 推送 |
| 历史 K 线 | `/iserver/marketdata/history` | `reqHistoricalData()` |
| 字段体系 | 数字编号（`31`, `84`, `88` …） | 字符串 tag（`"31"`, `"BID"`, `"ASK"` …） |
| 取消订阅 | 显式 `/unsubscribe` 或 `/unsubscribeall` | `cancelMktData()` / `cancelHistoricalData()` |
| 计费模型 | 用户级订阅，NBI/UTP 等单独计费 | 同左 |
| 多账户 | 单 session → 单订阅 | 通过 `reqMktData(..., genericTickList, snapshotForOptions)` 灵活订阅 |

> **常见迁移坑**：
> 1. 字段编号体系不同——TWS 里写 `"BID"`、`"ASK"`，这里要换成 `85`、`88`。
> 2. TWS 的"事件驱动推送"在这里要改成"轮询 snapshot"或"迁到 WebSocket"。
> 3. 历史 K 线 `bar`/`period` 含义略有不同——TWS 的 `durationStr` + `barSizeSetting` 要拆成这里的 `period` + `bar`。

## 常见错误码

| HTTP Code | 含义 | 建议处理 |
| --- | --- | --- |
| `400 Bad Request` | `period`/`bar` 不匹配、`conid` 不合法 | 调整参数 |
| `401 Unauthorized` | session 失效 | 重新 `/iserver/reauthenticate` |
| `403 Forbidden` | 该用户未订阅对应行情商（NBI / UTP 等） | 登录 Client Portal 在账户管理中订阅 |
| `404 Not Found` | `conid` 不存在或过期 | 重新 `/trsv/secdef` 查最新 conid |
| `429 Too Many Requests` | 触发限频（snapshot 10 req/s，history 5 concurrent） | sleep 后重试 |
| `503 Service Unavailable` | 后端正在维护 | 等待 + 重试 |

## 下一节

- [Client Portal API 章节索引](./README.md)

---

## 参考链接

- [Endpoints Explorer → Market Data](https://interactivebrokers.github.io/cpwebapi/endpoints)
- [Use Cases → Snapshot Requests](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [Use Cases → Option Chains](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [Use Cases → Multiple usernames](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [Websockets](https://interactivebrokers.github.io/cpwebapi/websockets)
- [持仓](./portfolio.md)
- [订单](./orders.md)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 |