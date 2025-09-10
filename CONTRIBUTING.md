# 🤝 Contributing to Project Name

First off, thank you for considering contributing to Project Name! It's people like you that make the open source community such an amazing place to learn, inspire, and create.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Commit Guidelines](#commit-guidelines)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## 🚀 Getting Started

### Types of Contributions

We welcome many different types of contributions including:

- 🐛 **Bug reports and fixes**
- ✨ **Feature requests and implementations**
- 📚 **Documentation improvements**
- 🎨 **UI/UX enhancements**
- 🧪 **Test improvements**
- 🌍 **Translations**
- 💡 **Ideas and suggestions**

### Before Contributing

1. Check if there's already an [issue](https://github.com/leonwong282/awesome-project-template/issues) for your contribution
2. For major changes, please open an issue first to discuss what you would like to change
3. Make sure your contribution aligns with the project's goals and roadmap

## 🛠️ Development Setup

### Prerequisites

- Node.js (v18.0.0 or higher)
- npm, yarn, or pnpm
- Git

### Setup Steps

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/leonwong282/awesome-project-template.git
   cd awesome-project-template
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/leonwong282/awesome-project-template.git
   ```

4. **Install dependencies**
   ```bash
   npm install
   ```

5. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

6. **Start development server**
   ```bash
   npm run dev
   ```

### Development Workflow

```bash
# Keep your fork up to date
git fetch upstream
git checkout main
git merge upstream/main

# Create a new branch for your changes
git checkout -b feature/amazing-feature

# Make your changes and commit them
git add .
git commit -m "feat: add amazing feature"

# Push to your fork
git push origin feature/amazing-feature

# Create a Pull Request on GitHub
```

## 🔄 Pull Request Process

### Before Submitting

- [ ] Code follows the project's coding standards
- [ ] Tests have been added or updated
- [ ] Documentation has been updated if necessary
- [ ] All tests pass locally
- [ ] Code has been linted and formatted
- [ ] Commit messages follow our guidelines

### PR Requirements

1. **Clear Description**: Provide a clear description of what your PR does
2. **Issue Reference**: Reference any related issues
3. **Breaking Changes**: Clearly mark any breaking changes
4. **Screenshots**: Include screenshots for UI changes
5. **Testing**: Describe how you tested your changes

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Related Issue
Fixes #(issue number)

## How Has This Been Tested?
Describe the tests that you ran and how to reproduce them

## Screenshots (if applicable)
Add screenshots here

## Checklist
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
```

## 📝 Commit Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

### Examples

```bash
feat: add user authentication system
fix: resolve memory leak in image processing
docs: update API documentation
style: format code with prettier
refactor: extract utility functions
test: add unit tests for user service
chore: update dependencies
```

## 🧪 Testing Guidelines

### Testing Requirements

- All new features must include tests
- Bug fixes should include regression tests
- Maintain or improve code coverage
- Tests should be clear and descriptive

### Testing Commands

```bash
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage

# Run specific test file
npm test -- UserService.test.js

# Run end-to-end tests
npm run test:e2e
```

### Writing Tests

```javascript
// Example unit test
describe('UserService', () => {
  describe('getUserById', () => {
    it('should return user data when user exists', async () => {
      // Arrange
      const userId = '123';
      const expectedUser = { id: '123', name: 'John Doe' };
      
      // Act
      const result = await UserService.getUserById(userId);
      
      // Assert
      expect(result).toEqual(expectedUser);
    });

    it('should throw error when user does not exist', async () => {
      // Arrange
      const userId = 'nonexistent';
      
      // Act & Assert
      await expect(UserService.getUserById(userId)).rejects.toThrow('User not found');
    });
  });
});
```

## 📚 Documentation

### Documentation Requirements

- Update README.md for new features
- Add JSDoc comments for public APIs
- Update CHANGELOG.md
- Create or update relevant guides

### JSDoc Example

```javascript
/**
 * Calculates the total price of items in a shopping cart
 * @param {Array<Object>} items - Array of cart items
 * @param {number} items[].price - Price of the item
 * @param {number} items[].quantity - Quantity of the item
 * @param {number} [taxRate=0] - Tax rate to apply (optional)
 * @returns {number} Total price including tax
 * @example
 * const total = calculateCartTotal([
 *   { price: 10, quantity: 2 },
 *   { price: 5, quantity: 1 }
 * ], 0.1);
 * // Returns 27.5 (25 + 10% tax)
 */
function calculateCartTotal(items, taxRate = 0) {
  // Implementation here
}
```

## 🏷️ Issue and PR Labels

We use labels to categorize issues and PRs:

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Improvements or additions to documentation
- `good first issue` - Good for newcomers
- `help wanted` - Extra attention is needed
- `priority: high` - High priority
- `priority: low` - Low priority
- `status: needs review` - Needs review
- `status: work in progress` - Work in progress

## 🎉 Recognition

Contributors will be recognized in:

- README.md contributors section
- Release notes
- GitHub contributors page
- Annual contributor highlights

## 📞 Getting Help

If you need help with contributing:

- 💬 [Join our Discord](https://discord.gg/your-discord)
- 📧 Email us at: contribute@your-project.com
- 📝 [Open a discussion](https://github.com/leonwong282/awesome-project-template/discussions)
- 🐦 Tweet us [@your-handle](https://twitter.com/your-handle)

## 📋 Contributor Checklist

Before your first contribution:

- [ ] Read and understand the Code of Conduct
- [ ] Set up your development environment
- [ ] Read this contributing guide thoroughly
- [ ] Join our community channels
- [ ] Look for `good first issue` labels

For each contribution:

- [ ] Create an issue or find an existing one
- [ ] Discuss your approach (for larger changes)
- [ ] Fork the repository
- [ ] Create a feature branch
- [ ] Make your changes
- [ ] Add/update tests
- [ ] Update documentation
- [ ] Run tests locally
- [ ] Create a pull request
- [ ] Respond to code review feedback

---

Thank you for contributing to Project Name! 🎉

Your contributions make this project better for everyone in the community.
