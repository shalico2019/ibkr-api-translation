#!/usr/bin/env bash
#
# build-sitemap.sh — 在 mkdocs build 之后，从 site/ 目录扫描所有 HTML
# 页面，生成 sitemap.xml 与 sitemap.xml.gz，用于搜索引擎收录提交。
#
# 设计要点：
#   - 零 PyPI 依赖：纯 bash + find + sed + awk + gzip，避免引入 mkdocs-sitemap-plugin
#     这类 PyPI 上不存在/已停维护的包，requirements.txt 不动；
#   - site_url 从 mkdocs.yml 顶层读取，没有就占位 https://example.com/，
#     占位时打印警告，便于 verifier 报告里标记 "需部署后替换"；
#   - 排除 404.html（不在站点地图里）；
#   - <lastmod> 用今天的 UTC 日期（保持稳定，便于搜索引擎缓存）；
#   - <changefreq>weekly、<priority>0.5（与最初方案 D 约定一致）。
#
# 使用：
#   ./scripts/build-sitemap.sh              # 默认读 ./site
#   SITE_DIR=out ./scripts/build-sitemap.sh # 自定义 site 目录
#
# 退出码：
#   0 — 生成成功；1 — site/ 不存在或无 HTML 页面。
#
set -euo pipefail

# --- 配置 -------------------------------------------------------------------
SITE_DIR="${SITE_DIR:-site}"
CONFIG_FILE="${CONFIG_FILE:-mkdocs.yml}"
PLACEHOLDER_BASE="https://example.com/"
TODAY="$(date -u +%Y-%m-%d)"

# --- 检查 -------------------------------------------------------------------
if [[ ! -d "$SITE_DIR" ]]; then
  echo "[build-sitemap] ERROR: site directory not found: $SITE_DIR" >&2
  echo "[build-sitemap] 请先跑 'mkdocs build --clean --strict'" >&2
  exit 1
fi

# --- 从 mkdocs.yml 读 site_url ----------------------------------------------
SITE_BASE="$PLACEHOLDER_BASE"
if [[ -f "$CONFIG_FILE" ]]; then
  # 容忍 site_url: xxx 和 site_url: "xxx" 两种写法
  EXTRACTED="$(grep -E '^[[:space:]]*site_url:' "$CONFIG_FILE" \
    | head -n1 \
    | sed -E 's/^[[:space:]]*site_url:[[:space:]]*//' \
    | sed -E 's/^"(.*)"$/\1/' \
    | sed -E "s/^'(.*)'$/\1/" \
    | tr -d '\r')"
  if [[ -n "${EXTRACTED:-}" ]]; then
    SITE_BASE="$EXTRACTED"
  fi
fi

# site_url 末尾必须有 /，否则 URL 拼接会少一层
case "$SITE_BASE" in
  */) ;;
  *)   SITE_BASE="${SITE_BASE}/" ;;
esac

if [[ "$SITE_BASE" == "$PLACEHOLDER_BASE" ]]; then
  echo "[build-sitemap] WARNING: site_url 未在 mkdocs.yml 中设置，使用占位 ${PLACEHOLDER_BASE}" >&2
  echo "[build-sitemap] WARNING: 部署到 GitHub Pages 后请同步替换为真实域名" >&2
fi

# --- 收集 HTML 页面 ---------------------------------------------------------
# find 顺序按文件名排序（自然顺序，index.html 排在该目录最前）
# 用 while-read 替代 mapfile，兼容 macOS /bin/bash 3.2
# 排除：
#   - 404.html（不在站点地图里）
#   - seo-submission/（内部收录操作清单，不该出现在搜索引擎索引里）
HTML_FILES=()
while IFS= read -r f; do
  HTML_FILES+=("$f")
done < <(
  find "$SITE_DIR" -type f -name '*.html' ! -name '404.html' \
    ! -path "${SITE_DIR}/seo-submission/*" \
    | LC_ALL=C sort
)

if [[ ${#HTML_FILES[@]} -eq 0 ]]; then
  echo "[build-sitemap] ERROR: 在 ${SITE_DIR} 下没找到任何 HTML 页面" >&2
  exit 1
fi

# --- 写出 sitemap.xml -------------------------------------------------------
SITEMAP_FILE="${SITE_DIR}/sitemap.xml"
TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

  for f in "${HTML_FILES[@]}"; do
    # site/foo/bar/index.html  ->  /foo/bar/
    # site/foo/bar.html        ->  /foo/bar.html
    # site/index.html          ->  /
    rel="${f#${SITE_DIR}/}"
    case "$rel" in
      index.html)          url_path="/" ;;
      */index.html)        url_path="/${rel%/index.html}/" ;;
      *)                   url_path="/${rel}" ;;
    esac
    # 转义 XML 保留字符（& 是 sitemap URL 里最可能出现的，比如 ?a=1&b=2）
    loc="${SITE_BASE}${url_path#/}"
    loc_escaped="${loc//&/&amp;}"
    loc_escaped="${loc_escaped//</&lt;}"
    loc_escaped="${loc_escaped//>/&gt;}"
    printf '  <url>\n    <loc>%s</loc>\n    <lastmod>%s</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n' \
      "$loc_escaped" "$TODAY"
  done

  echo '</urlset>'
} > "$TMP_FILE"

mv "$TMP_FILE" "$SITEMAP_FILE"
trap - EXIT

# --- 同时输出 .gz（部分爬虫只接受 .gz）-------------------------------------
gzip -9 -c "$SITEMAP_FILE" > "${SITEMAP_FILE}.gz"

# --- 报告 -------------------------------------------------------------------
URL_COUNT=${#HTML_FILES[@]}
echo "[build-sitemap] base = ${SITE_BASE}"
echo "[build-sitemap] wrote ${SITEMAP_FILE} (${URL_COUNT} URLs)"
echo "[build-sitemap] wrote ${SITEMAP_FILE}.gz"