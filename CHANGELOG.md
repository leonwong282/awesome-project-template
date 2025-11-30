# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.0.0 (2025-11-30)


### Features

* add .gitattributes file for text file handling and binary file settings ([e41e7bd](https://github.com/leonwong282/awesome-project-template/commit/e41e7bd7591a8b831ae1ad37d6924e874e24acc1))
* add comprehensive guides and templates for project setup, including ADRs and GitHub settings ([ed400c2](https://github.com/leonwong282/awesome-project-template/commit/ed400c23838a1057e6d00ada3aabe6e15e4a89f4))
* enhance project setup with comprehensive documentation, CI/CD workflows, and Docker support ([6155967](https://github.com/leonwong282/awesome-project-template/commit/6155967a3ddef5d99d6e5c2efd446262cd7601ed))


### Bug Fixes

* correct typo in project title in README ([a18c3fc](https://github.com/leonwong282/awesome-project-template/commit/a18c3fcf91fb184dc933f1d92cf936dbc874aeeb))
* remove empty sections from README and delete outdated DATABASE_SETUP and package.json files ([60ab9a8](https://github.com/leonwong282/awesome-project-template/commit/60ab9a853fb926c4fa5c4cc8e3368c2f405d7ec9))
* remove unnecessary markdown formatting from CONTRIBUTING.md ([e58a945](https://github.com/leonwong282/awesome-project-template/commit/e58a945150b767f0f59076d3f272661343a342be))
* update links in README and configuration for consistency ([29a2aa4](https://github.com/leonwong282/awesome-project-template/commit/29a2aa49cbd38160f42bce175ab5bd8a893da620))
* update security contact email for vulnerability reporting ([68582cd](https://github.com/leonwong282/awesome-project-template/commit/68582cd8c6afc9f212f72a8088f64c77a439f4bc))

## [1.0.0] - 2025-11-30

### Added

- 📝 **Documentation Structure**
  - README.md with project overview (English)
  - README.zh-TW.md (Traditional Chinese)
  - docs/GETTING_STARTED.md template
  - docs/README.md documentation index

- 🤝 **GitHub Integration**
  - Issue templates (bug, feature, docs, question) in YAML form format
  - Pull request template with structured checklist
  - GitHub Copilot instructions for AI assistance

- 📋 **Community Files**
  - CONTRIBUTING.md with contribution guidelines
  - CODE_OF_CONDUCT.md (Contributor Covenant)
  - SECURITY.md with security policy
  - LICENSE (GPL-3.0)

- ⚙️ **Configuration**
  - .editorconfig for consistent code style
  - .gitignore with common patterns
  - .gitattributes for line ending handling

---

## Template Usage

When using this changelog for your own project:

1. Remove the [1.0.0] entry above (it documents this template)
2. Start with your own [Unreleased] section
3. Follow the format below for new releases

### Entry Format

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes to existing functionality

### Deprecated
- Features to be removed in future

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security updates
```

### Example Entry

```markdown
## [1.2.0] - 2025-03-15

### Added
- User authentication system
- Dark mode support

### Fixed
- Login timeout issue (#42)
- Mobile navigation bug
```
