---
sidebar_position: 1
slug: /
title: Getting Started
description: Quick start guide for the Awesome Project Template
keywords: [template, open-source, documentation, getting-started]
---

# 🚀 Getting Started

Welcome to the **Awesome Project Template** - a beautiful, documentation-first open source project template!

## What is this Template?

This is a **GitHub template repository** that provides:

- 📋 **Community Health Files** - Issue templates, PR templates, code of conduct
- 📚 **Documentation Structure** - Ready-to-use docs folder with guides
- ⚙️ **Development Tools** - EditorConfig, pre-commit hooks, CI/CD workflows
- 🔒 **Security Best Practices** - Security policy, dependency management
- 📄 **License Guidance** - Help choosing the right open source license

## Quick Start

### 1. Use This Template

Click the **"Use this template"** button on [GitHub](https://github.com/leonwong282/awesome-project-template) to create your own repository.

### 2. Clone Your Repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_PROJECT.git
cd YOUR_PROJECT
```

### 3. Customize

Replace placeholders in the following files:

| File | What to Update |
|------|----------------|
| `README.md` | Project name, description, badges |
| `SECURITY.md` | Your security contact email |
| `CODE_OF_CONDUCT.md` | Your contact email |
| `.github/CODEOWNERS` | Your GitHub username |
| `.github/FUNDING.yml` | Your sponsorship links |

### 4. Set Up Development Tools

```bash
# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Verify EditorConfig (check your editor has the plugin)
cat .editorconfig
```

### 5. Start Building! 🎉

Add your source code and start developing.

## Template Structure

```
awesome-project-template/
├── .github/
│   ├── ISSUE_TEMPLATE/      # Issue templates (bug, feature, docs, question)
│   ├── workflows/           # CI/CD workflows
│   ├── CODEOWNERS           # Code ownership
│   ├── FUNDING.yml          # Sponsorship
│   └── pull_request_template.md
├── docs/                    # Documentation (you are here!)
├── images/                  # Project images and logos
├── .editorconfig            # Editor configuration
├── .pre-commit-config.yaml.example  # Pre-commit hooks template
├── CHANGELOG.md             # Version history
├── CODE_OF_CONDUCT.md       # Community guidelines
├── CONTRIBUTING.md          # Contribution guide
├── LICENSE                  # GPL-3.0 License
├── README.md                # Main readme (English)
├── README.zh-TW.md          # Main readme (Traditional Chinese)
└── SECURITY.md              # Security policy
```

## Learning Resources

### For Beginners

Start with these guides:

1. **[EditorConfig Guide](/docs/guides/EDITORCONFIG_GUIDE)** - Learn to configure consistent coding styles
2. **[Pre-commit Guide](/docs/guides/PRECOMMIT_GUIDE)** - Automate code quality checks

## Need Help?

- 📖 Browse the Documentation
- 🐛 [Report a Bug](https://github.com/leonwong282/awesome-project-template/issues/new?template=bug_report.yml)
- 💡 [Request a Feature](https://github.com/leonwong282/awesome-project-template/issues/new?template=feature_request.yml)
- 💬 [Ask a Question](https://github.com/leonwong282/awesome-project-template/issues/new?template=question.yml)

## Contributing

We welcome contributions! See our [Contributing Guide](/docs/reference/contributing) for details.

---

**Ready to dive deeper?** Check out the [EditorConfig Guide](/docs/guides/EDITORCONFIG_GUIDE) or [Pre-commit Guide](/docs/guides/PRECOMMIT_GUIDE)!
