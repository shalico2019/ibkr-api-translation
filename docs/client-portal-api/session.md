# 会话管理（Session）

> **英文原文**：[Client Portal API Documentation / Session endpoints](https://interactivebrokers.github.io/cpwebapi/endpoints)（`Session` 分组）+ [Quickstart](https://interactivebrokers.github.io/cpwebapi/quickstart) 中的"启动并维持会话"
> **翻译版本**：v1
> **译者**：@shalico2019

## 概述

Client Portal API 中所有"受保护"的接口（下单、查账户、查行情等）都要求当前**会话（brokerage session）**已经登录并通过 2FA 验证。Session 这一组接口的职责，就是：

1. **告诉你当前会话是否有效**——`/iserver/auth/status`
2. **保持会话不掉线**——`/tickle` 每 1 分钟调用一次
3. **重新登录或踢掉其他会话**——`/iserver/reauthenticate`
4. **校验 SSO 凭据**——`/sso/validate`
5. **退出登录**——`/logout`

Session 与"鉴权 / 2FA"密切相关，但二者关注点不同：

- **[认证（Authentication）](./authentication.md)** 关心"如何登进来"——Gateway、SSL、2FA 设备、能否自动化。
- **Session（本节）** 关心"登进来之后如何维持心跳、切换、退出"。

下文会逐一介绍上述 5 个端点，并给出 `requests` 调用示例。

## 1. 启动 Gateway：登录一次，session 长期有效

在调用任何 `/iserver/...` 接口之前，先要启动本地的 Client Portal API Gateway：

=== "macOS / Linux"

    ```bash
    cd ~/clientportal.gw
    bin/run.sh root/conf.yaml
    ```

=== "Windows"

    ```bat
    cd C:\Users\Example\Desktop\Cp Gateway
    bin\run.bat root\conf.yaml
    ```

启动后浏览器访问 <https://localhost:5000>，输入用户名/密码并完成 2FA，看到 "Client login succeeds" 即代表 session 已建立。**之后只要进程不退出、24 小时内有过心跳，session 就一直有效**，你的脚本就能反复调用下面的 REST 接口。

> Gateway 默认监听 `5000` 端口，可通过 `root/conf.yaml` 中的 `listenPort` 字段修改。

## 2. `/iserver/auth/status` — 查询认证状态

**方法**：`POST`  
**作用**：判断当前会话是否**已认证**（authenticated）、是否**已连接**（connected）、是否**被抢占**（competing）。

请求示例：

```python
import requests

BASE = "https://localhost:5000/v1/api"
# 默认情况下 IBKR Gateway 使用自签证书，需要关闭验证
requests.packages.urllib3.disable_warnings()

resp = requests.post(f"{BASE}/iserver/auth/status", verify=False, timeout=5)
resp.raise_for_status()
print(resp.json())
```

典型响应（已认证）：

```json
{
  "authenticated": true,
  "competing": false,
  "connected": true,
  "message": "",
  "MAC": "AA:BB:CC:DD:EE:FF",
  "serverInfo": {
    "serverName": "server-name",
    "serverVersion": "server-version"
  },
  "fail": ""
}
```

字段含义：

| 字段 | 含义 |
| --- | --- |
| `authenticated` | `true` 表示已通过用户名/密码+2FA 鉴权；`false` 表示连接但未登录 |
| `connected` | 与 IBKR 后端的连接是否活着 |
| `competing` | 是否被另一处登录（TWS/Mobile/Client Portal）挤掉 |
| `MAC` | 当前登录机器的 MAC 地址，便于排错 |
| `serverInfo` | Gateway 后端版本信息 |

> **常见错误码**：
>
> - `401 Unauthorized` —— session 已过期或被踢，需重新登录或 `/iserver/reauthenticate`。
> - `503 Service Unavailable` —— Gateway 正在启动或已崩溃，等几秒再试。

## 3. `/tickle` — 保持会话（心跳）

**方法**：`POST`  
**作用**：让 Gateway 与 IBKR 后端保持通信，避免 5 分钟无活动就被服务器强制断线。

```python
import requests, time

BASE = "https://localhost:5000/v1/api"

while True:
    r = requests.post(f"{BASE}/tickle", verify=False, timeout=5)
    r.raise_for_status()
    time.sleep(60)  # 官方建议每 ~1 分钟一次
```

> **官方建议**：调用频率约每 **1 分钟 1 次**，最多每 5 分钟 1 次。频率超过 **`/tickle` 限频（1 req/sec）** 会被 IP 关进 10 分钟"惩罚箱"，反复违规会被永久封禁。

如果 session 已经超时但还连着，`/iserver/auth/status` 会返回 `"connected": true, "authenticated": false`——此时直接调 `/iserver/reauthenticate` 即可恢复。

## 4. `/iserver/reauthenticate` — 重新认证 / 踢掉其他会话

**方法**：`POST`  
**作用**：在 session 已连但未认证时尝试重新拉起浏览器登录页；如果带 `force=true` 会先把其他设备挤下线再弹登录。

```python
import requests
BASE = "https://localhost:5000/v1/api"

# 普通重认证
r = requests.post(f"{BASE}/iserver/reauthenticate", verify=False, timeout=5)
print(r.status_code, r.json())

# 强制踢掉其他竞争会话
r = requests.post(f"{BASE}/iserver/reauthenticate?force=true", verify=False, timeout=5)
print(r.status_code, r.json())
```

> **注意**：IBKR 规定**同一个用户名在任何时刻只能有一个 brokerage session**。如果你在另一台机器登录了 TWS 或 Client Portal，本地 Gateway 的 session 会立即失效——这是 `competing=true` 的常见来源。

## 5. `/sso/validate` — 校验 SSO 凭据

**方法**：`GET`  
**作用**：在 OAuth 场景下校验当前 SSO 凭据是否仍然有效；官方推荐每 **1 分钟 1 次** 作为轻量心跳（比 `/tickle` 更省）。

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.get(f"{BASE}/sso/validate", verify=False, timeout=5)
print(r.status_code, r.text)
```

> `/sso/validate` 的限频是 **1 req/min**——务必不要放进每秒钟的轮询循环。

## 6. `/logout` — 退出登录

**方法**：`POST`  
**作用**：结束当前 session。调用后该 Gateway 不再能访问任何受保护端点，直到重新登录。

```python
import requests
BASE = "https://localhost:5000/v1/api"

r = requests.post(f"{BASE}/logout", verify=False, timeout=5)
print(r.status_code, r.text)
```

> 退出后 **Gateway 进程并不退出**，只是把 brokerage session 作废；如果你还想继续使用，需要重新走浏览器登录。

## Session 的生命周期（决策表）

| `connected` | `authenticated` | `competing` | 建议动作 |
| --- | --- | --- | --- |
| `true` | `true` | `false` | 正常调用业务接口，配合 `/tickle` 保活 |
| `true` | `false` | `false` | session 已超时 → `POST /iserver/reauthenticate` |
| `true` | `false` | `true` | 被 TWS/Mobile/CP 挤掉 → `?force=true` 抢回 |
| `false` | `false` | — | Gateway 与后端断开 → 检查网络或重启 Gateway |

## 与 TWS API 的差异

| 维度 | Client Portal API Session | TWS API 连接 |
| --- | --- | --- |
| 心跳机制 | 应用层显式 `/tickle` 每 1 分钟 | TCP keepalive + `reqCurrentTime()` 业务心跳 |
| 并发限制 | **单 session / 单账户** | 可同时连接多个 client / 多个账户 |
| 鉴权方式 | 浏览器 + 2FA（不可自动化） | 用户名/密码在 TWS 中开启 API 即可 |
| 失效策略 | 24 小时强制重登 + 5 分钟无活动断线 | TWS 一直在线则一直保持 |

## 最小可用代码片段

把上面的端点拼成一段"启动→心跳→异常重连"的循环，方便直接复用到你的项目：

```python
import time
import requests

BASE = "https://localhost:5000/v1/api"
requests.packages.urllib3.disable_warnings()

def is_authed() -> bool:
    s = requests.post(f"{BASE}/iserver/auth/status", verify=False, timeout=5).json()
    return bool(s.get("authenticated")) and not s.get("competing")

def keepalive_loop():
    while True:
        try:
            if not is_authed():
                requests.post(f"{BASE}/iserver/reauthenticate", verify=False, timeout=5)
            requests.post(f"{BASE}/tickle", verify=False, timeout=5)
        except requests.RequestException as e:
            print("session error:", e)
        time.sleep(60)

if __name__ == "__main__":
    keepalive_loop()
```

## 常见错误码

| HTTP Code | 含义 | 建议处理 |
| --- | --- | --- |
| `400 Bad Request` | 请求体 JSON 含 `\r\n` 或非法字符 | 清理换行后重试 |
| `401 Unauthorized` | session 已失效 | 重新 `/iserver/reauthenticate` |
| `404 Not Found` | 路径拼错或 Gateway 旧版本不支持 | 参考 [Endpoints](https://interactivebrokers.github.io/cpwebapi/endpoints) |
| `429 Too Many Requests` | 触发限频（`/tickle` 限 1 req/sec，`/sso/validate` 限 1 req/min） | 等待 10 分钟，自动解封 |
| `500` / `503` | Gateway 内部错误 | 重启 Gateway；连续失败联系 IBKR 支持 |

## 下一节

- [认证（Authentication）](./authentication.md) — 了解 SSL、2FA、自动化登录的限制。

---

## 参考链接

- [Quickstart](https://interactivebrokers.github.io/cpwebapi/quickstart)
- [Endpoints Explorer → Session](https://interactivebrokers.github.io/cpwebapi/endpoints)
- [Use Cases → Competing sessions / Session duration](https://interactivebrokers.github.io/cpwebapi/use-cases)
- [认证](./authentication.md)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 |