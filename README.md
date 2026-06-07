# 盈透证券（Interactive Brokers）API 中文翻译

> 系统化翻译 Interactive Brokers 官方 API 文档，让中文用户无障碍使用 IBKR 量化交易接口。

## 项目背景

盈透证券（Interactive Brokers, 业内简称 IB / IBKR）提供多套 API 接口，但官方文档全英文，且分散在不同站点。中文社区目前的内容多为零散的博客笔记，缺少系统性的中文文档。

本项目旨在：

- 📚 **系统翻译** IBKR 各套 API 的官方文档
- 🇨🇳 **统一中文术语**，避免同一概念多种译法
- 🧭 **整理索引**，让用户能快速找到需要的接口
- 🛠️ **附带示例**，必要时补充中文化的代码示例

## 翻译范围

| API | 文档来源 | 状态 |
| --- | --- | --- |
| TWS API | [interactivebrokers.github.io/tws-api](https://interactivebrokers.github.io/tws-api/) | 🚧 进行中 |
| Client Portal API | [interactivebrokers.com/api](https://www.interactivebrokers.com/api/doc.html) | 📝 待开始 |
| FIX CTCI | IBKR FIX 接入规范 | 📝 待开始 |

> 状态图例：🚧 进行中 · 📝 待开始 · ✅ 已完成

## 目录结构

```
.
├── README.md
├── LICENSE
├── docs/
│   ├── tws-api/             # TWS API 文档翻译
│   │   ├── README.md
│   │   ├── introduction.md
│   │   ├── connection.md
│   │   └── ...
│   └── client-portal-api/   # Client Portal API 文档翻译
│       └── README.md
├── glossary.md              # 术语表（统一译法）
└── CONTRIBUTING.md          # 贡献指南
```

## 翻译规范

1. **专有名词保留英文**：TWS、IBKR、Order、Contract 等 API 核心概念首次出现时附中文译名，后续可只用英文。
2. **代码与命令不翻译**：代码块、命令、参数名、字段名一律保留英文。
3. **术语以 `glossary.md` 为准**：翻译前先查表，避免一词多译。
4. **保留原文链接**：每个翻译章节末尾注明对应的英文原文链接，方便核对。

## 贡献方式

欢迎贡献！具体流程见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

简单说：

1. Fork 本仓库
2. 从 `main` 切分支
3. 修改 / 翻译 / 校对
4. 提 PR

## 进度看板

- [ ] TWS API - Introduction
- [ ] TWS API - Connecting to TWS
- [ ] TWS API - Contracts
- [ ] TWS API - Orders
- [ ] TWS API - Market Data
- [ ] TWS API - Account & Portfolio
- [ ] TWS API - Error Handling
- [ ] Client Portal API 整体翻译

## 版权与免责声明

- 英文原文版权归 Interactive Brokers 所有，本项目仅做翻译整理。
- 本翻译为社区作品，不构成任何投资建议。
- API 接口可能随时调整，使用前请以 IBKR 官方英文文档为准。

## License

本项目文档采用 [MIT License](./LICENSE) 开源。

---

> 如果你也在做 IBKR 量化，欢迎 Star / Fork / PR 一起完善 🤝
