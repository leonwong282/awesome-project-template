# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
