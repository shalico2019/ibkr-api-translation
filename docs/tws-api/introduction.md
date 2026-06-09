# 介绍（Introduction）

> **英文原文**：[IBKR Campus - TWS API Documentation / Introduction](https://www.interactivebrokers.com/campus/ibkr-api-page/twsapi-doc/)
> **翻译版本**：v1（基于 TWS API 9.72+ 文档）
> **译者**：@shalico2019

## 概述

TWS API 是一套基于 TCP Socket 协议的接口，用于连接盈透证券的 Trader Workstation（交易工作站，下文简称 TWS）或 IB Gateway（IB 网关，下文简称 IBGW）。API 的作用是以编程方式自动向 IBKR 收发数据。

IBKR 官方提供以下语言的客户端实现：

- **Python**
- **Java**
- **C++**
- **C#**（仅 Windows）
- **VisualBasic**（仅 Windows）

## 工作原理

TWS API 是一种**消息协议**。任何实现了 TWS API 的库——无论是 IB 官方还是第三方——本质上都是通过 TCP Socket 连接与 IB 平台（TWS 或 IBGW）进行消息收发的工具。

因此，只要你愿意实现底层的消息编解码器，理论上可以把它移植到任何编程语言。

> 简而言之：用其他语言编写的库，**发送和接收的数据格式必须与官方库完全一致**。所以你可以查阅官方库的文档，看到任何一次请求或响应包含什么内容、以什么形式组织，然后在自己的实现中复刻出来。

## 适用对象

我们的 TWS API 组件面向**有经验的专业开发者**，希望扩展 TWS 现有的功能。

在你使用 TWS API 之前，请确保完全理解以下基础概念：

- **面向对象编程（OOP）**
- 计算机科学其他基本概念

> ⚠️ **注意**：盈透证券**不提供**任何编程咨询服务。在联系 API 技术支持前，请务必先查阅我们的文档、示例程序和录播的网络研讨会（Recorded Webinars）。

## 如何使用本指南

本指南会大量引用官方 **Testbed** 示例项目（Java / VB / C# / C++ / Python），用来演示 TWS API 的各项功能。文档中的所有代码片段都从这些项目中摘录。

**强烈建议首次接触 TWS API 的用户**先熟悉这些示例项目，能帮你快速理解我们编程接口的基本概念。

Testbed 示例项目位于 TWS API 安装目录下的 `samples/` 文件夹中。

## 下一节

- [Notes & Limitations（注意事项与限制）](./notes_and_limitations.md)

---

## 参考链接

- [IBKR Campus - TWS API Documentation](https://www.interactivebrokers.com/campus/ibkr-api-page/twsapi-doc/)：英文原文
- [TWS API 旧版文档（已 deprecated）](https://interactivebrokers.github.io/tws-api/introduction.html)：旧版入口
- [Recorded Webinars](https://www.interactivebrokers.com/en/index.php?f=1350&t=recorded&p=1)：官方录播课

## 修订记录

| 版本 | 日期 | 变更 |
| --- | --- | --- |
| v1 | 2026-06-09 | 首次翻译（基于 IBKR Campus 新版文档） |
