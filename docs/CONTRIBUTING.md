# 贡献指南

感谢你愿意为盈透证券 API 中文翻译项目贡献力量 🤝

## 工作流程

1. **Fork** 本仓库
2. 从 `main` 切分支，分支名建议：`feat/tws-api-orders`、`fix/glossary` 等
3. 翻译 / 校对 / 修正
4. 提交 PR，描述清楚改了什么

## 翻译规范

### 1. 专有名词

- 首次出现时：「中文译名（English Original）」，如「交易工作站（Trader Workstation, TWS）」
- 后续出现可只用英文或只用中文，保持上下文一致
- 译法以 [glossary.md](./glossary.md) 为准；新增术语请先在 glossary.md 里登记

### 2. 文档结构

- 每个英文页面翻译为一个对应的中文 `.md` 文件
- 文件名沿用英文原页面名（小写、连字符分隔），如 `order_conditions.md`
- 文件开头注明：

  ```markdown
  > 英文原文：[link to original]
  > 翻译版本：v1
  > 译者：@github-username
  ```

### 3. 格式

- 使用 GFM（GitHub Flavored Markdown）
- 代码块必须用 ``` 指定语言
- 表格、列表、引用都用标准 Markdown
- 章节层级最多到 `####`（四级标题）

### 4. 代码与命令

代码块、命令行、参数名、字段名、API 函数名一律**不翻译**，保持英文。

### 5. 链接

- 内部链接使用相对路径：`./connection.md`
- 外部链接保留原文 URL
- 每个翻译文件末尾列出参考链接

## 校对 PR

任何 PR 都需要至少 1 位其他贡献者 review 通过后再合并。

校对时关注：

- [ ] 术语是否与 glossary.md 一致
- [ ] 技术内容是否准确（建议对照英文原文）
- [ ] 格式是否符合规范
- [ ] 是否在文件头注明翻译版本与译者

## 提 Issue

- 翻译错误 / 术语不统一 → 提 Issue，标注 `translation` 标签
- 文档缺漏 / 想认领翻译任务 → 提 Issue，标注 `todo` 标签
- 讨论翻译规范 → 提 Issue，标注 `discussion` 标签

## 联系方式

- 直接在 GitHub 上提 Issue / PR 即可
