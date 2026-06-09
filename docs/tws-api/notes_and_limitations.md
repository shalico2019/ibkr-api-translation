# 注意事项与限制（Notes & Limitations）

> **英文原文**：[IBKR Campus - TWS API Documentation / Notes & Limitations](https://www.interactivebrokers.com/campus/ibkr-api-page/twsapi-doc/)
> **翻译版本**：v1
> **译者**：@shalico2019

## 平台支持

虽然盈透证券同时维护 TWS API 的 **Python、Java、C#、C++** 实现，但 **C# 和 Excel 系列的接口仅在 Windows 上可用**。因此，Linux 和 macOS 不支持这些功能。

## 系统要求

在使用 TWS API 之前，请确保满足以下条件：

- ✅ 已开通并入金的 **IBKR Pro** 账户
- ✅ 已安装当前 **Stable（稳定版）** 或 **Latest（最新版）** 的 TWS / IB Gateway
- ✅ 已下载当前 Stable 或 Latest 的 TWS API
- ✅ 掌握 **Testbed** 示例项目所用语言的编程基础

### 各语言最低支持版本

文档右侧栏展示了每种语言当前支持的最低版本。**请根据你使用的语言切换右侧 Tab 查看对应信息。**

#### Python

最低支持 **Python 3.11.0**。

#### Java

最低支持 **[Java 21](https://www.oracle.com/java/technologies/downloads/)**。

#### C++

最低支持 **C++ 14** 标准。

#### C#

C# 实现基于以下框架编译：

- .NET Core 3.1
- .NET Framework 4.8
- .NET Standard 2.0

## 双因素认证（2FA）

盈透证券在各类平台上提供广泛的 2FA 支持。**由于 TWS API 不支持账户管理功能，部分 2FA 方式不被支持**。当你尝试通过 API 系统认证时，请确保账户已启用受支持的 2FA 方式。

> ℹ️ 所有 IBKR 用户**必须**启用双因素认证。

### ✅ 支持的 2FA 方式

- **IB Key**（IBKR 官方 App 推送）
- **Handy Key**（智能手机应用）
- **SMS / 短信**
- **Digital Security Card+ (DSC+)**

### ❌ 不支持的 2FA 方式

- Security Code Card（亦称 Bingo Card）
- Temporary Security Code Card
- Online Code Card

## API 能力限制

我们的编程接口设计用于**自动执行用户在 TWS 中手动进行的部分操作**，例如：

- 下单
- 监控账户余额和持仓
- 查看金融工具的实时行情
- ……等等

API 内部**不包含任何业务逻辑**，仅用于保证消息交换的完整性。**大部分校验和检查都在 TWS 后端和我们的服务器上完成**。

因此，**强烈建议**你熟悉 TWS 本身的工作方式，这样能更好地理解我们的平台是如何运作的。**在把时间花到 API 调试上之前，先直接在 TWS 里实验一遍，往往能省下大量时间。**

> 💡 **记住**：**TWS 里没有的功能或操作，API 端也不会有！**

## C# 在 macOS 上的限制

TWS API 的 C# 源码**不包含在 Mac / Unix 发行包中**，因为 C# 实现依赖 **Dynamic Link Library（DLL）** 文件，而 DLL 仅在 Windows 平台上受支持。

## C++ DLL 与静态链接

TWS API 近期迁移到 Protobuf 之后，**C++ 开发者应优先使用静态链接（static linking）而不是 DLL**。

该建议基于 [Google Protobuf 官方文档](https://chromium.googlesource.com/external/github.com/google/protobuf/+/HEAD/cmake/README.md#dlls-vs_static-linking)。如需了解背后的原因，或关于在 Protobuf 中启用 DLL 的问题，请参阅该链接。

## 加拿大居民交易加拿大产品的限制

（此节包含合规要求，翻译时需谨慎对照原文。）

## 模拟交易（Paper Trading）

如果你已有真实账户并通过审批和入金，可以通过 **Account Management** 页面开通一个 **[模拟交易账户（Paper Trading Account）](https://www.interactivebrokers.com/en/software/am/am/manageaccount/papertradingaccount.htm)**，在真实市场环境下使用完整的交易功能进行模拟。

使用模拟账户的好处：

- 快速熟悉 TWS API 的使用
- 在不冒真金白银风险的前提下测试交易策略

> ⚠️ 模拟环境本身存在一些 [固有限制](https://www.interactivebrokers.com/en/software/am/am/manageaccount/paper_trading_limitations.htm)，与实盘行为可能略有差异。

## 下一节

- [TWS Settings（TWS 配置）](./tws_settings.md)

---

## 参考链接

- [IBKR Campus - TWS API Documentation](https://www.interactivebrokers.com/campus/ibkr-api-page/twsapi-doc/)：英文原文
- [Java 21 下载](https://www.oracle.com/java/technologies/downloads/)

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译 |
