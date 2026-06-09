# 错误处理（Error Handling）

> 原文：[TWS API – Error Codes](https://interactivebrokers.github.io/tws-api/tws_error_codes.html)
> 翻译：Mavis

TWS API 通过 `EWrapper.error` 回调推送所有错误。`error` 回调的常见形态：

```python
def error(self, reqId, errorCode, errorString, advancedOrderRejectJson=''):
    print(f"[reqId={reqId}] code={errorCode} msg={errorString}")
```

## 错误分类速查

| 类别 | errorCode 范围 | 含义 |
|------|----------------|------|
| **系统通知** | `2104`、`2106`、`2158` 等 | 不是真错误，只是通知连接成功 |
| **连接层错误** | `502`、`503`、`504`、`507` 等 | socket / 网络 / API 版本问题 |
| **下单层错误** | `103`、`104`、`110`、`111` 等 | 合约、订单、价格、数量问题 |
| **行情层错误** | `162`、`354`、`2157` 等 | 订阅、行情线路、合约定义问题 |
| **历史数据错误** | `162`、`165`、`366`、`386` 等 | 时间范围、订阅、合约问题 |
| **账户/资金错误** | `201`、`202`、`203`、`220` 等 | 保证金、现金、购买力不足 |
| **条件单错误** | `304`、`305` 等 | 条件单参数、过期等 |

---

## 常见错误码速查

| errorCode | 含义 | 处理建议 |
|-----------|------|----------|
| `-1` | 通知型（market data 连上等） | 无需处理 |
| `2104` | Market data farm connection OK | 通知 |
| `2106` | HMDS data farm connection OK | 通知 |
| `2158` | Sec-def data farm connection OK | 通知 |
| `502` | socket 打不开 | 检查 TWS 是否运行、API 是否启用、IP 是否在 trusted list |
| `503` | TWS 连接已满 | TWS 同时最多 32 个客户端 |
| `504` | 连接被 TWS 拒绝 | IP 不在 trusted list 或密码错 |
| `507` | Bad Message | socket 异常断开；检查 client ID 是否重复 |
| `103` | Duplicate order ID | order ID 重复，调用 `reqIds(-1)` 重拿 |
| `104` | Can't modify order | 订单已成交/已撤销 |
| `110` | Price out of range | 价格超出涨跌停或不合理 |
| `111` | Order rejected | 通用拒单，详见 errorString |
| `162` | Historical data request failed | 时间范围不对、订阅缺失 |
| `354` | Requested market data not subscribed | 没订阅该行情 |
| `201` | Order rejected - account blocked | 账户被冻结 |
| `202` | Order rejected - account invalid | 账户不存在 |
| `203` | Order rejected - account lacks permissions | 没该标的交易权限 |
| `304` | Order doesn't conform to minimum size | 数量不满足最小手数 |
| `386` | No market data during competing session | 竞价时段没行情 |

!!! tip "完整错误码表"
    完整列表见 IBKR 官方 [Error Codes](https://interactivebrokers.github.io/tws-api/tws_error_codes.html)（每季度更新，建议收藏到书签）。

---

## 实战示例：健壮的 error 处理

```python
import logging
from ib_insync import IB, Stock, MarketOrder

ib = IB()

def on_error(reqId, errorCode, errorString, advancedOrderRejectJson=''):
    # 1. 信息性通知：直接 log
    if errorCode in (-1, 2104, 2106, 2158):
        logging.info(f"[通知 {errorCode}] {errorString}")
        return

    # 2. 重复 order ID：自动恢复
    if errorCode == 103:
        logging.warning("order ID 重复，重新拿一个")
        ib.reqIds(-1)
        return

    # 3. 致命错误：抛出来
    logging.error(f"[reqId={reqId}] code={errorCode} msg={errorString}")

ib.errorEvent += on_error

# 现在下单
ib.connect('127.0.0.1', 7497, clientId=1)
aapl = Stock('AAPL', 'SMART', 'USD')
ib.qualifyContracts(aapl)

try:
    trade = ib.placeOrder(aapl, MarketOrder('BUY', 100))
    trade.waitUntilFilled(timeout=30)
except Exception as e:
    logging.error(f"下单失败：{e}")
finally:
    ib.disconnect()
```

---

## 下一步

- [连接 TWS](connection.md) —— 连接阶段的错误处理
- [TWS 设置](tws_settings.md) —— TWS 端的 API 设置