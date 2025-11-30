---
sidebar_position: 6
---

# GitHub Repository Settings Guide

This guide covers recommended GitHub repository settings for projects using this template.

## Branch Protection Rules

Branch protection rules help maintain code quality and prevent accidental changes to important branches.

### Recommended Settings for `main` Branch

Navigate to **Settings** → **Branches** → **Add branch protection rule**

| Setting | Recommended | Why |
|---------|-------------|-----|
| **Branch name pattern** | `main` | Protects the default branch |
| **Require a pull request before merging** | ✅ Yes | Ensures code review |
| **Require approvals** | 1+ | At least one reviewer |
| **Dismiss stale pull request approvals** | ✅ Yes | Re-review after changes |
| **Require review from Code Owners** | Optional | If using CODEOWNERS |
| **Require status checks to pass** | ✅ Yes | Prevents broken merges |
| **Require branches to be up to date** | ✅ Yes | Avoids merge conflicts |
| **Require conversation resolution** | ✅ Yes | Address all feedback |
| **Require signed commits** | Optional | For high-security projects |
| **Include administrators** | ✅ Yes | No bypass for anyone |
| **Allow force pushes** | ❌ No | Preserve history |
| **Allow deletions** | ❌ No | Protect the branch |

### Required Status Checks

Based on this template's CI workflows, require these checks:

```
✅ lint (Lint)
✅ docs (Build Docs)
✅ links (Check Links) - optional
✅ analyze (CodeQL) - optional
```

### How to Configure

1. Go to your repository on GitHub
2. Click **Settings** → **Branches**
3. Under "Branch protection rules", click **Add rule**
4. Enter `main` as the branch name pattern
5. Enable the recommended settings above
6. Click **Create** or **Save changes**

## Security Settings

### Recommended Security Features

Navigate to **Settings** → **Code security and analysis**

| Feature | Recommended | Purpose |
|---------|-------------|---------|
| **Dependency graph** | ✅ Enable | Visualize dependencies |
| **Dependabot alerts** | ✅ Enable | Security vulnerability alerts |
| **Dependabot security updates** | ✅ Enable | Auto-fix security issues |
| **Dependabot version updates** | ✅ Enable | Keep dependencies current |
| **Code scanning** | ✅ Enable | CodeQL security analysis |
| **Secret scanning** | ✅ Enable | Detect leaked secrets |
| **Push protection** | ✅ Enable | Block secret commits |

## Repository Features

Navigate to **Settings** → **General** → **Features**

| Feature | Recommended | Purpose |
|---------|-------------|---------|
| **Wikis** | ❌ Disable | Use docs/ instead |
| **Issues** | ✅ Enable | Bug reports and features |
| **Sponsorships** | Optional | Accept funding |
| **Preserve this repository** | Optional | Arctic Code Vault |
| **Discussions** | ✅ Enable | Community Q&A |
| **Projects** | Optional | Project management |

## Pull Request Settings

Navigate to **Settings** → **General** → **Pull Requests**

| Setting | Recommended | Why |
|---------|-------------|-----|
| **Allow merge commits** | ✅ Yes | Standard merges |
| **Allow squash merging** | ✅ Yes | Clean history option |
| **Allow rebase merging** | Optional | Linear history |
| **Always suggest updating pull request branches** | ✅ Yes | Keep PRs current |
| **Allow auto-merge** | ✅ Yes | Merge when checks pass |
| **Automatically delete head branches** | ✅ Yes | Clean up after merge |

## Actions Settings

Navigate to **Settings** → **Actions** → **General**

### Actions Permissions

- **Allow all actions and reusable workflows** (recommended for most projects)
- Or limit to specific actions for higher security

### Workflow Permissions

| Setting | Recommended |
|---------|-------------|
| **Read repository contents and packages permissions** | Default |
| **Allow GitHub Actions to create and approve pull requests** | ✅ Enable (for Dependabot) |

## Environment Protection Rules

For deployment workflows, create protected environments:

1. Go to **Settings** → **Environments**
2. Click **New environment**
3. Name it (e.g., `production`, `github-pages`)
4. Configure protection rules:
   - **Required reviewers**: Add approvers for deployments
   - **Wait timer**: Optional delay before deployment
   - **Deployment branches**: Limit which branches can deploy

## Webhooks and Integrations

Common useful integrations:

| Integration | Purpose |
|-------------|---------|
| **Slack/Discord** | Notifications |
| **CodeClimate** | Code quality |
| **Codecov** | Test coverage |
| **Snyk** | Security scanning |

## Access Management

### Collaborator Roles

| Role | Permissions |
|------|-------------|
| **Read** | View code, open issues |
| **Triage** | Manage issues and PRs |
| **Write** | Push code, merge PRs |
| **Maintain** | Manage repo (no settings) |
| **Admin** | Full access |

### Team Recommendations

For organizations:
- Create a **maintainers** team with Admin access
- Create a **contributors** team with Write access
- Use CODEOWNERS for automatic review assignment

## Checklist

Use this checklist when setting up a new repository:

- [ ] Enable branch protection on `main`
- [ ] Require at least 1 PR approval
- [ ] Enable required status checks
- [ ] Enable Dependabot alerts and updates
- [ ] Enable secret scanning with push protection
- [ ] Enable Discussions for community
- [ ] Configure auto-delete for merged branches
- [ ] Set up CODEOWNERS file
- [ ] Create protected environment for deployments
