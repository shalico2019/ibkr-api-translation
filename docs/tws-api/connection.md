# 连接 TWS（Establishing a Connection）

> 原文：[TWS API – Connectivity](https://interactivebrokers.github.io/tws-api/connection.html)
> 翻译：Mavis

API 客户端应用与 TWS 之间通过 **TCP socket** 建立连接。TWS 作为服务端接收来自 API 应用（客户端）的请求，并执行相应动作。整个流程的第一步，是让 API 客户端连接到 TWS 正在监听的 socket 端口。

- 同一台机器上可以运行 **多个 TWS 实例**，只要它们各自配置了不同的 API socket 端口号
- 每个 TWS 会话同时最多支持 **32 个不同的客户端应用**接入
- API 连接时指定的 **client ID** 用来区分不同的 API 客户端

---

## 建立 API 连接

创建好两个核心对象 `EWrapper` 和 `ESocketClient` 之后，就可以通过 `EClientSocket.eConnect` 与 TWS 建立连接：

=== "Python"

    ```python
    app.connect("127.0.0.1", 7497, clientId=0)
    ```

=== "Java"

    ```java
    m_client.eConnect("127.0.0.1", 7497, 2);
    ```

=== "C++"

    ```cpp
    bool bRes = m_pClient->eConnect(host, port, clientId, m_extraAuth);
    ```

=== "C#"

    ```csharp
    clientSocket.eConnect("127.0.0.1", 7497, 0);
    ```

=== "VB"

    ```vb
    socketClient.eConnect("127.0.0.1", 7497, 0)
    ```

### 连接底层发生了什么

`eConnect` 首先让操作系统在指定的 IP 地址和 socket 端口上建立 TCP 套接字。如果 socket 打不开，**操作系统**（不是 TWS）会返回错误，API 客户端会在 `EWrapper.error` 回调里收到 **错误码 502**。注意：这条错误不是 TWS 产生的，所以 TWS 的日志文件里看不到。

错误 502 最常见的原因：

- TWS 没启用 API
- TWS 在监听别的端口
- 跨网络连接时被防火墙/杀毒软件拦截
- TWS 的 "Trusted IPs" 里没有把你的路由器 IP 加进去

socket 打开后，双方会进行 **初始握手**，协商 TWS 和 API 各自支持的最高版本号。这个步骤很关键——API 消息在不同版本下字段和长度都不一样，必须靠这个版本号来正确解析收到的消息。

**因此，`EReader` 对象必须等到连接建立之后才能创建**。连接阶段协商出的"公共版本号"会被 `EReader` 线程用来解析后续消息。

握手完成后，TWS 会回传一些与当前登录用户相关的信息：

1. 当前 TWS 会话可访问的 **账户编号**
2. 下一个有效的 **order ID**
3. 连接建立时间

默认模式（推荐）下 `AsyncEConnect` 设为 `false`，握手在 socket 建立后立即完成，TWS 会立即把这些信息回传给 API 客户端。

!!! warning "重要"
    **`nextValidID` 回调** 通常被用来标识连接真正完成。在此之前发送到 TWS 的请求**有可能会被丢弃**。

### 另一种已废弃的连接方式

历史上还有一种特殊模式：`AsyncEConnect = true`，`startAPI` 只在 `connectAck()` 中调用。**所有 IB 官方示例代码用的都是 `AsyncEConnect = false`，不建议使用旧模式。**

---

## EReader 线程

API 程序通常至少有两个线程：

- **发送线程**：向 TWS 发消息
- **读取线程**：从 socket 读消息（`EReader` 类），把消息塞进队列

消息入队后会触发一个**通知标志**，告诉其他线程"有消息要处理了"。

- **两线程设计**：消息队列也由发送线程处理（Python 的 `Program.py`、C++ 的 `TestCppClient` 是这种）
- **三线程设计**：多开一个线程专门处理消息队列（其他语言的 `Testbed` 示例是这种）
- **Python 异步设计**：可以用 `asyncio` 让代码看起来更"顺序"

### 创建 EReader

=== "C#"

    ```csharp
    // Create a reader to consume messages from the TWS. The EReader will consume
    // the incoming messages and put them in a queue
    var reader = new EReader(clientSocket, readerSignal);
    reader.Start();
    // Once the messages are in the queue, an additional thread can be created to fetch them
    new Thread(() => {
        while (clientSocket.IsConnected()) {
            readerSignal.waitForSignal();
            reader.processMsgs();
        }
    }) { IsBackground = true }.Start();
    ```

=== "Java"

    ```java
    final EReader reader = new EReader(m_client, m_signal);
    reader.start();
    // An additional thread is created in this program design to empty the messaging queue
    new Thread(() -> {
        while (m_client.isConnected()) {
            m_signal.waitForSignal();
            try {
                reader.processMsgs();
            } catch (Exception e) {
                System.out.println("Exception: " + e.getMessage());
            }
        }
    }).start();
    ```

=== "C++"

    ```cpp
    m_pReader = std::unique_ptr<EReader>(new EReader(m_pClient, &m_osSignal));
    m_pReader->start();
    ```

=== "Python"

    ```python
    # Python IB API 的 EReader 由 Client::connect() 自动启动，你不需要手动写
    self.reader = reader.EReader(self.conn, self.msg_queue)
    self.reader.start()   # start thread

    # 你只需要在主线程调用 run() 进入消息循环：
    app.run()
    ```

### 消息通知机制（EReaderSignal）

`EReader` 线程把消息塞进队列后，会通过 `EReaderSignal` 通知其他线程"有消息可以处理了"。在 C++/C#/Java API 里，这个信号对象由 `EWrapper` 实现类自己创建；在 Python API 里，`Queue` 类自动处理这件事。

---

## 连接完成后的回调

连接完成后，API 程序会立即收到若干回调：

- `EWrapper.nextValidId` —— 连接真正就绪的标志
- `EWrapper.managedAccounts` —— 当前 TWS 会话下的账户列表

**如果用的是 TWS（不是 IB Gateway）且网络通畅**，还会立即收到 `EWrapper.error` 的几条回调：

| errorId | errorCode | errorMsg |
|---------|-----------|----------|
| -1 | 2104 | Market Data Server is ok |
| -1 | 2106 | HMDS data farm is OK |

!!! note "容易踩的坑"
    `errorId = -1` 的 error 回调**不代表真的出错**，只是通知你"市场数据服务器连上了"。

而 **IB Gateway** 默认不会主动连市场数据服务器——只有 API 客户端发起请求时才会去连。所以 IB Gateway 的连接指示器在请求发出前会显示黄色（inactive），收到请求后才变绿（active）。

**最佳实践**：发出请求后，**务必**等收到对应回调再继续，不要想当然认为"网络没问题请求就成功了"。

---

## 在 TWS 中确认 API 连接

出于安全考虑，**默认情况下 TWS 不会自动接受 API 连接请求**。每次连接尝试都会弹出一个对话框，需要用户在 TWS 界面里手动点确认。

!!! tip "跳过确认弹窗"
    把客户端的 IP 加进 TWS 的 "Trusted IPs" 白名单，TWS 就会自动放行，不再弹窗。这在跑自动化程序时几乎是必做的配置。

!!! danger "重要时序"
    **必须等连接完全建立后**才能向 TWS 发请求，否则 TWS 会主动断开连接。常见的等待信号是 `nextValidId` 或 `managedAccounts` 回调。
    在某些情况下（IB Gateway / TWS 连服务器偶发延迟），`nextValidId` 后立刻发的请求也**可能被丢弃**——如果没收到预期回调，就不要假设连接一切正常，该重发的要重发。

---

## Socket 连接异常处理

如果 TWS 与 API 客户端之间的 socket 出问题（比如 TWS 突然关闭），`EReader` 线程在读取 socket 时会触发异常。**使用了已被占用的 client ID** 去连接也会触发这个异常。

不同语言对 socket EOF 的处理略有差异：

| 语言 | 处理方式 |
|------|----------|
| Java | 捕获后通过 `EWrapper.error` 上报，errorCode = 507（"Bad Message"） |
| C# | 捕获后通过 `EWrapper.error` 上报，errorCode = -1 |
| Python | 由 API 内部处理 |

⚠️ **`EWrapper.connectionClosed` 和 `EClient.IsConnected` 不会被 API 自动调用**，你需要在客户端层面显式处理这些状态变化。

!!! info "版本说明"
    上述行为在 **API 版本 973.04** 起有调整，详细变更见 IBKR 官方 release notes。

---

## 实战示例：用 `ib_insync` 一键连接

对大多数量化场景，第三方库 `ib_insync` 能让你跳过手写 EReader / 回调样板：

```python
from ib_insync import IB, Stock

ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)  # TWS 模拟账户默认端口

# 连接后所有回调都是异步的，可以直接 await
account = ib.managedAccounts()[0]
print(f"已连接账户：{account}")

# 拿一个 AAPL 合约试试水
aapl = Stock('AAPL', 'SMART', 'USD')
details = ib.reqContractDetails(aapl)
print(f"AAPL 合约详情：{details[0].contract}")

ib.disconnect()
```

`ib_insync` 内部帮你封装好了：

- 双线程 + asyncio 消息循环
- 自动重连（`ib.connect(timeout=...)` 可设重试）
- 把回调风格 API 包装成更顺手的 `await` 风格

---

## 下一步

连接搞定之后，下一章会讲怎么**定义你要交易的合约**（Contract 对象）：

👉 [金融工具（合约）](contracts.md)