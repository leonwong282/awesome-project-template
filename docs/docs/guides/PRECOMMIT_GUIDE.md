# 📚 Pre-commit Deep Learning Guide

> A comprehensive guide to mastering pre-commit hooks for automated code quality checks

---

## 📖 Table of Contents

1. [What is Pre-commit?](#what-is-pre-commit)
2. [Learning Roadmap](#learning-roadmap)
3. [Core Concepts](#core-concepts)
4. [Configuration Reference](#configuration-reference)
5. [Built-in Hooks](#built-in-hooks)
6. [Language-Specific Hooks](#language-specific-hooks)
7. [Custom Hooks](#custom-hooks)
8. [Best Practices](#best-practices)
9. [Integration Strategies](#integration-strategies)
10. [Troubleshooting](#troubleshooting)
11. [Resources](#resources)

---

## 🎯 What is Pre-commit?

Pre-commit is a **framework for managing and maintaining multi-language pre-commit hooks**.

### The Problem

Without pre-commit:
```bash
# Developer commits bad code
git commit -m "Add feature"

# CI fails 10 minutes later
❌ Linting failed
❌ Tests failed
❌ Formatting check failed

# Developer fixes and commits again
git commit -m "Fix linting"
```

### The Solution

With pre-commit:
```bash
# Developer tries to commit
git commit -m "Add feature"

# Pre-commit runs automatically BEFORE commit
⏳ Running hooks...
❌ trailing-whitespace......Failed
❌ eslint..................Failed

# Commit blocked! Fix issues first.
# After fixing:
✅ All hooks passed!
[main abc123] Add feature
```

### Key Benefits

✅ **Catch issues early**: Before they reach CI/CD  
✅ **Save time**: Fix problems locally, not in CI  
✅ **Enforce standards**: Automatically check code quality  
✅ **Multi-language**: Works with Python, JS, Go, Rust, etc.  
✅ **Easy setup**: Simple YAML configuration  
✅ **Team consistency**: Everyone uses same checks

---

## 🧩 Core Concepts

### 1. Git Hooks Overview

Git has built-in hooks for various events:

```
.git/hooks/
├── pre-commit         # Before commit
├── prepare-commit-msg # Before commit message editor
├── commit-msg         # After commit message entered
├── post-commit        # After commit completed
├── pre-push           # Before push
├── pre-rebase         # Before rebase
└── ... (many more)
```

**Problem with raw Git hooks**:
- Not version-controlled (in `.git/` directory)
- Hard to share with team
- Language-specific (shell scripts)
- No easy way to manage dependencies

### 2. Pre-commit Framework

Pre-commit solves these problems:

```yaml
# .pre-commit-config.yaml (version-controlled!)
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

**How it works**:

```
1. You run: git commit
           ↓
2. Git triggers: .git/hooks/pre-commit
           ↓
3. Pre-commit reads: .pre-commit-config.yaml
           ↓
4. Pre-commit runs: All configured hooks
           ↓
5. If all pass: Commit succeeds ✅
   If any fail: Commit blocked ❌
```

### 3. Hook Repository Structure

A hook repository contains:

```
hook-repo/
├── .pre-commit-hooks.yaml    # Hook definitions
├── setup.py or package.json  # Dependencies
└── scripts/
    ├── check-something.py
    └── fix-something.sh
```

**`.pre-commit-hooks.yaml` example**:
```yaml
- id: trailing-whitespace
  name: Trim Trailing Whitespace
  entry: trailing-whitespace-fixer
  language: python
  types: [text]
```

### 4. Hook Execution Flow

```
File staged for commit
       ↓
Filter by file types/patterns
       ↓
Run hook entry point
       ↓
Check exit code
       ↓
Exit 0: Pass ✅ | Non-zero: Fail ❌
       ↓
All hooks pass? → Commit | Any fail? → Block
```

### 5. File Filtering

Pre-commit automatically filters files:

```yaml
- id: eslint
  types: [javascript]      # Only .js files
  exclude: '^vendor/'      # Skip vendor/
  files: '^src/'           # Only src/
```

**Filter precedence**: `types` → `files` → `exclude`

---

## 📋 Configuration Reference

### Basic Structure

```yaml
# Minimum version of pre-commit required
minimum_pre_commit_version: '2.15.0'

# Default settings for all repos
default_install_hook_types: [pre-commit, pre-push]
default_stages: [commit, push]

# Exclude files globally
exclude: '^(vendor/|node_modules/|\.min\.js$)'

# Fail fast (stop on first failure)
fail_fast: false

# Hook repositories
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
```

### Repository Configuration

```yaml
repos:
  # Remote repository
  - repo: https://github.com/psf/black
    rev: 23.11.0
    hooks:
      - id: black
        
  # Local hooks (in your repo)
  - repo: local
    hooks:
      - id: my-custom-script
        name: My Custom Check
        entry: ./scripts/check.sh
        language: script
        
  # Meta hooks (pre-commit itself)
  - repo: meta
    hooks:
      - id: check-hooks-apply
      - id: check-useless-excludes
```

### Hook Configuration

```yaml
hooks:
  - id: black
    # Override hook name
    name: Format Python with Black
    
    # Additional arguments
    args: [--line-length=88, --target-version=py311]
    
    # File filtering
    types: [python]
    types_or: [python, pyi]
    exclude: '^tests/fixtures/'
    files: '^src/.*\.py$'
    
    # Execution settings
    language: python
    language_version: python3.11
    pass_filenames: true
    require_serial: false
    
    # Stages to run in
    stages: [commit, push]
    
    # Always run (even if no files match)
    always_run: false
    
    # Verbose output
    verbose: false
    
    # Additional dependencies
    additional_dependencies:
      - tokenize-rt==5.2.0
```

### Language Types

```yaml
language: system        # Use system-installed binary
language: python        # Create Python virtualenv
language: node          # Create Node.js environment
language: ruby          # Create Ruby environment
language: golang        # Create Go environment
language: rust          # Create Rust environment
language: docker        # Run in Docker container
language: script        # Run as shell script
language: fail          # Always fail (for testing)
```

### File Type Filtering

```yaml
types: [file]              # Any file
types: [text]              # Text files only
types: [python]            # Python files
types: [javascript]        # JavaScript files
types: [json]              # JSON files
types: [yaml]              # YAML files
types: [markdown]          # Markdown files
types: [shell]             # Shell scripts

# Custom types
types_or: [python, pyi, jupyter]
exclude_types: [binary]
```

### Stages

```yaml
stages:
  - commit              # Pre-commit (default)
  - merge-commit        # Pre-merge-commit
  - push                # Pre-push
  - prepare-commit-msg  # Prepare commit message
  - commit-msg          # Commit message hook
  - post-checkout       # Post-checkout
  - post-commit         # Post-commit
  - post-merge          # Post-merge
  - post-rewrite        # Post-rewrite
  - manual              # Only when explicitly run
```

---

## 🔧 Built-in Hooks

### Essential Pre-commit Hooks

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      # File formatting
      - id: trailing-whitespace
        name: Trim trailing whitespace
        
      - id: end-of-file-fixer
        name: Fix end of files
        
      - id: mixed-line-ending
        args: [--fix=lf]
        
      # File checks
      - id: check-added-large-files
        args: [--maxkb=1000]
        
      - id: check-merge-conflict
      - id: check-symlinks
      - id: destroyed-symlinks
      
      # Syntax validation
      - id: check-yaml
        args: [--safe]
        
      - id: check-json
      - id: check-toml
      - id: check-xml
      
      # Security
      - id: detect-private-key
      - id: detect-aws-credentials
        args: [--allow-missing-credentials]
        
      # Python-specific
      - id: check-ast
      - id: check-builtin-literals
      - id: check-docstring-first
      - id: debug-statements
      - id: name-tests-test
        args: [--pytest-test-first]
        
      # Misc
      - id: check-case-conflict
      - id: check-executables-have-shebangs
      - id: check-shebang-scripts-are-executable
      - id: fix-byte-order-marker
```

### Hook Descriptions

| Hook ID | What it Does | Auto-fix? |
|---------|--------------|-----------|
| `trailing-whitespace` | Remove spaces at end of lines | ✅ |
| `end-of-file-fixer` | Ensure files end with newline | ✅ |
| `check-yaml` | Validate YAML syntax | ❌ |
| `check-json` | Validate JSON syntax | ❌ |
| `check-merge-conflict` | Detect merge conflict markers | ❌ |
| `check-added-large-files` | Prevent large files (default 500KB) | ❌ |
| `detect-private-key` | Find private keys in code | ❌ |
| `mixed-line-ending` | Fix CRLF/LF inconsistencies | ✅ |
| `check-ast` | Verify Python syntax | ❌ |
| `debug-statements` | Find `breakpoint()`, `pdb` | ❌ |

---

## 🐍 Language-Specific Hooks

### Python

```yaml
repos:
  # Black - Code formatter
  - repo: https://github.com/psf/black
    rev: 23.11.0
    hooks:
      - id: black
        args: [--line-length=88]
        
  # isort - Import sorter
  - repo: https://github.com/PyCQA/isort
    rev: 5.12.0
    hooks:
      - id: isort
        args: [--profile=black]
        
  # Ruff - Fast linter
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.6
    hooks:
      - id: ruff
        args: [--fix, --exit-non-zero-on-fix]
      - id: ruff-format
        
  # mypy - Type checking
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.7.1
    hooks:
      - id: mypy
        additional_dependencies: [types-requests]
        
  # Flake8 - Linter
  - repo: https://github.com/PyCQA/flake8
    rev: 6.1.0
    hooks:
      - id: flake8
        args: [--max-line-length=88]
        
  # Bandit - Security linter
  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
        args: [-c, pyproject.toml]
```

### JavaScript/TypeScript

```yaml
repos:
  # ESLint
  - repo: https://github.com/pre-commit/mirrors-eslint
    rev: v8.54.0
    hooks:
      - id: eslint
        files: \.[jt]sx?$
        types: [file]
        additional_dependencies:
          - eslint@8.54.0
          - eslint-config-standard@17.1.0
          - '@typescript-eslint/eslint-plugin@6.12.0'
          - '@typescript-eslint/parser@6.12.0'
          
  # Prettier
  - repo: https://github.com/pre-commit/mirrors-prettier
    rev: v3.1.0
    hooks:
      - id: prettier
        types_or: [javascript, jsx, ts, tsx, json, yaml, markdown]
        
  # TypeScript compiler
  - repo: https://github.com/pre-commit/mirrors-tsc
    rev: v5.3.2
    hooks:
      - id: tsc
```

### Go

```yaml
repos:
  # gofmt - Formatter
  - repo: https://github.com/dnephin/pre-commit-golang
    rev: v0.5.1
    hooks:
      - id: go-fmt
      - id: go-vet
      - id: go-imports
      - id: go-lint
      - id: go-unit-tests
      
  # golangci-lint
  - repo: https://github.com/golangci/golangci-lint
    rev: v1.55.2
    hooks:
      - id: golangci-lint
```

### Rust

```yaml
repos:
  - repo: https://github.com/doublify/pre-commit-rust
    rev: v1.0
    hooks:
      - id: fmt
      - id: cargo-check
      - id: clippy
```

### Shell Scripts

```yaml
repos:
  # ShellCheck
  - repo: https://github.com/shellcheck-py/shellcheck-py
    rev: v0.9.0.6
    hooks:
      - id: shellcheck
        
  # shfmt - Shell formatter
  - repo: https://github.com/scop/pre-commit-shfmt
    rev: v3.7.0-1
    hooks:
      - id: shfmt
        args: [-i, '2', -ci]
```

### Docker

```yaml
repos:
  # Hadolint - Dockerfile linter
  - repo: https://github.com/hadolint/hadolint
    rev: v2.12.0
    hooks:
      - id: hadolint-docker
```

### Markdown

```yaml
repos:
  # markdownlint
  - repo: https://github.com/igorshubovych/markdownlint-cli
    rev: v0.37.0
    hooks:
      - id: markdownlint
        args: [--fix]
        
  # markdown-link-check
  - repo: https://github.com/tcort/markdown-link-check
    rev: v3.11.2
    hooks:
      - id: markdown-link-check
```

---

## 🛠️ Custom Hooks

### Local Hooks

```yaml
repos:
  - repo: local
    hooks:
      # Shell script
      - id: check-secrets
        name: Check for secrets
        entry: ./scripts/check-secrets.sh
        language: script
        
      # Python script
      - id: custom-validator
        name: Custom validation
        entry: python scripts/validate.py
        language: system
        types: [python]
        
      # Direct command
      - id: no-console-log
        name: Block console.log
        entry: bash -c 'grep -r "console.log" src/ && exit 1 || exit 0'
        language: system
        types: [javascript]
        pass_filenames: false
        
      # Always run hook
      - id: check-api-health
        name: Check API is running
        entry: curl -f http://localhost:8000/health
        language: system
        pass_filenames: false
        always_run: true
        stages: [push]
```

### Creating a Hook Repository

**1. Create repository structure**:

```
my-hooks/
├── .pre-commit-hooks.yaml
├── setup.py
└── my_hooks/
    ├── __init__.py
    └── check_something.py
```

**2. Define hooks** (`.pre-commit-hooks.yaml`):

```yaml
- id: check-api-keys
  name: Check for exposed API keys
  entry: check-api-keys
  language: python
  types: [text]
  
- id: validate-config
  name: Validate configuration files
  entry: validate-config
  language: python
  files: \.(json|yaml|toml)$
```

**3. Implement hook** (`my_hooks/check_something.py`):

```python
#!/usr/bin/env python3
import re
import sys

def check_api_keys(filenames):
    """Check files for exposed API keys."""
    api_key_pattern = re.compile(r'(api[_-]?key|apikey)\s*=\s*["\'][\w-]{20,}["\']', re.IGNORECASE)
    
    errors = []
    for filename in filenames:
        with open(filename, 'r') as f:
            for line_num, line in enumerate(f, 1):
                if api_key_pattern.search(line):
                    errors.append(f"{filename}:{line_num} - Possible API key found")
    
    if errors:
        print("\n".join(errors))
        return 1
    return 0

def main():
    return check_api_keys(sys.argv[1:])

if __name__ == '__main__':
    sys.exit(main())
```

**4. Setup packaging** (`setup.py`):

```python
from setuptools import setup, find_packages

setup(
    name='my-pre-commit-hooks',
    version='1.0.0',
    packages=find_packages(),
    install_requires=[],
    entry_points={
        'console_scripts': [
            'check-api-keys=my_hooks.check_something:main',
        ],
    },
)
```

**5. Use in projects**:

```yaml
repos:
  - repo: https://github.com/yourusername/my-hooks
    rev: v1.0.0
    hooks:
      - id: check-api-keys
```

---

## ✅ Best Practices

### 1. Start Simple, Grow Gradually

```yaml
# ✅ Good - Start minimal
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

# ❌ Bad - Too many hooks at once
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks: # 20+ hooks listed
```

**Approach**: Add hooks incrementally, let team adapt.

### 2. Auto-fix When Possible

```yaml
# ✅ Good - Auto-fixes
- id: trailing-whitespace    # Fixes automatically
- id: black                  # Formats code
- id: isort                  # Sorts imports

# ⚠️ Only check - requires manual fix
- id: flake8                 # Reports issues
- id: mypy                   # Reports type errors
```

**Balance**: Mix auto-fix hooks (fast feedback) with check hooks (enforce quality).

### 3. Order Hooks Logically

```yaml
repos:
  # 1. Format code first
  - repo: https://github.com/psf/black
    rev: 23.11.0
    hooks:
      - id: black
      
  # 2. Then sort imports
  - repo: https://github.com/PyCQA/isort
    rev: 5.12.0
    hooks:
      - id: isort
      
  # 3. Finally lint
  - repo: https://github.com/PyCQA/flake8
    rev: 6.1.0
    hooks:
      - id: flake8
```

**Rationale**: Formatters change code, run them before linters.

### 4. Set Appropriate Stages

```yaml
repos:
  # Fast checks - run on commit
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
        stages: [commit]
        
  # Expensive checks - run on push
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.7.1
    hooks:
      - id: mypy
        stages: [push]
        
  # Critical checks - run on both
  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
        stages: [commit, push]
```

### 5. Exclude Generated/Vendor Files

```yaml
# Global exclude
exclude: '^(vendor/|node_modules/|dist/|build/|\.min\.js$)'

# Hook-specific exclude
hooks:
  - id: eslint
    exclude: '^(vendor/|.*\.generated\..*)$'
```

### 6. Pin Versions

```yaml
# ✅ Good - Specific version
- repo: https://github.com/psf/black
  rev: 23.11.0

# ❌ Bad - Floating version
- repo: https://github.com/psf/black
  rev: main
```

**Update regularly**:
```bash
pre-commit autoupdate
```

### 7. Document Your Configuration

```yaml
# .pre-commit-config.yaml

# This configuration runs automatically before commits.
# To run manually: pre-commit run --all-files
# To update hooks: pre-commit autoupdate
# To skip hooks: git commit --no-verify

repos:
  # Code formatting - auto-fixes files
  - repo: https://github.com/psf/black
    rev: 23.11.0
    hooks:
      - id: black
        # Line length matches flake8 config
        args: [--line-length=88]
```

### 8. Use with CI/CD

```yaml
# .github/workflows/pre-commit.yml
name: Pre-commit

on: [push, pull_request]

jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
      - uses: pre-commit/action@v3.0.0
```

**Why**: Catch issues even if developers skip hooks locally.

---

## 🔄 Integration Strategies

### With Existing Projects

**Step 1: Install pre-commit**
```bash
pip install pre-commit
```

**Step 2: Add minimal config**
```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

**Step 3: Run on all files once**
```bash
pre-commit run --all-files
```

**Step 4: Fix issues or update config**
```bash
# Fix issues
git add -u
git commit -m "Apply pre-commit fixes"

# Or exclude problematic files
echo "exclude: '^legacy/'" >> .pre-commit-config.yaml
```

**Step 5: Install for team**
```bash
pre-commit install
```

### With EditorConfig

```yaml
# Use both together
repos:
  # EditorConfig validation
  - repo: https://github.com/editorconfig-checker/editorconfig-checker.python
    rev: 2.7.3
    hooks:
      - id: editorconfig-checker
        
  # Pre-commit hooks
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

### With Prettier + ESLint

```yaml
repos:
  # Prettier first (formatting)
  - repo: https://github.com/pre-commit/mirrors-prettier
    rev: v3.1.0
    hooks:
      - id: prettier
        types_or: [javascript, jsx, ts, tsx, json, yaml]
        
  # ESLint second (linting)
  - repo: https://github.com/pre-commit/mirrors-eslint
    rev: v8.54.0
    hooks:
      - id: eslint
        files: \.[jt]sx?$
        types: [file]
```

### With Husky (Node.js projects)

**Choose one approach**:

**Option A: Use pre-commit only**
```json
{
  "devDependencies": {
    "pre-commit": "^3.5.0"
  }
}
```

**Option B: Use Husky + lint-staged**
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.js": ["eslint --fix", "prettier --write"]
  }
}
```

**Option C: Hybrid (pre-commit calls Husky)**
```yaml
repos:
  - repo: local
    hooks:
      - id: husky
        name: Husky hooks
        entry: npx husky run pre-commit
        language: system
        pass_filenames: false
```

**Recommendation**: Use pre-commit for multi-language projects, Husky for pure Node.js.

---

## 🔧 Troubleshooting

### Hook Fails But You Want to Commit Anyway

```bash
# Skip hooks once
git commit --no-verify

# Skip specific hook
SKIP=flake8 git commit

# Skip multiple hooks
SKIP=flake8,mypy git commit
```

**Warning**: Use sparingly! Hooks exist for a reason.

### Hook Takes Too Long

**Option 1: Move to push stage**
```yaml
hooks:
  - id: mypy
    stages: [push]    # Only on push, not commit
```

**Option 2: Limit files**
```yaml
hooks:
  - id: pytest
    files: ^tests/    # Only test files
```

**Option 3: Use faster alternatives**
```yaml
# ❌ Slow
- repo: https://github.com/PyCQA/flake8

# ✅ Fast
- repo: https://github.com/astral-sh/ruff-pre-commit
```

### Hook Doesn't Run

**Debug checklist**:

1. **Check if installed**:
   ```bash
   ls .git/hooks/pre-commit
   ```

2. **Reinstall**:
   ```bash
   pre-commit uninstall
   pre-commit install
   ```

3. **Check file matching**:
   ```bash
   pre-commit run --files path/to/file
   ```

4. **Verbose output**:
   ```bash
   pre-commit run --verbose --all-files
   ```

5. **Clean cache**:
   ```bash
   pre-commit clean
   pre-commit install-hooks
   ```

### Hook Fails With Dependency Issues

**Error**: `ModuleNotFoundError: No module named 'something'`

**Solution**: Add `additional_dependencies`
```yaml
hooks:
  - id: mypy
    additional_dependencies:
      - types-requests
      - types-pyyaml
```

### Hook Modifies Files But Commit Still Fails

This is **expected behavior**!

```
1. Hook runs, modifies file
2. File is now different from what's staged
3. Commit fails with "Files were modified"
4. Stage the changes: git add .
5. Commit again
```

**Auto-stage modified files** (use carefully):
```yaml
hooks:
  - id: black
    # Don't do this! It's confusing.
    # Better to manually review changes.
```

### Hooks Work Locally But Fail in CI

**Common causes**:

1. **Different hook versions**:
   ```yaml
   # Pin versions!
   rev: v4.5.0  # Not 'main' or 'master'
   ```

2. **Different Python/Node versions**:
   ```yaml
   hooks:
     - id: black
       language_version: python3.11  # Specify version
   ```

3. **Missing system dependencies**:
   ```yaml
   # GitHub Actions
   - name: Install system deps
     run: sudo apt-get install -y libxml2-dev
   ```

---

## 📚 Resources

### Official Documentation
- **Pre-commit Homepage**: https://pre-commit.com/
- **Configuration**: https://pre-commit.com/#plugins
- **Creating Hooks**: https://pre-commit.com/#creating-new-hooks
- **GitHub**: https://github.com/pre-commit/pre-commit

### Popular Hook Repositories
- **Pre-commit Hooks**: https://github.com/pre-commit/pre-commit-hooks
- **Python**: https://github.com/psf/black, https://github.com/astral-sh/ruff-pre-commit
- **JavaScript**: https://github.com/pre-commit/mirrors-eslint, https://github.com/pre-commit/mirrors-prettier
- **Go**: https://github.com/dnephin/pre-commit-golang
- **Shell**: https://github.com/shellcheck-py/shellcheck-py
- **Docker**: https://github.com/hadolint/hadolint

### Hook Discovery
- **Awesome Pre-commit**: https://github.com/pre-commit/awesome-pre-commit-hooks
- **Search Hooks**: https://pre-commit.com/hooks.html

### Learning Resources
- **Official Tutorial**: https://pre-commit.com/#quick-start
- **Blog Posts**: Search "pre-commit tutorial" on Dev.to, Medium
- **Videos**: YouTube "pre-commit hooks explained"

### Community
- **GitHub Discussions**: https://github.com/pre-commit/pre-commit/discussions
- **Stack Overflow**: Tag `pre-commit`
- **Discord/Slack**: Various language communities

---

## 🎓 Learning Exercises

### Exercise 1: Basic Setup (15 min)

**Task**: Set up pre-commit for a Python project.

**Steps**:
1. Install pre-commit: `pip install pre-commit`
2. Create `.pre-commit-config.yaml` with trailing-whitespace and end-of-file-fixer
3. Install hooks: `pre-commit install`
4. Create a test file with trailing spaces
5. Try to commit and verify hook catches it

### Exercise 2: Multi-Language Project (30 min)

**Task**: Configure pre-commit for JavaScript + Python project.

**Requirements**:
- Python: Black formatter, flake8 linter
- JavaScript: Prettier formatter, ESLint
- Both: Trailing whitespace, YAML validation

### Exercise 3: Custom Hook (45 min)

**Task**: Write a custom hook that prevents committing TODO comments.

**Hint**:
```yaml
- repo: local
  hooks:
    - id: no-todos
      name: Block TODO comments
      entry: bash -c 'grep -r "TODO" src/ && exit 1 || exit 0'
      language: system
      pass_filenames: false
```

### Exercise 4: Performance Optimization (30 min)

**Task**: You have slow hooks. Optimize the configuration.

**Given**:
```yaml
hooks:
  - id: mypy        # Takes 30 seconds
  - id: pytest      # Takes 2 minutes
  - id: black       # Fast
```

**Goal**: Make commits fast while keeping quality checks.

### Exercise 5: Team Rollout (60 min)

**Task**: Plan and execute pre-commit rollout for a 5-person team.

**Deliverables**:
- Configuration file
- Setup documentation
- CI integration
- Troubleshooting guide

---

## 🏆 Advanced Topics

### Monorepo Strategies

**Challenge**: Different packages need different hooks.

**Solution A: Multiple configs**
```
monorepo/
├── .pre-commit-config.yaml      # Root - common hooks
├── packages/
│   ├── frontend/
│   │   └── .pre-commit-config.yaml    # JS hooks
│   └── backend/
│       └── .pre-commit-config.yaml    # Python hooks
```

**Solution B: Conditional hooks**
```yaml
hooks:
  - id: black
    files: ^packages/backend/
    
  - id: prettier
    files: ^packages/frontend/
```

### Performance Optimization

**Techniques**:

1. **Parallel execution** (automatic by default)
2. **File filtering** (reduce files checked)
3. **Staged files only** (default behavior)
4. **Cache dependencies** (automatic)

**Measure performance**:
```bash
time pre-commit run --all-files
```

### Security-Focused Hooks

```yaml
repos:
  # Secrets detection
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
      
  # Security vulnerabilities
  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
      
  # Dependency vulnerabilities
  - repo: https://github.com/Lucas-C/pre-commit-hooks-safety
    rev: v1.3.2
    hooks:
      - id: python-safety-dependencies-check
```

---

## ✅ Quick Reference

### Common Commands

```bash
# Install
pip install pre-commit

# Setup hooks
pre-commit install                    # Install pre-commit hook
pre-commit install --hook-type pre-push  # Install pre-push hook
pre-commit install-hooks             # Install hook dependencies

# Run hooks
pre-commit run                       # Run on staged files
pre-commit run --all-files          # Run on all files
pre-commit run black                # Run specific hook
pre-commit run --files foo.py       # Run on specific files

# Maintenance
pre-commit autoupdate               # Update hook versions
pre-commit clean                    # Clean cache
pre-commit uninstall                # Remove hooks

# Skip hooks
git commit --no-verify              # Skip all hooks
SKIP=flake8 git commit             # Skip specific hook
SKIP=flake8,mypy git commit        # Skip multiple hooks
```

### Minimal Configuration Template

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
```

---

**Happy pre-committing! 🚀**

*Last updated: 2025-11-30*
