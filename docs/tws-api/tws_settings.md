# TWS 设置（TWS Settings）

> 原文：[TWS API – TWS Settings](https://ibkr.com/campus/ibkr-api-page/twsapi-doc/#tws-settings)
> 翻译：Mavis

要在 TWS 启用 API 连接，需要进入 **`File → Global Configuration → API → Settings`**。本章按配置项分组讲每个开关的作用。

!!! tip "Graphical Configuration 路径"
    `File → Global Configuration → API → Settings`

---

## 核心设置项

### 1. 启用 API 客户端连接

| 项 | 推荐设置 | 说明 |
|----|----------|------|
| **Enable ActiveX and Socket Clients** | ✅ 勾选 | 总开关，不勾任何 API 客户端都连不上 |
| **Socket port** | `7497`（模拟）/ `7496`（实盘） | API 客户端连接的端口 |
| **Allow connections from localhost** | ✅ 勾选 | 本机连接 |
| **Trusted IPs** | `127.0.0.1` 等 | 加白名单的 IP 不会被 TWS 弹窗确认 |

!!! danger "端口选择"
    - **TWS 模拟账户**：`7497`
    - **TWS 实盘账户**：`7496`
    - **IB Gateway 模拟**：`4002`
    - **IB Gateway 实盘**：`4001`

### 2. 客户端 ID

每个 API 客户端必须使用**唯一的 client ID**（0-32）。重复使用同一个 ID 会触发 `507 Bad Message` 错误。

### 3. Master Client ID

在 TWS 设置里指定**一个** client ID 为 **Master**：

- Master Client 会收到**所有客户端**的下单状态和成交回调
- 适合做"总控客户端"（如统一的风控、对账系统）

### 4. Order ID 重置

仅当**没有任何活跃 API 订单**时，才能重置 nextValidId 序列。重置方法：

> `File → Global Configuration → API → Settings → Reset API Order ID Sequence`

---

## 高级设置项

### Read-Only API

把 API 客户端设为只读模式——可以**接收**数据，但**不能下单**。

适用场景：

- 行情接收器
- 账户监控面板
- 测试环境

### Compatibility Mode

**Send ISLAND for US Stocks trading on NASDAQ**：保持老代码兼容，新代码建议用 `NASDAQ`。

### Bypass US Stocks market data in shares warning

兼容老的"按 round lot 报价"的 API 客户端。新代码建议用"按股数报价"的新格式。

### Show advanced order reject in UI always

勾上后，被拒的高级订单**只在 TWS UI 显示**，不会推送到 API（防止 API 客户端被大量拒单信息淹没）。

---

## 日志和诊断

| 位置 | 内容 |
|------|------|
| TWS 日志窗口 | 所有 API 交互（请求、响应、错误） |
| `C:\Jts\` 或 `~/Jts/` | TWS 配置文件、日志存档 |
| `errorCode` | API 收到的错误码 |

!!! tip "诊断 tips"
    1. **连不上？** 先看 TWS 日志窗口最下方的错误
    2. **错误码 502？** 检查 `Enable ActiveX and Socket Clients` 是否勾选、端口对不对
    3. **错误码 504？** 客户端 IP 不在 Trusted IPs
    4. **下单没反应？** 检查 client ID 是不是 0（被 UI 占用）
    5. **报错 unclear？** 把 `advancedOrderRejectJson` 打印出来

---

## 实战示例：把 TWS 配置成"自动放行本机 API"

1. 打开 TWS → `File → Global Configuration`
2. 左栏选 `API → Settings`
3. 勾选 **`Enable ActiveX and Socket Clients`**
4. 端口保持 `7497`（模拟）或改成 `7496`（实盘）
5. 勾选 **`Allow connections from localhost`**
6. 在 **`Trusted IPs`** 区域点 `Add`，填 `127.0.0.1`
7. 点 `OK` 保存

之后用 `ib_insync` 就能直接连：

```python
from ib_insync import IB
ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)
```

---

## 下一步

- [连接 TWS](connection.md) —— 客户端侧连接流程
- [错误处理](error_handling.md) —— 配置出错的常见报错