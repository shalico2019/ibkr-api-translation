# Client Portal 平台

> Interactive Brokers **Client Portal** 平台文档集合

Client Portal（盈透网页端）是 IBKR 的官方网页交易平台，无需下载安装，浏览器打开即用。本页是 Client Portal 平台所有文档的**统一入口**。

## 两类内容

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **Client Portal 使用手册**

    ---

    占位中 · 适合**交易员**

    即将上线：网页端的账户管理、订单、行情、研究、报表等所有 UI 操作指南

    !!! info "状态"
        源站 [ibkrguides.com/clientportal](https://www.ibkrguides.com/clientportal/home.htm) 已有完整英文文档，待社区贡献者启动翻译

-   :material-cloud:{ .lg .middle } **Client Portal REST API**

    ---

    **7** 章已上线 · 适合**程序员** · 覆盖度 **100%** :material-check-all:

    Session / 认证 / 账户 / 订单 / 持仓 / 行情 全部翻译

    [:octicons-arrow-right-24: 进入 API 文档](client-portal-api/README.md)

</div>

## 选哪个？

| 我是 | 我要看 | 入口 |
| --- | --- | --- |
| 想用网页端下单、看账户 | Client Portal 使用手册（即将上线） | [:octicons-arrow-right-24: 使用手册](client-portal-manual/README.md) |
| 想用 HTTP / REST 风格接 IBKR | Client Portal API | [:octicons-arrow-right-24: API 文档](client-portal-api/README.md) |
| 想用 TWS + 移动 App + 网页端 | 多端协同 | 看 [TWS 平台](tws-platform.md) 和 IBKR Mobile |

## 关于 Client Portal

- **Client Portal** = 浏览器访问的网页交易终端
- 不需要安装客户端，跨平台（Windows / macOS / Linux / 移动浏览器）
- 支持大部分 TWS 的交易功能，但不是 100% 等价（部分高级订单类型仅 TWS 有）
- REST API 走 OAuth 1.0a 认证，本地起一个 Gateway（IB Gateway 或 TWS 内部）暴露 localhost:5000 给 API 调用

## 平台与文档的对应关系

```
Client Portal 平台
├── 📖 使用手册（给交易员看 UI 操作）    → docs/client-portal-manual/（占位）
└── 🔌 REST API（给程序员看编程接口）    → docs/client-portal-api/（7/7 ✅）
```

## 翻译来源与版权

- 原文：[ibkrguides.com/clientportal](https://www.ibkrguides.com/clientportal/home.htm)（使用手册）
- 原文：[interactivebrokers.github.io/cpwebapi](https://interactivebrokers.github.io/cpwebapi/)（API 文档，注：IBKR 已标注 deprecated，新接口见 IBKR Campus）
- 版权：Interactive Brokers LLC，本项目译文以 MIT 协议发布
