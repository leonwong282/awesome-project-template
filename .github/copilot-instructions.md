# GitHub Copilot Instructions

This is a **documentation-first project template** providing GitHub community files and scaffolding. It's a foundation for new projects, not a functional application.

## Template Architecture

### What This Is
A template repository with community health files and documentation structure. Users fork this template and add their own source code.

### Structure
```
/docs/              → Documentation (GETTING_STARTED.md, README.md)
/.github/           → GitHub templates (4 issue types, PR template, copilot-instructions)
/images/            → Logo and visual assets
Root files          → CONTRIBUTING.md, CODE_OF_CONDUCT.md, SECURITY.md, CHANGELOG.md, LICENSE
```

## Code Style (from .editorconfig)

| File Type | Indentation | Notes |
|-----------|-------------|-------|
| Default   | 2 spaces    | Most files |
| Python    | 4 spaces    | `*.py` files |
| Makefile  | Tabs        | Required by Make |
| Markdown  | 2 spaces    | `trim_trailing_whitespace = false`, max 120 chars |

**Always**: LF line endings, UTF-8, final newline required.

## Contribution Patterns

### Commit Messages (Conventional Commits)
```
feat: add new feature
fix: correct a bug
docs: update documentation
style: formatting changes
refactor: code restructuring
```

### Branch Naming
- `feature/short-description`
- `fix/short-description`

### Issue Templates (YAML form format)
Located in `.github/ISSUE_TEMPLATE/`:
- `bug_report.yml` - Bug reports with environment info
- `feature_request.yml` - Feature proposals with acceptance criteria
- `documentation.yml` - Documentation improvements
- `question.yml` - General questions

## Multi-Language Support

Maintain both README files when editing user-facing content:
- `README.md` - English (primary)
- `README.zh-TW.md` - Traditional Chinese

## Key Files

| File | Purpose |
|------|---------|
| `CONTRIBUTING.md` | Fork workflow, PR process |
| `.editorconfig` | Cross-editor code style |
| `.github/pull_request_template.md` | Structured PR checklist |
| `docs/GETTING_STARTED.md` | User onboarding template |

## When Users Fork This Template

They should:
1. Replace "Project Name" placeholders in docs
2. Update repository URLs (currently `leonwong282/awesome-project-template`)
3. Add source code (`src/`, `package.json`, etc.)
4. Set up CI/CD workflows (not included in template)
5. Update author/maintainer information

## License

GPL-3.0 - maintain open source compliance in all contributions.
