# 🚀 Getting Started

Welcome to Project Name! This guide will help you get up and running quickly.

## 📋 Prerequisites

Before you begin, make sure you have the following installed on your system:

### Required
- **Node.js** (v18.0.0 or higher) - [Download here](https://nodejs.org/)
- **Git** - [Download here](https://git-scm.com/)

### Package Manager (choose one)
- **npm** (comes with Node.js)
- **yarn** - [Installation guide](https://yarnpkg.com/getting-started/install)
- **pnpm** - [Installation guide](https://pnpm.io/installation)

### Optional but Recommended
- **VS Code** - [Download here](https://code.visualstudio.com/)
- **Docker** - [Download here](https://www.docker.com/get-started)

## 🔧 Installation

### 1. Clone the Repository

```bash
# Using HTTPS
git clone https://github.com/leonwong282/project-name.git

# Using SSH (recommended if you have SSH keys set up)
git clone git@github.com:leonwong282/project-name.git

# Navigate to the project directory
cd project-name
```

### 2. Install Dependencies

Choose your preferred package manager:

```bash
# Using npm
npm install

# Using yarn
yarn install

# Using pnpm
pnpm install
```

### 3. Environment Setup

Copy the example environment file and configure it:

```bash
cp .env.example .env.local
```

Edit `.env.local` with your specific configuration:

```env
# API Configuration
NEXT_PUBLIC_API_URL=http://localhost:3001
API_SECRET_KEY=your-secret-key

# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/database_name

# Authentication
NEXTAUTH_SECRET=your-nextauth-secret
NEXTAUTH_URL=http://localhost:3000
```

### 4. Start Development Server

```bash
# Start the development server
npm run dev

# Or with yarn
yarn dev

# Or with pnpm
pnpm dev
```

The application will be available at [http://localhost:3000](http://localhost:3000).

## 🚀 Quick Commands

Here are the most commonly used commands:

```bash
# Development
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm run preview      # Preview production build

# Testing
npm run test         # Run unit tests
npm run test:watch   # Run tests in watch mode
npm run test:e2e     # Run end-to-end tests
npm run test:coverage # Generate coverage report

# Code Quality
npm run lint         # Run ESLint
npm run lint:fix     # Fix ESLint issues
npm run format       # Format code with Prettier
npm run type-check   # Check TypeScript types

# Utilities
npm run clean        # Clean build directories
npm run analyze      # Analyze bundle size
```

## 📁 Project Structure

Understanding the project structure will help you navigate and contribute effectively:

```
project-name/
├── .github/              # GitHub configuration
│   ├── workflows/        # GitHub Actions
│   ├── ISSUE_TEMPLATE/   # Issue templates
│   └── pull_request_template.md
├── docs/                 # Documentation
├── src/                  # Source code
│   ├── components/       # Reusable components
│   ├── pages/           # Page components
│   ├── hooks/           # Custom React hooks
│   ├── utils/           # Utility functions
│   ├── types/           # TypeScript types
│   └── styles/          # Global styles
├── public/              # Static assets
├── tests/               # Test files
├── .env.example         # Environment variables template
├── package.json         # Dependencies and scripts
├── tsconfig.json        # TypeScript configuration
├── vite.config.ts       # Vite configuration
└── README.md            # Project overview
```

## 🔍 What's Next?

Now that you have the project running, here are some suggested next steps:

1. **📖 Read the Documentation**: Check out the [docs](./docs) folder for detailed guides
2. **🧪 Run Tests**: Make sure everything is working by running `npm test`
3. **🔧 Customize**: Modify the configuration to fit your needs
4. **🤝 Contribute**: Read our [Contributing Guide](../CONTRIBUTING.md)
5. **💬 Get Help**: Join our community or open an issue if you need assistance

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
Error: listen EADDRINUSE: address already in use :::3000
```
**Solution**: Either kill the process using port 3000 or change the port:
```bash
# Change port
PORT=3001 npm run dev

# Or find and kill the process
lsof -ti:3000 | xargs kill -9
```

#### Node Version Issues
```bash
Error: The engine "node" is incompatible with this module
```
**Solution**: Update Node.js to version 18 or higher, or use nvm:
```bash
# Install and use correct Node version
nvm install 18
nvm use 18
```

#### Permission Errors
```bash
Error: EACCES: permission denied
```
**Solution**: Fix npm permissions:
```bash
# Fix npm permissions
sudo chown -R $(whoami) ~/.npm
```

### Getting Help

If you encounter issues not covered here:

1. **Search existing issues**: [GitHub Issues](https://github.com/leonwong282/project-name/issues)
2. **Create a new issue**: Use our [bug report template](.github/ISSUE_TEMPLATE/bug_report.yml)
3. **Join discussions**: [GitHub Discussions](https://github.com/leonwong282/project-name/discussions)
4. **Contact maintainers**: See our [support channels](../README.md#support)

## 🎉 Success!

If you've made it this far, congratulations! You now have a working development environment. Happy coding! 🚀
