# 布局设置

> 原文：[ibkrguides.com/ibkrdesktop/layout-settings.htm](https://www.ibkrguides.com/ibkrdesktop/layout-settings.htm)
> 最后更新于 2026-03-05

## 概述

**布局设置（Layout Settings）** 负责**保存**与**恢复**你的 IBKR Desktop 交易页（trading page）和标的清单——所有你精心调好的"哪些图表面板放哪些标的、自选列表怎么排、订单面板的位置"等设置。

它解决两个核心痛点：

1. **误操作后回退**：把错误的布局改回去
2. **多设备/多场景切换**：把工作日的复杂布局备份，换到家庭电脑后一键还原

!!! danger "重要警告"
    恢复（Restore）操作**会完全覆盖你当前的交易页和标的**——所有当前未保存的自定义设置都会丢失。建议恢复前先执行一次"Save Settings As..."（另存为）备份。

## 一、布局/设置恢复（Layout/Settings Recovery）

把某一天保存过的完整设置文件**还原回当前应用**，适合以下场景：

- 上次应用崩溃前的工作流丢了
- 想换回昨天/上周的某个布局

### 操作步骤

1. **打开 Help 菜单**：点击主界面**左下角**的 **Help（帮助）** 菜单。

    > 界面位置：左下角，齿轮/帮助图标。

2. **选择 Layout Settings**：在 Help 菜单中点 **Layout Settings** 项。

3. **选择 Layout/Settings Recovery**：在二级菜单中点 **Layout/Settings Recovery**。

4. **选择要恢复的文件**：在弹出的恢复窗口中点选**某个日期的文件**。窗口提供两个额外选项：

    - **Select custom File**（选择自定义文件）：从本机浏览导入一个外部布局文件
    - **Restore Default Settings**（恢复默认设置）：导入 IBKR Desktop 的**出厂默认布局**

5. **点击 Recover Settings 恢复**：选好日期后点 **Recover Settings** 按钮开始恢复。

6. **确认应用重启**：弹出"应用即将重启"提示框，点 **Yes** 确认。

7. **完成恢复**：应用自动重启，重启后所有交易页和标的已被替换为所选日期的版本。

## 二、保存设置（Save Settings）

把**当前所有布局配置**保存到应用本地（用于以后 Recover Settings 时调用）。

### 操作步骤

1. 点击主界面**左下角**的 **Help（帮助）** 菜单
2. 在 Help 菜单中选 **Layout Settings**
3. 选择 **Save Settings**（保存设置）
4. 屏幕底部出现提示气泡："Settings have been saved"（设置已保存），确认成功

> 保存位置：应用内部（**非外部文件**）—— 想导出为文件请用下方"另存为"。

## 三、设置另存为（Save Settings As）

把当前布局**导出为本地文件**，方便多设备同步或长期备份。

### 操作步骤

1. 点击主界面**左下角**的 **Help（帮助）** 菜单
2. 在 Help 菜单中选 **Layout Settings**
3. 选择 **Save Settings As...**（设置另存为）
4. 在弹出的系统文件对话框中选择保存位置、输入文件名，确认保存

> 用途：备份 / 跨设备迁移 / 给同事分享自己的布局。

## 三种操作对比

| 操作 | 保存/恢复范围 | 存储位置 | 典型用途 |
|------|--------------|---------|---------|
| **Save Settings** | 仅当前应用内部 | 应用内（默认日期文件） | 每天收盘前保存当日布局 |
| **Save Settings As...** | 仅当前应用内部 | **本地文件**（自定义路径/文件名） | 备份 / 跨设备同步 |
| **Layout/Settings Recovery** | 从历史/外部文件恢复 | 读取历史日期文件或外部文件 | 回退到上次正确状态 |

## 关键要点

- **入口**：左下角 Help → Layout Settings（注意**不是**右上角 Settings 齿轮图标）
- **三种操作**：Recovery / Save / Save Settings As——前两者对应用内文件，后两个导出到本地
- **恢复是覆盖**：当前所有未保存改动会被替换——**恢复前请先 Save Settings As 备份**
- **Save Settings**：保存到应用内的"今日文件"，是后续 Recovery 可选的历史日期来源
- **Save Settings As**：把布局导出为 .json / .xml 之类的文件（具体扩展名以 UI 为准），便于跨设备

## 相关章节链接

- [设置](settings.md)（Settings 面板的全局配置）
- [布局入门](ibkr-desktop.md)（IBKR Desktop 整体界面与布局概念）
- [自选列表](watchlists.md)（布局中可包含的面板）
- [图表基础](chart.md)（布局中可包含的面板）

## 其他资源

- [IBKR Campus — IBKR Desktop 界面课程](https://ibkrcampus.com/trading-course/ibkr-desktop/)
- [IBKR Desktop 官网介绍](https://www.interactivebrokers.com/en/trading/ibkr-desktop.php)

## 原文参考

- 源站 URL：https://www.ibkrguides.com/ibkrdesktop/layout-settings.htm
- 源站最后更新日期：2026-03-05
- 截图：源站含 5 张截图（Help 菜单 / Layout Settings 子菜单 / Recovery 文件选择 / 恢复确认弹窗 / Save Settings As 路径选择），均为 IBKR Desktop 官方 UI 截图；本译本以文字描述替代。
- 翻译说明：源站原文结构清晰，三节（Recovery / Save / Save As）操作步骤完整；本译本结构与源站一一对应。