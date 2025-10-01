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
![Platform](https://img.shields.io/badge/Platform-Cross--Platform-purple?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/leonwong282/awesome-project-template?style=for-the-badge&color=yellow)

[🌍 English](README.md) | [🇹🇼 繁體中文](README.zh-TW.md) 

[特色功能](#-特色功能) • [快速開始](#-快速開始) • [使用方法](#-使用方法) • [貢獻](#-貢獻)

</div>

## ✨ 特色功能

- 🎯 **現代技術堆疊**: React 18 + TypeScript + Vite 提供極速開發體驗
- �️ **資料庫模板**: 為 PostgreSQL、MySQL 和 SQLite 提供即用的 SQL 架構
- � **文件優先**: 為用戶和貢獻者提供全面的指南
- 🤝 **GitHub 整合**: 議題模板、PR 模板和社群健康檔案
- � **程式品質**: ESLint、Prettier 和 EditorConfig 確保程式碼風格一致
- 🌍 **多語言支援**: 模板結構支援國際化
- 🔄 **遷移系統**: 資料庫遷移模板與最佳實踐
- 🌱 **種子資料**: 開發和測試資料，快速建立專案

## 🛠️ 技術堆疊

- **前端**: React 18, TypeScript, Vite
- **資料庫**: PostgreSQL, MySQL, SQLite (包含模板)
- **程式品質**: ESLint, Prettier, EditorConfig
- **文件**: 全面的 markdown 指南
- **社群**: GitHub 模板、行為準則、貢獻指南
- **授權**: GPL-3.0 (開源友好)

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🚀 快速開始

### 使用模板

此儲存庫設計為 GitHub 模板。您可以使用以下方式建立新專案：

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

### 系統需求

開始之前，請確保您已安裝以下軟體：

- [Node.js](https://nodejs.org/) (v18.0.0 或更高版本)
- [Git](https://git-scm.com/)
- [資料庫系統](docs/DATABASE_SETUP.md) (PostgreSQL, MySQL, 或 SQLite)
- [GitHub CLI](https://cli.github.com/)（可選，用於方法二）

### 開發環境設定（使用模板後）

使用此模板建立專案後：

1. **安裝相依性**
   ```bash
   npm install
   # 或
   yarn install
   # 或
   pnpm install
   ```

2. **設定資料庫**（詳見 [資料庫設定指南](docs/DATABASE_SETUP.md)）
   ```bash
   # 選擇您的資料庫系統並執行架構檔案
   npm run db:setup    # 取得設定指引
   npm run db:seed:dev # 載入開發資料
   ```

3. **設定環境變數**
   ```bash
   cp .env.example .env.local
   # 使用您的配置編輯 .env.local
   # 別忘了新增 DATABASE_URL 和其他資料庫設定
   ```

4. **啟動開發伺服器**
   ```bash
   npm run dev
   # 或
   yarn dev
   ```

4. **開啟瀏覽器**
  
   導航至 [http://localhost:3000](http://localhost:3000)

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🏗️ 模板結構

此模板提供全面的基礎，包含以下組件：

### 📁 專案組織
```
awesome-project-template/
├── 📚 docs/                    # 全面的文件
│   ├── GETTING_STARTED.md      # 快速開始指南
│   ├── DATABASE_SETUP.md       # 資料庫配置
│   └── README.md               # 文件索引
├── 🗄️ database/               # SQL 模板和遷移
│   ├── schema/                 # 資料庫架構檔案
│   ├── migrations/             # 遷移模板
│   ├── seeds/                  # 範例資料
│   └── scripts/                # 設定和工具腳本
├── 🤝 .github/                # GitHub 整合
│   ├── ISSUE_TEMPLATE/         # 議題模板
│   ├── copilot-instructions.md # AI 代理指南
│   └── pull_request_template.md # PR 模板
├── � 社群檔案
│   ├── CONTRIBUTING.md         # 貢獻指南
│   ├── CODE_OF_CONDUCT.md      # 社群標準
│   └── SECURITY.md             # 安全政策
└── ⚙️ 配置
    ├── package.json            # 相依性和腳本
    ├── .editorconfig           # 程式碼風格一致性
    └── .gitignore              # Git 忽略模式
```

### 🎯 核心組件

- **多語言 README** - 英文和繁體中文版本
- **資料庫模板** - 主要資料庫的生產就緒 SQL 架構
- **GitHub 整合** - 議題模板、PR 模板、社群健康檔案
- **文件中心** - `/docs/` 中的全面指南
- **遷移系統** - 資料庫版本控制與回滾支援
- **種子資料** - 開發和測試環境的範例資料

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## �📖 使用方法

### 自定義您的專案

使用此模板建立專案後：

#### 1. **更新專案資訊**
```bash
# 在以下檔案中替換佔位符資訊：
# - package.json (名稱、描述、作者、儲存庫)
# - README.md (專案名稱、描述、URL)
# - docs/ 檔案 (更新專案特定資訊)
```

#### 2. **資料庫設定**
```bash
# 選擇並配置您的資料庫
npm run db:setup      # 取得設定指引
npm run db:seed:dev   # 載入開發資料
npm run db:seed:test  # 載入測試資料
```

#### 3. **開發工作流程**
```bash
# 開發伺服器
npm run dev

# 程式品質
npm run lint          # 檢查程式碼風格
npm run lint:fix      # 自動修正問題
npm run format        # 使用 Prettier 格式化程式碼

# 建置生產版本
npm run build
npm run preview       # 預覽生產建置
```

### 可用腳本

| 腳本 | 描述 |
|------|------|
| `npm run dev` | 啟動 Vite 開發伺服器 |
| `npm run build` | 建置生產版本 |
| `npm run preview` | 預覽生產建置 |
| `npm run lint` | 執行 ESLint |
| `npm run lint:fix` | 修正 ESLint 錯誤 |
| `npm run format` | 使用 Prettier 格式化程式碼 |
| `npm run db:setup` | 資料庫設定指引 |
| `npm run db:seed:dev` | 載入開發種子資料 |
| `npm run db:seed:test` | 載入測試種子資料 |

### 文件

詳細指南和文件：

- **[📚 文件中心](docs/README.md)** - 完整文件索引
- **[🚀 開始使用](docs/GETTING_STARTED.md)** - 詳細設定說明
- **[🗄️ 資料庫設定](docs/DATABASE_SETUP.md)** - 資料庫配置指南
- **[🤝 貢獻](CONTRIBUTING.md)** - 如何為您的專案做出貢獻

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

```javascript
## 🤝 貢獻

歡迎貢獻！請查看我們的 [貢獻指南](CONTRIBUTING.md) 了解詳情。
```

### 配置

在專案根目錄建立 `config.json` 檔案：

```json
{
  "option1": "value1",
  "option2": "value2",
  "advanced": {
    "feature": true,
    "timeout": 5000
  }
}
```

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📊 範例

### 範例一：基本實作

```javascript
// 您的範例程式碼
```

### 範例二：進階功能

```javascript
// 更複雜的範例
```

## 🧪 測試

```bash
# 執行測試
npm test

# 執行測試並產生覆蓋率報告
npm run test:coverage

# 執行端對端測試
npm run test:e2e
```

## 📦 建置

```bash
# 為生產環境建置
npm run build

# 建置並分析套件
npm run build:analyze
```

## 🐳 Docker

```bash
# 建置 Docker 映像
docker build -t awesome-project-template .

# 使用 Docker 執行
docker run -p 3000:3000 awesome-project-template

# 使用 Docker Compose
docker-compose up
```

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🤝 貢獻

我們歡迎貢獻！請查看我們的[貢獻指南](CONTRIBUTING.md)了解詳情。

### 快速貢獻步驟

1. Fork 儲存庫
2. 建立您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的變更 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟 Pull Request

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📋 路線圖

- [x] **核心模板結構** - 現代專案基礎
- [x] **資料庫模板** - 主要資料庫的 SQL 架構
- [x] **GitHub 整合** - 議題/PR 模板、社群檔案
- [x] **文件系統** - 全面的指南和設定說明
- [ ] **CI/CD 模板** - 常見任務的 GitHub Actions 工作流程
- [ ] **Docker 配置** - 容器化模板
- [ ] **測試框架** - 單元和整合測試範例
- [ ] **API 文件** - OpenAPI/Swagger 模板
- [ ] **監控設定** - 日誌記錄和監控配置

查看[開放議題](https://github.com/leonwong282/awesome-project-template/issues)以獲取完整的建議功能和已知問題清單。

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📄 授權條款

本專案採用 GPL-3.0 授權條款 - 查看 [LICENSE](LICENSE) 檔案了解詳情。

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 👥 作者

- **Leon Wong** - *初始開發* - [leonwong282](https://github.com/leonwong282)

另請參閱參與此專案的[貢獻者](https://github.com/leonwong282/awesome-project-template/contributors)清單。

## 🙏 致謝

此模板的靈感來自於許多優秀開源專案和社群的工作成果。我們感謝：

### 📚 文檔與模板
- **[Best-README-Template](https://github.com/othneildrew/Best-README-Template)** - 優秀的 README 結構和格式靈感
- **[Keep a Changelog](https://keepachangelog.com/en/1.0.0/)** - 變更日誌格式標準
- **[Contributor Covenant](https://www.contributor-covenant.org/)** - 行為準則模板

### 🛠️ 開發工具與標準
- **[Shields.io](https://shields.io/)** - 美觀且資訊豐富的徽章
- **[EditorConfig](https://editorconfig.org/)** - 跨編輯器的一致編碼風格
- **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)** - 版本號碼標準
- **[GitHub](https://github.com/)** - 使開源協作成為可能的平台和工具

### 🎨 UI/UX 靈感
- **[GitHub 官方模板](https://github.com/github)** - GitHub 官方儲存庫模板
- **[Awesome README](https://github.com/matiassingers/awesome-readme)** - 精選的優秀 README 清單
- **[readme.so](https://readme.so/)** - README 編輯器和產生器

### 🔧 技術堆疊
- **[Node.js](https://nodejs.org/)** - JavaScript 執行環境
- **[Vite](https://vitejs.dev/)** - 建置工具和開發伺服器
- **[TypeScript](https://www.typescriptlang.org/)** - 型別安全的 JavaScript
- **[React](https://reactjs.org/)** - UI 函式庫
- **[ESLint](https://eslint.org/)** - 程式碼檢查
- **[Prettier](https://prettier.io/)** - 程式碼格式化

### 🌟 特別感謝
- **GitHub 社群** - 持續的靈感和回饋
- **開源貢獻者** - 讓這樣的專案成為可能
- **模板使用者** - 您的使用和回饋幫助改進此模板

---

*如果您正在使用此模板並希望將您的專案加入我們的展示，歡迎[開啟議題](https://github.com/leonwong282/awesome-project-template/issues)！*

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 📞 支援

如果您有任何問題或需要協助，請：

- 📝 [開啟議題](https://github.com/leonwong282/awesome-project-template/issues/new)
- 💬 [開始討論](https://github.com/leonwong282/awesome-project-template/discussions)
- 📧 發送電子郵件至：leonwong282@gmail.com
- 🌐 造訪我的部落格：[leonwong282.com](https://leonwong282.com/)

<p align="right">(<a href="#readme-top">回到頂部</a>)</p>

## 🔗 連結

- **線上展示**: [https://your-demo-url.com](https://your-demo-url.com)
- **文件**: [https://docs.your-project.com](https://docs.your-project.com)
- **API 參考**: [https://api.your-project.com](https://api.your-project.com)
- **部落格**: [https://leonwong282.com/](https://leonwong282.com/)

---

<div align="center">

**⭐ 如果這個儲存庫對您有幫助，請給它一個星星！**

用 ❤️ 製作，作者 [Leon](https://github.com/leonwong282)

</div>
