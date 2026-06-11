# 盈透证券 API 中文文档

![](https://img.shields.io/badge/license-MIT-blue.svg)
![](https://img.shields.io/badge/status-active-success.svg)
![](https://img.shields.io/github/last-commit/shalico2019/ibkr-api-translation)
![](https://img.shields.io/github/deployments/shalico2019/ibkr-api-translation/github-pages?label=docs)

> Interactive Brokers 全平台操作指南中文集合：TWS API + Client Portal API + TWS 使用手册 + 实战策略

## ✨ 项目亮点

- 📚 **完整翻译** TWS API 14 章节 + Client Portal API 7 章节 + TWS 使用手册 25 章节
- 🖥️ **覆盖交易员** TWS 使用手册 P0+P1 全章节（入门、登录、配置、订单、图表、警报、扫描器、风险、新闻…）
- 🐍 **实战策略** 均线交叉 / 突破 / 网格，可直接运行
- 🚀 **自动部署** GitHub Pages + MkDocs Material，每次 push 自动上线
- 🔍 **可搜索** 内置全文搜索 + 代码高亮 + 深色模式
- 🌐 **在线访问** [https://shalico2019.github.io/ibkr-api-translation/](https://shalico2019.github.io/ibkr-api-translation/)

## 📖 内容覆盖

| 模块 | 状态 | 说明 |
|---|---|---|
| TWS API（程序员） | ✅ 14/14 | 连接、合约、订单、行情、历史数据、错误处理等 |
| Client Portal API（程序员） | ✅ 7/7 | REST 风格，OAuth 认证 |
| **TWS 使用手册**（交易员） | ✅ **25/25** | **P0 新手必读 10 章 + P1 进阶 15 章，完整覆盖 TWS 软件操作** |
| IBKR Desktop / Mobile 等 8 个平台 | 📋 占位中 | 未来逐步翻译 |
| 实战策略 | ✅ 3/3 | Python + ib_insync，附源码与说明 |

## 🚀 快速开始（在线阅读）

直接访问部署好的站点：

[https://shalico2019.github.io/ibkr-api-translation/](https://shalico2019.github.io/ibkr-api-translation/)

无需安装任何依赖，浏览器打开即用。左侧导航栏按 API 分类列出全部章节，顶部搜索框支持全文检索。

## 🧭 阅读路线建议

1. **TWS 新手交易员**：直接看 [TWS 使用手册 / 入门概览](https://shalico2019.github.io/ibkr-api-translation/tws-manual/getting-started/)，按 P0 顺序 1→10 读，建立对 TWS 整体界面的认识
2. **TWS 常用功能**：跳到 [TWS 使用手册 / P1 进阶](https://shalico2019.github.io/ibkr-api-translation/tws-manual/mosaic/)（Mosaic 界面 / 快捷键 / 订单预设 / 风险导航器 / 扫描器 / 新闻 / 颜色联动…）
3. **零基础 API 入门**：先看 [TWS API 介绍](https://shalico2019.github.io/ibkr-api-translation/tws-api/introduction/)，理解 IBKR 的 API 体系
4. **想用 Python 接 IB**：跳到 [TWS API / 连接 TWS](https://shalico2019.github.io/ibkr-api-translation/tws-api/connection/)，配合 `ib_insync` 实战
5. **做量化策略**：[实战策略目录](https://shalico2019.github.io/ibkr-api-translation/) 下提供了均线交叉、突破、网格三个可直接运行的示例
6. **REST 风格接入**：参考 [Client Portal API](https://shalico2019.github.io/ibkr-api-translation/client-portal-api/) 章节，使用 OAuth 走 HTTP 调用



如果你想在本地阅读或参与翻译校对：

```bash
git clone https://github.com/shalico2019/ibkr-api-translation
cd ibkr-api-translation
pip install -r requirements.txt
mkdocs serve
```

打开 [http://localhost:8000](http://localhost:8000) 即可在本地浏览站点，修改 `docs/` 下的文件后页面会自动热更新。

## 📂 仓库结构

```
.
├── README.md                # 你正在读的这份文件
├── LICENSE                  # MIT 许可证
├── mkdocs.yml               # MkDocs Material 配置
├── requirements.txt         # Python 依赖
├── docs/
│   ├── index.md             # 站点首页
│   ├── tws-api/             # TWS API 中文翻译（14 章节，给程序员用）
│   ├── client-portal-api/   # Client Portal API 中文翻译（7 章节，给程序员用）
│   ├── tws-manual/          # TWS 使用手册（25 章节 P0+P1，给交易员用）
│   └── {ibkrdesktop,ibkr-mobile,client-portal-manual,...}  # 8 个未来平台占位
└── .github/workflows/       # GitHub Actions：push 自动部署到 Pages
```

## 🤝 贡献

欢迎提 Issue / PR：

- 📝 翻译改进：术语润色、章节校对、补充例子
- 🐍 新的策略示例：用 `ib_insync` 或其他 IBKR SDK 写的实战策略
- 🐛 文档错误修正：错别字、链接失效、代码 bug
- 🌐 多语言版本：英文 / 繁体等其他语言的本地化

提交前请先读 [贡献指南](./CONTRIBUTING.md)（如果有），保持术语与现有翻译一致。

## 📜 许可证与免责声明

本仓库文档采用 [MIT License](./LICENSE) 开源。

- 英文原文版权归 Interactive Brokers 所有，本项目仅做翻译整理。
- 本翻译为社区作品，不构成任何投资建议。
- API 接口可能随时调整，使用前请以 IBKR 官方英文文档为准。

## ⭐ Star 趋势

如果这个项目帮你省下了啃英文文档的时间，欢迎点一个 ⭐ 让更多人看到。