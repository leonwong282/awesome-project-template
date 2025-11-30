<a id="readme-top"></a>

<div align="center">

<a href="https://github.com/leonwong282/awesome-project-template">
  <img src="images/logo.png" alt="Logo" width="80" height="80">
</a>

# 🚀 Awesome Project Template

> 一個現代、美觀且結構良好的開源專案模板

![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-GPL--3.0-red?style=for-the-badge)
![Template](https://img.shields.io/badge/Template-Ready-green?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/leonwong282/awesome-project-template?style=for-the-badge&color=yellow)

[🌍 English](README.md) | [🇹🇼 繁體中文](README.zh-TW.md)

[特色功能](#-特色功能) • [快速開始](#-快速開始) • [結構](#-模板結構) • [貢獻](#-貢獻)

</div>

## ✨ 特色功能

- 📝 **文件優先**: 完整的 README、貢獻指南和文件結構
- 🤝 **GitHub 整合**: 議題模板、PR 模板和社群健康檔案
- 🌍 **多語言支援**: 英文和繁體中文 README
- 📋 **社群標準**: 行為準則、安全政策和貢獻指南
- ⚙️ **編輯器一致性**: EditorConfig 確保跨編輯器的程式碼風格一致
- 🏷️ **約定式提交**: 結構化的提交訊息指南

## 🚀 快速開始

### 使用模板

**方法一：GitHub 網頁介面（推薦）**
1. 點擊上方的「Use this template」按鈕
2. 配置您的新儲存庫
3. 開始編程！

**方法二：GitHub CLI**
```bash
gh repo create your-project-name \
  --template leonwong282/awesome-project-template \
  --public --clone
```

**方法三：手動複製**
```bash
git clone https://github.com/leonwong282/awesome-project-template.git your-project
cd your-project
rm -rf .git && git init
```

### 建立專案後

1. **更新專案資訊**
   - 替換文件中的「Project Name」佔位符
   - 更新儲存庫 URL 為您自己的
   - 配置作者資訊

2. **添加您的技術堆疊**
   - 建立 `package.json`、`requirements.txt` 或您的相依性檔案
   - 添加原始碼目錄（`src/`、`lib/` 等）
   - 設定建置工具和 CI/CD

3. **自定義文件**
   - 更新 `docs/GETTING_STARTED.md` 為您的設定說明
   - 根據專案需求修改議題模板

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🏗️ 模板結構

```
awesome-project-template/
├── 📚 docs/                     # 文件中心
│   ├── GETTING_STARTED.md       # 設定指南模板
│   └── README.md                # 文件索引
├── 🤝 .github/                  # GitHub 整合
│   ├── ISSUE_TEMPLATE/          # 議題模板（錯誤、功能、文件、問題）
│   ├── copilot-instructions.md  # AI 編程助手指南
│   └── pull_request_template.md # PR 模板
├── 🖼️ images/                   # 視覺資源
│   └── logo.png                 # 專案標誌
├── 📋 社群檔案
│   ├── README.md                # 本檔案
│   ├── README.zh-TW.md          # 繁體中文 README
│   ├── CONTRIBUTING.md          # 貢獻指南
│   ├── CODE_OF_CONDUCT.md       # 社群標準
│   ├── SECURITY.md              # 安全政策
│   ├── CHANGELOG.md             # 版本歷史模板
│   └── LICENSE                  # GPL-3.0 授權
└── ⚙️ 配置
    ├── .editorconfig            # 編輯器設定
    ├── .gitignore               # Git 忽略模式
    └── .gitattributes           # Git 屬性
```

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📖 文件

- **[📚 文件中心](docs/README.md)** - 完整文件索引
- **[�� 開始使用](docs/GETTING_STARTED.md)** - 設定說明模板
- **[�� 貢獻](CONTRIBUTING.md)** - 如何貢獻

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🤝 貢獻

我們歡迎貢獻！請查看我們的[貢獻指南](CONTRIBUTING.md)了解詳情。

### 快速貢獻步驟

1. Fork 儲存庫
2. 建立您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的變更 (`git commit -m 'feat: add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟 Pull Request

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📋 路線圖

- [x] 核心模板結構
- [x] GitHub 議題/PR 模板
- [x] 多語言 README
- [x] 社群健康檔案
- [ ] CI/CD 工作流程模板
- [ ] Docker 配置模板
- [ ] 其他語言 README

查看[開放議題](https://github.com/leonwong282/awesome-project-template/issues)了解更多。

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📄 授權條款

本專案採用 GPL-3.0 授權條款 - 查看 [LICENSE](LICENSE) 檔案了解詳情。

## 👥 作者

**Leon Wong** - [leonwong282](https://github.com/leonwong282)

## 🙏 致謝

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
- [Contributor Covenant](https://www.contributor-covenant.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Shields.io](https://shields.io/)

## 📞 支援

- 📝 [開啟議題](https://github.com/leonwong282/awesome-project-template/issues/new)
- 💬 [開始討論](https://github.com/leonwong282/awesome-project-template/discussions)
- 📧 Email: leonwong282@gmail.com

---

<div align="center">

**⭐ 如果這個儲存庫對您有幫助，請給它一個星星！**

用 ❤️ 製作，作者 [Leon](https://github.com/leonwong282)

</div>
