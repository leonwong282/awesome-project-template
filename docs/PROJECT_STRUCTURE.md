# 📁 Project Structure

This document explains the organization and structure of the project codebase to help you navigate and understand how everything fits together.

## 🌳 Directory Overview

```
project-name/
├── .github/                    # GitHub-specific files
│   ├── workflows/              # GitHub Actions CI/CD pipelines
│   │   ├── ci.yml             # Main CI/CD workflow
│   │   ├── auto-assign.yml    # Auto-assign issues and PRs
│   │   └── label-sync.yml     # Synchronize labels
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   │   ├── bug_report.yml     # Bug report template
│   │   ├── feature_request.yml # Feature request template
│   │   ├── documentation.yml  # Documentation issue template
│   │   └── question.yml       # Question template
│   ├── pull_request_template.md # PR template
│   └── labels.yml             # Label definitions
├── docs/                       # Documentation
│   ├── README.md              # Documentation index
│   ├── GETTING_STARTED.md     # Quick start guide
│   ├── PROJECT_STRUCTURE.md   # This file
│   ├── DEVELOPMENT.md         # Development guide
│   ├── API_REFERENCE.md       # API documentation
│   └── ...                    # Other documentation files
├── src/                        # Source code
│   ├── components/            # Reusable UI components
│   │   ├── ui/               # Basic UI components
│   │   ├── forms/            # Form components
│   │   ├── layout/           # Layout components
│   │   └── ...               # Feature-specific components
│   ├── pages/                # Page components
│   ├── hooks/                # Custom React hooks
│   ├── utils/                # Utility functions
│   ├── types/                # TypeScript type definitions
│   ├── styles/               # Global styles and themes
│   ├── api/                  # API layer
│   ├── store/                # State management
│   └── assets/               # Static assets
├── public/                    # Public static files
│   ├── favicon.ico           # Favicon
│   ├── images/               # Image assets
│   └── ...                   # Other static files
├── tests/                     # Test files
│   ├── unit/                 # Unit tests
│   ├── integration/          # Integration tests
│   ├── e2e/                  # End-to-end tests
│   └── __mocks__/            # Mock files
├── scripts/                   # Build and utility scripts
├── .env.example              # Environment variables template
├── .gitignore                # Git ignore patterns
├── .editorconfig             # Editor configuration
├── .prettierrc               # Prettier configuration
├── .eslintrc.js              # ESLint configuration
├── package.json              # Dependencies and scripts
├── tsconfig.json             # TypeScript configuration
├── vite.config.ts            # Vite configuration
├── vitest.config.ts          # Vitest test configuration
├── playwright.config.ts      # Playwright E2E test configuration
├── Dockerfile                # Docker configuration
├── docker-compose.yml        # Docker Compose configuration
├── README.md                 # Project overview
├── CHANGELOG.md              # Version history
├── CONTRIBUTING.md           # Contributing guidelines
├── CODE_OF_CONDUCT.md        # Code of conduct
├── SECURITY.md               # Security policy
├── LICENSE                   # License file
└── CHECKLIST.md              # Project checklist
```

## 📂 Key Directories Explained

### `.github/`
Contains GitHub-specific configuration files:
- **workflows/**: GitHub Actions for CI/CD, automation
- **ISSUE_TEMPLATE/**: Templates for different types of issues
- **pull_request_template.md**: Template for pull requests
- **labels.yml**: Standardized labels for issues and PRs

### `src/`
The main source code directory:

#### `components/`
Reusable UI components organized by purpose:
```
components/
├── ui/                   # Basic UI building blocks
│   ├── Button.tsx       # Button component
│   ├── Input.tsx        # Input component
│   ├── Modal.tsx        # Modal component
│   └── index.ts         # Barrel exports
├── forms/               # Form-related components
├── layout/              # Layout components (Header, Footer, etc.)
└── features/            # Feature-specific components
```

#### `pages/`
Page-level components:
```
pages/
├── Home.tsx             # Home page
├── About.tsx            # About page
├── Dashboard.tsx        # Dashboard page
└── index.ts             # Barrel exports
```

#### `hooks/`
Custom React hooks:
```
hooks/
├── useApi.ts            # API interaction hook
├── useLocalStorage.ts   # Local storage hook
├── useAuth.ts           # Authentication hook
└── index.ts             # Barrel exports
```

#### `utils/`
Utility functions and helpers:
```
utils/
├── api.ts               # API utilities
├── date.ts              # Date utilities
├── validation.ts        # Validation helpers
├── constants.ts         # Application constants
└── index.ts             # Barrel exports
```

#### `types/`
TypeScript type definitions:
```
types/
├── api.ts               # API-related types
├── user.ts              # User-related types
├── common.ts            # Common types
└── index.ts             # Barrel exports
```

### `docs/`
Comprehensive project documentation:
- User guides and API documentation
- Development and deployment guides
- Architecture and design decisions

### `tests/`
All test files organized by type:
- **unit/**: Component and function unit tests
- **integration/**: Integration tests
- **e2e/**: End-to-end tests with Playwright
- **__mocks__/**: Mock files for testing

## 🎯 File Naming Conventions

### Components
- **PascalCase** for component files: `UserProfile.tsx`
- **camelCase** for non-component files: `apiClient.ts`
- **kebab-case** for directories: `user-profile/`

### Tests
- Test files should be named after the file they test with `.test.` or `.spec.` suffix
- Example: `UserProfile.test.tsx` for testing `UserProfile.tsx`

### Types
- Use descriptive names with `Type` or `Interface` suffix when needed
- Example: `UserType`, `ApiResponse`, `ConfigInterface`

## 📦 Module Organization

### Barrel Exports
Each directory containing multiple related files should have an `index.ts` file for clean imports:

```typescript
// components/ui/index.ts
export { default as Button } from './Button';
export { default as Input } from './Input';
export { default as Modal } from './Modal';

// Usage
import { Button, Input, Modal } from 'components/ui';
```

### Import Order
Follow this import order (enforced by ESLint):
1. Node modules
2. Internal modules (absolute paths)
3. Relative imports

```typescript
// External imports
import React from 'react';
import { useState } from 'react';

// Internal imports
import { Button } from 'components/ui';
import { useAuth } from 'hooks';

// Relative imports
import './Component.styles.css';
```

## 🔧 Configuration Files

### Development Tools
- **`.editorconfig`**: Consistent coding styles across editors
- **`.prettierrc`**: Code formatting rules
- **`.eslintrc.js`**: Linting rules and standards
- **`tsconfig.json`**: TypeScript compiler configuration

### Build Tools
- **`vite.config.ts`**: Vite bundler configuration
- **`vitest.config.ts`**: Unit test runner configuration
- **`playwright.config.ts`**: E2E test configuration

### Package Management
- **`package.json`**: Dependencies, scripts, and metadata
- **`.env.example`**: Environment variables template

## 🏗️ Architecture Patterns

### Component Structure
```typescript
// Component file structure
import React from 'react';
import { ComponentProps } from './Component.types';
import './Component.styles.css';

const Component: React.FC<ComponentProps> = ({ prop1, prop2 }) => {
  // Hooks
  const [state, setState] = useState();
  
  // Event handlers
  const handleClick = () => {
    // Handler logic
  };
  
  // Render
  return (
    <div className="component">
      {/* JSX */}
    </div>
  );
};

export default Component;
```

### Custom Hook Structure
```typescript
// Hook file structure
import { useState, useEffect } from 'react';

interface UseCustomHookReturn {
  data: any;
  loading: boolean;
  error: string | null;
}

export const useCustomHook = (param: string): UseCustomHookReturn => {
  // Hook logic
  return { data, loading, error };
};
```

## 📋 Best Practices

### File Organization
1. **Keep related files together**: Components with their types, styles, and tests
2. **Use barrel exports**: Simplify imports with index files
3. **Separate concerns**: Business logic, UI components, and utilities
4. **Consistent naming**: Follow established conventions

### Code Organization
1. **Single Responsibility**: Each file should have one primary purpose
2. **DRY Principle**: Don't repeat yourself - extract common logic
3. **Clear Dependencies**: Make dependencies explicit and minimal
4. **Type Safety**: Use TypeScript effectively throughout

### Scalability Considerations
1. **Feature-based organization**: Group by features when the project grows
2. **Lazy loading**: Split code for better performance
3. **Clear interfaces**: Define clear contracts between modules
4. **Documentation**: Keep documentation up to date

## 🔍 Finding Files

### Quick Navigation Tips
1. **Use your editor's file search** (Ctrl/Cmd + P in VS Code)
2. **Follow the barrel exports** for clean imports
3. **Check the index files** for available exports
4. **Use consistent naming** to predict file locations

### Common Patterns
```bash
# Finding a component
src/components/ComponentName/ComponentName.tsx

# Finding a hook
src/hooks/useHookName.ts

# Finding types
src/types/moduleName.ts

# Finding tests
tests/unit/ComponentName.test.tsx
```

This structure is designed to be scalable, maintainable, and developer-friendly. As the project grows, consider adopting feature-based organization for larger applications.
