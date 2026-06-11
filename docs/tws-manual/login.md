# 首次登录与双因素认证

> 原文：[ibkrguides.com/traderworkstation/log-in-to-tws.htm](https://www.ibkrguides.com/traderworkstation/log-in-to-tws.htm)
> 最后更新于 2025-10-08

## 概述

登录 TWS 前，请先确认你已下载并安装好 TWS 客户端（IBKR 官方 [TWS 下载页](https://www.interactivebrokers.com/en/trading/download-tws.php)，中文译本待后续 P0 批次补齐）。登录时，你需要在弹出的登录框中输入用户名和密码，并选择是登录**真实账户（Live Trading）**还是**模拟账户（Paper Trading）**。

!!! note "双因素认证（2FA）说明"
    TWS 登录通常受 IBKR **Secure Login System**（安全登录系统）保护。你除了输入用户名 / 密码外，还需要通过**物理安全设备（IBKR Mobile / 数码安全卡 / 物理安全卡）**或**手机短信**等方式完成第二因素验证。本章主要介绍登录框本身的操作，2FA 设备激活流程请参考账户管理端（[Account Management → Security](https://ndcdyn.interactivebrokers.com/sso/Login?RL=1)）的指引。

## 操作步骤

### 1. 打开 TWS

1. 双击桌面上安装时生成的 **Trader Workstation** 图标。
2. 等待 TWS 启动并弹出登录框（首次启动可能稍慢，需初始化本地设置）。

!!! note "界面位置"
    TWS 桌面图标位于安装时设置的目录（Windows 通常在桌面 / 开始菜单，macOS 通常在"应用程序"文件夹或 Dock）。

!!! note "下载软件"
    首次安装请到 IBKR 官方 [TWS 下载页](https://www.interactivebrokers.com/en/trading/download-tws.php) 获取安装包；详细下载章节的中文译本待后续 P0 批次补齐。

### 2. 选择账户类型

在登录框中点击以下任一按钮：

- **Live Trading**：登录**真实账户**进行实盘交易。登录框底色为**深蓝色**。
- **Paper Trading**：登录**模拟账户**进行测试交易（IBKR 提供 100 万美元模拟资金）。登录框底色为**深红色**。

!!! warning "不要混淆 Live / Paper"
    Paper 账户使用 IBKR 提供的 1,000,000 美元模拟资金，所有成交在模拟撮合环境中完成，**不会真实下单到交易所**。调试策略、新功能测试时建议先用 Paper 账户。

### 3. 输入凭证并登录

1. 在 **Username**（用户名）字段输入你的 IBKR 用户名。
2. 在 **Password**（密码）字段输入登录密码。
3. 点击 **Log In**（登录）按钮。
4. 按提示完成第二因素验证（IBKR Mobile 推送 / 短信验证码 / 物理安全卡的一次性密码等）。

!!! note "界面位置"
    Username / Password 输入框位于登录框中央偏上，Log In 按钮在其正下方。

## 关键要点

- **深蓝 = Live，深红 = Paper**：颜色只是视觉提示，真正决定登录环境的是你点击的按钮。
- **用户名相同**：Live 和 Paper 共用同一个 IBKR 用户名，但密码独立——首次使用 Paper 账户时需在账户管理端单独设置模拟账户密码。
- **登录失败常见原因**：用户名 / 密码错误、账户被锁、网络问题、2FA 设备未激活、Paper 账户未开通。
- **忘记密码**：通过登录框下方的 **Forgot Password** 链接在账户管理端重置。
- **登录后默认界面**：通常会进入 **Mosaic 界面**；如需切换到 Classic TWS，可在登录框的 More Options 中选择（见下文）。

## 切换 TWS 版本与其它登录选项

如果当前已安装的 TWS 不兼容你需要的版本（Stable / Latest / Beta / Nightly），或想自定义登录参数，可使用登录框的 **More Options** 区域。

1. 点击登录框右下角的 **More Options** 按钮展开高级选项。
2. 在展开的界面中可调整以下参数：

    - **Version**（版本）下拉菜单：切换 TWS 的发行版本：
        - **Stable**：稳定版（生产环境推荐）
        - **Latest**：最新正式版
        - **Beta**：公测版
        - **Nightly**：每日构建版（仅供测试，可能不稳定）
    - **Color Theme**（颜色主题）：切换界面深色 / 浅色主题。
    - **Application Language**（应用语言）：切换界面显示语言。
    - **Settings Directory**（设置目录）：自定义 TWS 本地配置文件（`C:\Jts` 或 `~/Jts`）的存储位置。
    - **Host / Port**（主机 / 端口）：手动指定 TWS 服务器地址与端口（一般无需修改，IBKR 客户端会自动选择最近的服务器；高级用户用于连接自建 IB Gateway 时使用）。

3. 设置完成后，正常填写 Username / Password 即可登录。

!!! note "界面位置"
    More Options 按钮位于登录框右下角（位于 Log In 按钮的下方 / 旁侧），点击后会向上展开一个高级选项面板。

## 关键要点（More Options 部分）

- **无需重新下载**：切换 Stable / Latest / Beta / Nightly 时，TWS 客户端会在下次启动时自动下载对应的运行包，**不需要重新下载安装包**。
- **Host / Port 慎改**：除非你知道你在做什么（接入自建 IB Gateway、固定到特定机房），否则保留默认即可。错误的 Host / Port 会导致登录失败或连接慢。
- **Settings Directory 多账户隔离**：不同用户在同一台电脑上使用不同 TWS 账户时，可通过改 Settings Directory 来隔离各自的本地配置（窗口布局、预设、快捷键等）。

## 相关章节链接

- [基础配置](configuration.md)：登录后建议先做的全局参数调整
- [Mosaic 界面](mosaic.md)：登录后默认看到的界面介绍

## 原文参考

- 源站 URL：https://www.ibkrguides.com/traderworkstation/log-in-to-tws.htm
- 源站最后更新日期：2025-10-08
- **说明**：原任务给的 `login.htm` 路径在源站 404；本章实际翻译自 `log-in-to-tws.htm`（TOC 顺序 i=2，"Logging in to Trader Workstation (TWS)"）。
