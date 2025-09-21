# GitHub Copilot Instructions

This is an **open source project template** designed to provide a modern, well-structured foundation for new projects. Understanding its architecture and conventions will help you maintain consistency and contribute effectively.

## Project Architecture

### Template Structure
This is a **template repository**, not a functional application. Key architectural principles:
- **Multi-language support**: README files in multiple languages (`README.md`, `README.zh-TW.md`)
- **Documentation-first**: Comprehensive docs in `/docs/` with structured navigation
- **Community-focused**: Extensive GitHub templates for issues, PRs, and contributions
- **Modern tooling**: Vite + React + TypeScript foundation with ESLint/Prettier

### Core Components
- `/docs/` - Documentation hub with guides for users and contributors
- `/.github/` - GitHub templates and workflows (issue templates, PR template)
- `/database/` - SQL templates, migrations, and seed data (PostgreSQL/MySQL/SQLite)
- Root-level community files (`CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`)

## Development Workflow

### Package Scripts (from package.json)
```bash
npm run dev        # Vite development server
npm run build      # Production build
npm run preview    # Preview build locally
npm run lint       # ESLint with TypeScript support
npm run lint:fix   # Auto-fix lint issues
npm run format     # Prettier formatting
npm run format:check # Check formatting
npm run db:setup   # Database setup guidance
npm run db:seed:dev # Development seed data guidance
npm run db:seed:test # Test seed data guidance
```

### Dependencies Pattern
- **Core stack**: React 18 + TypeScript + Vite 5
- **Code quality**: ESLint + Prettier + TypeScript strict mode
- **Modern JS**: ES modules (`"type": "module"` in package.json)
- **Node requirements**: >=18.0.0 (specified in engines)

## Project Conventions

### File Naming & Structure
- **Kebab-case** for files and directories
- **PascalCase** for React components
- **Comprehensive documentation**: Every major section has dedicated docs
- **Multi-language support**: Template includes i18n structure

### Code Style (from .editorconfig)
- **2-space indentation** (default)
- **4-space for Python** files
- **LF line endings**, UTF-8 encoding
- **Trailing whitespace removed**

### Git & GitHub Workflow
- **Fork-based contributions** (detailed in CONTRIBUTING.md)
- **Feature branch naming**: `feature/description` or `fix/description`
- **Structured PR template** with checklists and categorization
- **Issue templates**: Bug reports, features, documentation, questions (all in YAML format)

### Community Standards
- **GPL-3.0 license** - important for open source compliance
- **Contributor Covenant** code of conduct
- **Comprehensive attribution** - acknowledges tools and inspirations
- **Multi-channel support** - issues, discussions, email, blog

## Integration Points

### External Dependencies
- **Vite ecosystem**: Modern build tooling and dev server
- **React 18**: Latest React patterns and features
- **TypeScript 5.3+**: Strict type checking enabled
- **ESLint + Prettier**: Integrated code quality pipeline

### GitHub Integration
- **Template repository**: Uses GitHub's template feature
- **Community health**: All standard community files present
- **Issue management**: Structured templates for different contribution types
- **Documentation linking**: Cross-references between files using relative paths

## Template Usage Patterns

When using this template:
1. **Replace placeholders**: Update "Project Name", URLs, and author information
2. **Configure tooling**: Add/modify ESLint, Prettier configs as needed
3. **Set up database**: Choose PostgreSQL/MySQL/SQLite, run schema scripts in order
4. **Customize docs**: Update `/docs/` structure for your specific project needs
5. **Set up CI/CD**: Add GitHub Actions workflows (not included in template)
6. **Environment setup**: Create `.env.example` and configure environment variables

## Database Architecture

### SQL Template Structure
- **Ordered schema files**: `01-users.sql` (auth), `02-core.sql` (app logic), `99-indexes.sql` (performance)
- **Multi-database support**: PostgreSQL, MySQL, SQLite with conditional syntax
- **Migration system**: Template-based migrations with UP/DOWN sections
- **Seed data**: Separate dev and test datasets for different environments

### Database Patterns
- **RBAC system**: Role-based access control with flexible permissions JSON
- **Audit logging**: Activity logs for tracking user actions and changes  
- **Soft relationships**: Nullable foreign keys for optional associations
- **Extensible metadata**: JSON columns for flexible additional data storage

## Key Files to Understand

- `package.json` - Dependencies, scripts, and project metadata
- `CONTRIBUTING.md` - Detailed contribution workflow and development setup
- `docs/GETTING_STARTED.md` - User onboarding and initial setup
- `docs/DATABASE_SETUP.md` - Database configuration and schema setup
- `.github/pull_request_template.md` - Structured PR requirements
- `.editorconfig` - Code style consistency across editors
- `database/schema/01-users.sql` - User management and authentication tables
- `database/schema/02-core.sql` - Core application business logic tables

This template emphasizes **documentation quality**, **contributor experience**, and **modern development practices**. When making changes, prioritize these principles to maintain the template's effectiveness.
