# 📚 EditorConfig Deep Learning Guide

> A comprehensive guide to mastering EditorConfig for consistent code styling across teams and editors.

---

## 📖 Table of Contents

1. [What is EditorConfig?](#what-is-editorconfig)
2. [Learning Roadmap](#learning-roadmap)
3. [Core Concepts](#core-concepts)
4. [Properties Reference](#properties-reference)
5. [Pattern Matching](#pattern-matching)
6. [Real-World Examples](#real-world-examples)
7. [Best Practices](#best-practices)
8. [Advanced Techniques](#advanced-techniques)
9. [Troubleshooting](#troubleshooting)
10. [Resources](#resources)

---

## 🎯 What is EditorConfig?

EditorConfig is a **configuration file format** that helps maintain consistent coding styles across:
- Different editors (VS Code, IntelliJ, Vim, Sublime, etc.)
- Different developers on the same project
- Different operating systems (Windows, macOS, Linux)

### Key Benefits

✅ **Universal**: Works across 40+ editors  
✅ **Simple**: Human-readable INI format  
✅ **Automatic**: No manual editor configuration needed  
✅ **Version-controlled**: Configuration lives in your repository  
✅ **Hierarchical**: Can override settings at directory levels

---

## 🧩 Core Concepts

### 1. File Structure

```ini
# Comment: Top-level EditorConfig file
root = true

# Universal settings (applies to all files)
[*]
property = value

# Language-specific settings
[*.py]
property = value

# Multiple extensions
[*.{js,jsx,ts,tsx}]
property = value
```

### 2. How It Works

```
Project Root
├── .editorconfig          ← Root config
├── src/
│   ├── .editorconfig      ← Overrides root for src/
│   └── components/
│       └── Button.tsx     ← Uses both configs (merged)
└── tests/
    └── test.py            ← Uses only root config
```

**Resolution Order**:
1. Editor reads file being edited
2. Searches up directory tree for `.editorconfig` files
3. Stops when it finds `root = true`
4. Merges all configs (closer files override distant ones)

### 3. Property Precedence

```ini
root = true

[*]
indent_size = 4           # Priority: Low

[*.js]
indent_size = 2           # Priority: Medium (overrides [*])

[lib/**.js]
indent_size = 4           # Priority: High (most specific)
```

**Rule**: More specific patterns override general ones.

---

## 📋 Properties Reference

### Standard Properties

#### `indent_style`
Controls indentation character type.

```ini
indent_style = space      # Use spaces (recommended for most languages)
indent_style = tab        # Use tabs (required for Makefiles, common in Go)
```

**When to use tabs**:
- Go (language standard)
- Makefiles (required)
- Some C/C++ projects

#### `indent_size`
Number of columns for each indentation level.

```ini
indent_size = 2           # JavaScript, Ruby, YAML
indent_size = 4           # Python, Java, C#
indent_size = 8           # Linux kernel style
```

**Language Standards**:
| Language | Standard | Rationale |
|----------|----------|-----------|
| Python | 4 | PEP 8 |
| JavaScript | 2 | Airbnb, Google, Standard JS |
| Java | 4 | Oracle Code Conventions |
| Ruby | 2 | Ruby Style Guide |
| Go | Tab | gofmt default |

#### `tab_width`
Display width of tab character (only applies when `indent_style = tab`).

```ini
[*.go]
indent_style = tab
tab_width = 4             # Tabs displayed as 4 spaces wide
```

#### `end_of_line`
Line ending character(s).

```ini
end_of_line = lf          # Unix/Mac (recommended) - \n
end_of_line = crlf        # Windows - \r\n
end_of_line = cr          # Old Mac (rare) - \r
```

**Best Practice**: Use `lf` everywhere. Git can handle conversion with `.gitattributes`.

#### `charset`
File character encoding.

```ini
charset = utf-8           # Unicode (recommended for all projects)
charset = utf-8-bom       # UTF-8 with BOM (avoid unless needed for Windows)
charset = latin1          # ISO-8859-1 (legacy)
charset = utf-16be        # UTF-16 Big Endian
charset = utf-16le        # UTF-16 Little Endian
```

**Best Practice**: Always use `utf-8` for new projects.

#### `trim_trailing_whitespace`
Remove whitespace at end of lines.

```ini
trim_trailing_whitespace = true    # Remove (recommended)
trim_trailing_whitespace = false   # Keep (needed for Markdown)
```

**Exception**: Markdown uses trailing spaces for line breaks.

```ini
[*.md]
trim_trailing_whitespace = false
```

#### `insert_final_newline`
Ensure file ends with newline.

```ini
insert_final_newline = true        # Add newline (POSIX standard)
insert_final_newline = false       # Don't add
```

**Why it matters**: POSIX defines a text file as ending with newline. Many tools expect this.

#### `max_line_length`
Maximum line length (not enforced by all editors).

```ini
max_line_length = 80      # Traditional standard
max_line_length = 100     # Modern compromise
max_line_length = 120     # Widescreen-friendly
max_line_length = off     # No limit
```

**Language Standards**:
- Python (PEP 8): 79 characters (code), 72 (docstrings)
- JavaScript: 80-100 (varies by style guide)
- Go: No strict limit (gofmt wraps intelligently)

---

## 🎨 Pattern Matching

### Glob Patterns

EditorConfig uses glob patterns to match files.

#### Basic Patterns

```ini
# Exact filename
[Makefile]

# Extension
[*.js]

# Multiple extensions
[*.{js,jsx,ts,tsx}]

# Any file
[*]
```

#### Wildcard Characters

| Pattern | Matches | Example |
|---------|---------|---------|
| `*` | Any string (except `/`) | `*.js` → `app.js`, `index.js` |
| `**` | Any string (including `/`) | `lib/**.js` → `lib/a.js`, `lib/b/c.js` |
| `?` | Any single character | `?.txt` → `a.txt`, `b.txt` |
| `[abc]` | Any character in brackets | `[ABC].txt` → `A.txt`, `B.txt` |
| `[!abc]` | Any character NOT in brackets | `[!0-9].txt` → `a.txt` (not `1.txt`) |
| `{s1,s2}` | Any of the strings | `{a,b}.txt` → `a.txt`, `b.txt` |

#### Advanced Examples

```ini
# All JavaScript files in src/ recursively
[src/**.{js,jsx}]

# Test files only
[*{test,spec}.{js,ts}]

# Configuration files in root only
[{package.json,tsconfig.json}]

# Exclude node_modules (doesn't work - see limitations)
[!node_modules/**]  # ❌ NOT SUPPORTED

# Files starting with dot
[.*]
indent_size = 2
```

#### Pattern Precedence

More specific patterns override general ones:

```ini
[*]
indent_size = 4           # Default

[*.js]
indent_size = 2           # More specific: all .js files

[src/**.js]
indent_size = 8           # Most specific: .js files in src/

[src/legacy/old.js]
indent_size = 4           # Exact match: single file
```

**Result**:
- `src/legacy/old.js` → 4
- `src/utils/helper.js` → 8
- `test/test.js` → 2
- `README.md` → 4

---

## 🌍 Real-World Examples

### Example 1: Full-Stack JavaScript Project

```ini
root = true

# Defaults for all files
[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

# JavaScript/TypeScript
[*.{js,jsx,ts,tsx,mjs,cjs}]
indent_style = space
indent_size = 2
max_line_length = 100

# JSON
[*.json]
indent_style = space
indent_size = 2

# YAML (strict 2-space requirement)
[*.{yml,yaml}]
indent_style = space
indent_size = 2

# Markdown (preserve trailing spaces for line breaks)
[*.md]
trim_trailing_whitespace = false
max_line_length = 80

# Package manager files
[{package.json,package-lock.json,yarn.lock,pnpm-lock.yaml}]
indent_style = space
indent_size = 2
```

### Example 2: Python Data Science Project

```ini
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

# Python (PEP 8)
[*.py]
indent_style = space
indent_size = 4
max_line_length = 79

# Jupyter Notebooks metadata
[*.ipynb]
indent_style = space
indent_size = 1

# Requirements files
[requirements*.txt]
indent_style = space
indent_size = 4

# Configuration
[*.{toml,ini,cfg}]
indent_style = space
indent_size = 4

# Scripts
[*.sh]
indent_style = space
indent_size = 2

# Markdown
[*.md]
trim_trailing_whitespace = false
max_line_length = 88  # Black formatter compatible
```

### Example 3: Go Project

```ini
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

# Go (gofmt standard)
[*.go]
indent_style = tab
indent_size = 4

# Go modules
[go.{mod,sum}]
indent_style = tab

# YAML (Kubernetes configs, etc.)
[*.{yml,yaml}]
indent_style = space
indent_size = 2

# Makefiles (must use tabs)
[Makefile]
indent_style = tab

# Shell scripts
[*.sh]
indent_style = space
indent_size = 2
```

### Example 4: Monorepo with Multiple Languages

```ini
root = true

# Global defaults
[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 2

# Python overrides
[*.py]
indent_size = 4

# Go overrides
[*.go]
indent_style = tab
indent_size = 4

# Java overrides
[*.java]
indent_size = 4

# Makefiles (must use tabs)
[{Makefile,*.mk}]
indent_style = tab

# Configuration files
[*.{toml,ini}]
indent_size = 4

# Markdown
[*.md]
trim_trailing_whitespace = false
max_line_length = 120
```

---

## ✅ Best Practices

### 1. Always Set `root = true`

```ini
# ✅ Good
root = true
[*]
# ...

# ❌ Bad - might inherit from parent directories
[*]
# ...
```

### 2. Order Patterns from General to Specific

```ini
# ✅ Good - easier to read and maintain
[*]
indent_size = 4

[*.js]
indent_size = 2

[test/**.js]
indent_size = 4

# ❌ Bad - harder to understand precedence
[test/**.js]
indent_size = 4

[*]
indent_size = 4

[*.js]
indent_size = 2
```

### 3. Group Related File Types

```ini
# ✅ Good - organized by category
# Frontend
[*.{js,jsx,ts,tsx}]
indent_size = 2

# Styles
[*.{css,scss,sass,less}]
indent_size = 2

# Backend
[*.{py,java,go}]
indent_size = 4
```

### 4. Document Non-Obvious Settings

```ini
# Markdown: preserve trailing spaces for line breaks
[*.md]
trim_trailing_whitespace = false

# Python: PEP 8 compliance
[*.py]
indent_size = 4
max_line_length = 79
```

### 5. Use `.gitattributes` for Line Endings

Don't rely solely on EditorConfig for line endings. Use both:

```ini
# .editorconfig
[*]
end_of_line = lf
```

```gitattributes
# .gitattributes
* text=auto eol=lf
*.bat text eol=crlf
```

### 6. Keep It Simple

```ini
# ✅ Good - minimal, clear
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true

[*.py]
indent_size = 4

# ❌ Bad - over-configured
root = true
[*]
charset = utf-8
end_of_line = lf
# ... 50 more properties for every conceivable file type
```

### 7. Test Your Configuration

```bash
# Install EditorConfig CLI
npm install -g editorconfig

# Check what properties apply to a file
editorconfig src/index.js

# Output example:
# indent_style=space
# indent_size=2
# end_of_line=lf
```

---

## 🚀 Advanced Techniques

### 1. Per-Directory Configuration

```
project/
├── .editorconfig         # Root config
├── frontend/
│   ├── .editorconfig     # Frontend overrides (2-space)
│   └── src/
└── backend/
    ├── .editorconfig     # Backend overrides (4-space)
    └── src/
```

**Root `.editorconfig`**:
```ini
root = true
[*]
charset = utf-8
end_of_line = lf
```

**`frontend/.editorconfig`**:
```ini
# Don't set root = true (inherit from parent)
[*.{js,jsx,ts,tsx}]
indent_size = 2
```

**`backend/.editorconfig`**:
```ini
# Don't set root = true
[*.py]
indent_size = 4
```

### 2. Unset Properties

```ini
[*]
indent_size = 4

[*.md]
indent_size = unset       # Remove inherited indent_size
```

### 3. Integration with Linters

EditorConfig works alongside linters. Configure both:

**.editorconfig**:
```ini
[*.js]
indent_size = 2
max_line_length = 100
```

**.eslintrc.json**:
```json
{
  "rules": {
    "indent": ["error", 2],
    "max-len": ["error", { "code": 100 }]
  }
}
```

Some linters can read EditorConfig:
- ESLint: `eslint-plugin-editorconfig`
- Prettier: Reads EditorConfig automatically

### 4. Editor-Specific Extensions

Some editors support non-standard properties:

```ini
# VS Code specific
[*.js]
# Standard properties
indent_size = 2

# VS Code extensions (require plugins)
quote_type = single       # Not standard
```

**Warning**: Non-standard properties won't work in other editors.

### 5. Workspace vs Global EditorConfig

You can have both:
- **Project config**: `.editorconfig` in repository (version-controlled)
- **Global config**: `~/.editorconfig` (personal defaults)

Project config always overrides global config.

---

## 🔧 Troubleshooting

### Problem: EditorConfig Not Working

**Checklist**:
1. ✅ Is `.editorconfig` in project root?
2. ✅ Does it have `root = true`?
3. ✅ Is your editor supported? ([Check here](https://editorconfig.org/#pre-installed))
4. ✅ Is the plugin installed/enabled?
5. ✅ Are glob patterns correct?
6. ✅ Did you reload/reopen the file?

### Problem: Settings Not Applied to Existing Files

EditorConfig only applies when:
- File is opened
- File is edited
- Editor is restarted

**Solution**: Reload file or restart editor.

### Problem: Conflicting Settings

```ini
[*]
indent_size = 4

[*.js]
indent_size = 2
indent_size = 8          # ❌ Conflict - last one wins
```

**Solution**: Remove duplicate properties.

### Problem: Pattern Not Matching

```ini
# ❌ Won't work - EditorConfig doesn't support negation
[!test/*.js]

# ✅ Instead, be more specific with positive patterns
[src/**.js]
```

### Problem: Tab Width vs Indent Size

```ini
# If using spaces
[*.js]
indent_style = space
indent_size = 2          # Correct

# If using tabs
[*.go]
indent_style = tab
tab_width = 4            # How tabs are displayed
indent_size = 4          # Should match tab_width (for tools)
```

### Debugging Commands

```bash
# Check EditorConfig CLI
editorconfig --version

# Test file matching
editorconfig /path/to/file.js

# Verify syntax (Python)
python -c "import configparser; configparser.ConfigParser().read('.editorconfig')"
```

---

## 📚 Resources

### Official Documentation
- **Official Site**: https://editorconfig.org/
- **Specification**: https://spec.editorconfig.org/
- **GitHub**: https://github.com/editorconfig

### Editor Plugins

| Editor | Plugin | Installation |
|--------|--------|--------------|
| VS Code | Built-in | No plugin needed |
| IntelliJ IDEA | Built-in | No plugin needed |
| Sublime Text | [EditorConfig](https://packagecontrol.io/packages/EditorConfig) | Package Control |
| Vim/Neovim | [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) | Plugin manager |
| Emacs | [editorconfig-emacs](https://github.com/editorconfig/editorconfig-emacs) | MELPA |
| Atom | [editorconfig](https://atom.io/packages/editorconfig) | apm install |

### Study Real-World Configs

Learn from popular projects:

```bash
# Clone and study
git clone https://github.com/nodejs/node.git
cat node/.editorconfig

git clone https://github.com/django/django.git
cat django/.editorconfig

git clone https://github.com/microsoft/vscode.git
cat vscode/.editorconfig
```

**Projects to study**:
- [Node.js](https://github.com/nodejs/node/blob/main/.editorconfig)
- [Django](https://github.com/django/django/blob/main/.editorconfig)
- [React](https://github.com/facebook/react/blob/main/.editorconfig)
- [Angular](https://github.com/angular/angular/blob/main/.editorconfig)
- [Kubernetes](https://github.com/kubernetes/kubernetes/blob/master/.editorconfig)

### Interactive Learning
- **EditorConfig Playground**: https://editorconfig-playground.netlify.app/
- Test patterns and see results immediately

### CLI Tools

```bash
# Install EditorConfig CLI (Node.js)
npm install -g editorconfig

# Or (Python)
pip install editorconfig

# Usage
editorconfig file.js
editorconfig --version
```

### Style Guides

Reference popular style guides:
- **JavaScript**: [Airbnb](https://github.com/airbnb/javascript), [Google](https://google.github.io/styleguide/jsguide.html), [Standard](https://standardjs.com/)
- **Python**: [PEP 8](https://pep8.org/)
- **Ruby**: [Ruby Style Guide](https://rubystyle.guide/)
- **Go**: [Effective Go](https://golang.org/doc/effective_go)
- **Java**: [Google Java Style](https://google.github.io/styleguide/javaguide.html)

### Community
- **Stack Overflow**: [editorconfig tag](https://stackoverflow.com/questions/tagged/editorconfig)
- **Reddit**: r/programming discussions
- **GitHub Issues**: Report bugs or request features

---

## 🎓 Learning Exercises

### Exercise 1: Basic Setup
Create an `.editorconfig` for a mixed project with:
- JavaScript (2 spaces)
- Python (4 spaces)
- YAML (2 spaces)
- Markdown (no trailing space trimming)

### Exercise 2: Pattern Matching
Write patterns to match:
- All test files (ending in `.test.js` or `.spec.js`)
- All config files in root only
- All JavaScript files except in `node_modules`

### Exercise 3: Multi-Directory
Set up a monorepo with:
- Root config with common settings
- Frontend folder with 2-space indents
- Backend folder with 4-space indents

### Exercise 4: Migration
Migrate an existing project from:
- Prettier config → EditorConfig
- ESLint config → EditorConfig
- Maintain compatibility with both

### Exercise 5: Team Adoption
Create a guide for your team on:
- How to install EditorConfig
- How to verify it's working
- How to resolve conflicts

---

## 🏆 Mastery Checklist

- [ ] Created `.editorconfig` for at least 3 different project types
- [ ] Understand all standard properties and when to use them
- [ ] Can write complex glob patterns
- [ ] Set up EditorConfig in all your editors
- [ ] Contributed to or fixed an EditorConfig issue
- [ ] Helped a team member set up EditorConfig
- [ ] Integrated EditorConfig with linters/formatters
- [ ] Wrote documentation for your organization's standards
- [ ] Can debug EditorConfig issues quickly
- [ ] Taught others about EditorConfig

---

## 📝 Quick Reference Card

```ini
# Minimal template for any project
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 2

# Language overrides
[*.py]
indent_size = 4

[*.go]
indent_style = tab

[*.md]
trim_trailing_whitespace = false

[Makefile]
indent_style = tab
```

---

**Happy coding with consistent style! 🚀**

*Last updated: 2025-11-30*
