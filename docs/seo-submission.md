# SEO 收录提交清单（不挂到 nav）

> 本文件**不**挂到 mkdocs nav，仅在仓库内保留，方便维护者手动到站长平台做收录提交。
> 部署站点访问者不会看到这个页面。

---

## 0. 部署后检查

部署完成（GitHub Pages 生效）后，先确认以下资源可访问：

- 站点首页：<https://shalico2019.github.io/ibkr-api-translation/>
- sitemap.xml：<https://shalico2019.github.io/ibkr-api-translation/sitemap.xml>
- sitemap.xml.gz：<https://shalico2019.github.io/ibkr-api-translation/sitemap.xml.gz>
- robots.txt：<https://shalico2019.github.io/ibkr-api-translation/robots.txt>

若任意一个 404，先排查 mkdocs build 输出和 GitHub Pages 部署日志。

---

## 1. Google Search Console 提交

### 1.1 添加资源

1. 打开 <https://search.google.com/search-console>
2. 右上角「添加资源」→ 选 **URL 前缀（URL Prefix）**
3. 填入：
   ```
   https://shalico2019.github.io/ibkr-api-translation/
   ```
4. 点「继续」

### 1.2 验证所有权（推荐：HTML 文件上传）

本项目用 **HTML 文件** 验证最省事：

1. Search Console 给出一个验证 HTML 文件，文件名形如 `google123abc456def.html`
2. **直接把该文件放到 `docs/` 根目录**（和 `index.md` 同级）
3. `git add` → `git commit` → `push`
4. 等 GitHub Actions 把 site 部署完（约 1–2 分钟）
5. 回到 Search Console 点「验证」即可

> 注意：每次清理 `docs/` 时不要误删验证文件。或者提交后在验证完前不跑 `mkdocs build --clean`，或者把验证文件加到 `.gitignore` 的反向清单。
> 实际上验证成功后 Google 会缓存所有权，验证文件可以保留在仓库里，也可以事后删除。

### 1.3 提交 sitemap

1. 左侧菜单 → **站点地图（Sitemaps）**
2. 在「添加新的站点地图」输入框填：
   ```
   sitemap.xml
   ```
3. 点「提交」
4. 状态会从「待处理」→「成功」，有时需等几分钟到几小时

也可以直接访问：
<https://search.google.com/search-console/sitemaps?resource_id=https%3A%2F%2Fshalico2019.github.io%2Fibkr-api-translation%2F>

### 1.4 请求编入索引（可选加速）

- 顶部搜索框直接输入首页 URL → 回车
- 点「请求编入索引」
- 同样可以为几个核心页面（如 `glossary/`、`tws-api/introduction/`）手动请求

---

## 2. 百度站长平台提交

### 2.1 添加站点

1. 打开 <https://ziyuan.baidu.com/>
2. 登录百度账号 → **站点管理** → **添加网站**
3. 选 **URL 前缀** 方式
4. 站点域名：
   ```
   https://shalico2019.github.io/ibkr-api-translation/
   ```
5. 站点领域：选「IT 互联网」或「金融财经」（按内容主导倾向）
6. 点「下一步」

### 2.2 验证所有权

百度常用验证方式：

- **HTML 标签验证**：把 `<meta name="baidu-site-verification" content="xxx" />` 加到 `mkdocs.yml` 的 `extra:` → `meta:` 块里，重建部署。
- **CNAME 验证**：在域名 DNS 添加 TXT 记录（GitHub Pages 子域一般不用这个）。
- **HTML 文件验证**：和 Google 同理，放到 `docs/` 根目录。

推荐用 **HTML 标签**方式，改动最小：

```yaml
extra:
  meta:
    - name: baidu-site-verification
      content: <从站长平台复制的 token>
```

部署后回到站长平台点「完成验证」。

### 2.3 提交 sitemap

1. 左侧菜单 → **普通收录** → **sitemap 提交**
2. 填入 sitemap 地址：
   ```
   https://shalico2019.github.io/ibkr-api-translation/sitemap.xml
   ```
3. 提交

### 2.4 主动推送（可选，加速收录）

百度提供 `POST /urls?site=...&token=...` 接口主动推送新增链接。
GitHub Actions 里可以加一步：每次 push 后调用一次推送接口，把本次新增 / 修改的 URL 推送给百度。

> ⚠️ 百度对 GitHub Pages 索引较慢，sitemap 提交后可能需要 1–4 周才有收录，属正常现象。

---

## 3. Bing / Yandex（可选）

- Bing Webmaster Tools：<https://www.bing.com/webmasters>
  - 导入方式：从 Google Search Console 一键导入（最省事）
  - 也可手动添加 `https://shalico2019.github.io/ibkr-api-translation/`，sitemap 同上
- Yandex Webmaster：<https://webmaster.yandex.com/>
  - 主要服务俄罗斯市场，本项目可忽略

---

## 4. 维护节奏建议

| 动作 | 频率 | 说明 |
|---|---|---|
| 看 Google 索引覆盖率 | 每周 | Search Console → 页面 → 索引编制报告 |
| 看百度索引量 | 每月 | 站长平台 → 索引量 |
| 更新 sitemap | 自动 | 每次 push → CI 跑 `mkdocs build` + `scripts/build-sitemap.sh` 重写 `sitemap.xml` |
| 重新提交 sitemap | 大改后 | URL 数量显著变化或站结构变化时手动触发 |
| 检查 `robots.txt` 可访问性 | 每月 | `curl https://.../robots.txt` |

---

## 5. 常用链接速查

- 站点：<https://shalico2019.github.io/ibkr-api-translation/>
- sitemap：<https://shalico2019.github.io/ibkr-api-translation/sitemap.xml>
- 仓库：<https://github.com/shalico2019/ibkr-api-translation>
- Google Search Console：<https://search.google.com/search-console>
- 百度站长平台：<https://ziyuan.baidu.com/>
- Bing Webmaster：<https://www.bing.com/webmasters>