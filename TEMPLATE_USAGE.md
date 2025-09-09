# 🎯 How to Use This Template

This document provides step-by-step instructions on how to use this GitHub repository template to create your own modern open-source project.

## 🚀 Quick Start

Choose one of the following methods to create your project from this template:

### Method 1: Use This Template Button (Recommended)

1. **Navigate to the template repository** on GitHub
2. **Click the "Use this template" button** (green button near the top right)
3. **Select "Create a new repository"**
4. **Configure your new repository**:
   - Choose the owner (your account or organization)
   - Enter a repository name
   - Add a description
   - Choose visibility (public/private)
   - Include all branches (recommended)
5. **Click "Create repository from template"**

### Method 2: Manual Clone and Setup

```bash
# Clone the template
git clone https://github.com/leonwong282/simple-beatiful-open-project-templete.git your-project-name

# Navigate to the project
cd your-project-name

# Remove the original git history
rm -rf .git

# Initialize new git repository
git init
git add .
git commit -m "Initial commit from template"

# Add your remote origin
git remote add origin https://github.com/leonwong282/your-project-name.git
git push -u origin main
```

### Method 3: GitHub CLI (Command Line)

Prerequisites: Install [GitHub CLI](https://cli.github.com/) and authenticate with `gh auth login`

```bash
# Create a new repository from this template
gh repo create your-project-name \
  --template leonwong282/simple-beatiful-open-project-templete \
  --public \
  --clone \
  --include-all-branches

# Navigate to the new project
cd your-project-name

# Start customizing your project
echo "Ready to customize your project!"
```

**GitHub CLI Options Explained:**
- `--template` - Specifies the template repository to use
- `--public` - Makes the repository public (use `--private` for private repos)
- `--clone` - Automatically clones the repository to your local machine
- `--include-all-branches` - Includes all branches from the template (optional)
- `-d "Description"` - Add a repository description
- `--homepage "URL"` - Set repository homepage URL

**Advanced Example:**
```bash
# Create with description and homepage
gh repo create my-awesome-project \
  --template leonwong282/simple-beatiful-open-project-templete \
  --public \
  --clone \
  --description "My awesome project built from template" \
  --homepage "https://my-awesome-project.com"
```

## 📝 Customization Checklist

After creating your repository from this template, follow this checklist to customize it for your project:

### 🔧 Essential Customizations

- [ ] **Update README.md**
  - [ ] Change project name and description
  - [ ] Update badges with your repository URL
  - [ ] Modify features list
  - [ ] Update tech stack information
  - [ ] Add your specific installation instructions
  - [ ] Update usage examples
  - [ ] Change contact information

- [ ] **Update package.json**
  - [ ] Change `name` field
  - [ ] Update `description`
  - [ ] Modify `author` information
  - [ ] Update `repository` URL
  - [ ] Update `bugs` URL
  - [ ] Update `homepage` URL
  - [ ] Add/remove dependencies as needed

- [ ] **Configure License**
  - [ ] Choose appropriate license (MIT, Apache 2.0, GPL 3.0, etc.)
  - [ ] Update copyright year and name in LICENSE file
  - [ ] Update license badge in README

- [ ] **Update GitHub Configuration**
  - [ ] Modify `.github/workflows/ci.yml` with your specific needs
  - [ ] Update issue templates in `.github/ISSUE_TEMPLATE/`
  - [ ] Customize pull request template
  - [ ] Update auto-assign workflows with your username

### 🎨 Content Customizations

- [ ] **Documentation**
  - [ ] Update `CONTRIBUTING.md` with project-specific guidelines
  - [ ] Modify `CODE_OF_CONDUCT.md` contact information
  - [ ] Update `SECURITY.md` with your security policy
  - [ ] Customize documentation in `docs/` folder

- [ ] **Project Structure**
  - [ ] Remove template-specific files you don't need
  - [ ] Add your project-specific directories
  - [ ] Update `.gitignore` for your specific tech stack
  - [ ] Modify `.editorconfig` and `.prettierrc` as needed

- [ ] **Configuration Files**
  - [ ] Update ESLint rules in `.eslintrc.js`
  - [ ] Modify TypeScript config in `tsconfig.json`
  - [ ] Customize environment variables in `.env.example`

### 🔧 Technical Customizations

- [ ] **Dependencies**
  - [ ] Remove unused dependencies
  - [ ] Add your project-specific dependencies
  - [ ] Update scripts in `package.json`

- [ ] **Build and Deploy**
  - [ ] Configure build process for your tech stack
  - [ ] Set up deployment configuration
  - [ ] Update Docker configuration if needed

- [ ] **Testing**
  - [ ] Set up test framework for your project
  - [ ] Configure test scripts
  - [ ] Add initial test files

## 📋 Step-by-Step Customization Guide

### Step 1: Basic Information

1. **Update README.md**:
   ```markdown
   # Replace this section in README.md
   # 🚀 Project Name -> # 🚀 Your Actual Project Name
   > A modern, beautiful... -> > Your project description
   ```

2. **Update package.json**:
   ```json
   {
     "name": "your-actual-project-name",
     "description": "Your project description",
     "author": {
       "name": "Leon Wong",
       "email": "leonwong282@gmail.com",
       "url": "https://github.com/leonwong282"
     }
   }
   ```

3. **Update repository URLs** throughout the project:
   - Find and replace `leonwong282/project-name` with your actual repository path
   - Update all GitHub links to point to your repository

### Step 2: GitHub Configuration

1. **Update GitHub Actions**:
   ```yaml
   # In .github/workflows/auto-assign.yml
   assignees: "your-actual-username"
   ```

2. **Configure Secrets** (in your GitHub repository settings):
   - `CODECOV_TOKEN` (if using Codecov)
   - `NPM_TOKEN` (if publishing to npm)
   - `DOCKER_USERNAME` and `DOCKER_PASSWORD` (if using Docker)

### Step 3: License and Legal

1. **Choose and update license**:
   - Keep `LICENSE` (GPL 3.0), or
   - Rename `LICENSE-MIT` to `LICENSE` for MIT, or
   - Rename `LICENSE-APACHE` to `LICENSE` for Apache 2.0
   - Update copyright information

2. **Update SECURITY.md** with your contact information

### Step 4: Remove Template-Specific Content

Remove or modify files that are specific to this template:

```bash
# Optional: Remove template-specific documentation
rm TEMPLATE_USAGE.md

# Optional: Remove extra license files
rm LICENSE-MIT LICENSE-APACHE  # Keep only the one you're using

# Optional: Clean up CHANGELOG.md
# Replace with your own changelog or start fresh
```

### Step 5: Initialize Your Project

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Run initial tests**:
   ```bash
   npm test
   npm run lint
   ```

3. **Make your first commit**:
   ```bash
   git add .
   git commit -m "feat: customize template for [your project name]"
   git push
   ```

## 🎯 Template Features Overview

This template includes:

### 📁 **Project Structure**
- Modern file organization
- Clear separation of concerns
- Scalable architecture

### 🔧 **Development Tools**
- ESLint + Prettier for code quality
- TypeScript configuration
- Husky for git hooks
- EditorConfig for consistent coding styles

### 🧪 **Testing Setup**
- Vitest for unit testing
- Playwright for E2E testing
- Coverage reporting
- GitHub Actions integration

### 🚀 **CI/CD Pipeline**
- Automated testing
- Code quality checks
- Security scanning
- Deployment automation

### 📚 **Documentation**
- Comprehensive README
- Contributing guidelines
- Code of conduct
- Security policy
- API documentation structure

### 🏷️ **GitHub Integration**
- Issue templates
- Pull request templates
- Automated labeling
- Auto-assignment workflows

## 🎨 Customization Examples

### Example 1: React Project

```bash
# Add React-specific dependencies
npm install react react-dom @types/react @types/react-dom

# Update package.json scripts
"scripts": {
  "dev": "vite",
  "build": "tsc && vite build",
  "serve": "vite preview"
}
```

### Example 2: Node.js API

```bash
# Add Express and related dependencies
npm install express cors helmet
npm install -D @types/express @types/cors

# Update package.json scripts
"scripts": {
  "dev": "nodemon src/index.ts",
  "build": "tsc",
  "start": "node dist/index.js"
}
```

### Example 3: Python Project

Update the relevant configuration files:

```yaml
# .github/workflows/ci.yml - Add Python workflow
- name: Setup Python
  uses: actions/setup-python@v4
  with:
    python-version: '3.9'
```

## 🆘 Getting Help

If you need help customizing this template:

1. **Check the documentation** in the `docs/` folder
2. **Look at the examples** in this file
3. **Search existing issues** in the template repository
4. **Create a new issue** with the "question" template
5. **Join the discussions** for community help

## ✅ Verification Checklist

After customization, verify that:

- [ ] All badges in README point to your repository
- [ ] GitHub Actions workflows run successfully
- [ ] Package.json has correct information
- [ ] License file contains your information
- [ ] All template-specific content is removed or updated
- [ ] Documentation reflects your project
- [ ] Tests pass locally and in CI
- [ ] Code quality tools work correctly

## 🎉 You're Ready!

Once you've completed the customization checklist, you have a modern, professional open-source project ready for development and community contributions!

Remember to:
- Keep documentation updated as your project evolves
- Follow semantic versioning for releases
- Engage with your community through issues and discussions
- Regularly update dependencies and security measures

Happy coding! 🚀
