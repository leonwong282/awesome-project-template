---
sidebar_position: 8
title: Documentation Versioning
description: Guide to versioning your Docusaurus documentation
keywords: [versioning, versions, documentation, docs]
---

# 📚 Documentation Versioning Guide

This guide explains how to version your documentation as your project evolves.

## When to Version

Consider versioning when:

- ✅ You have **multiple major releases** in production
- ✅ Users need to reference **older API versions**
- ✅ Breaking changes require **separate documentation**
- ✅ You support **LTS (Long Term Support)** versions

Don't version if:

- ❌ Your project is in early development
- ❌ You only support the latest version
- ❌ Documentation rarely changes between versions

---

## How Versioning Works

Docusaurus versioning creates snapshots of your documentation:

```
docs/
├── docs/                    # "Next" version (unreleased/development)
├── versioned_docs/
│   ├── version-1.0.0/       # Version 1.0.0 snapshot
│   └── version-2.0.0/       # Version 2.0.0 snapshot
├── versioned_sidebars/
│   ├── version-1.0.0-sidebars.json
│   └── version-2.0.0-sidebars.json
└── versions.json            # List of versions
```

---

## Creating Your First Version

### Step 1: Prepare Documentation

Ensure your `docs/docs/` folder contains complete documentation for the version you want to release.

### Step 2: Create Version

```bash
cd docs
npm run docusaurus docs:version 1.0.0
```

This command:
1. Copies `docs/` to `versioned_docs/version-1.0.0/`
2. Copies `sidebars.js` to `versioned_sidebars/version-1.0.0-sidebars.json`
3. Creates/updates `versions.json`

### Step 3: Verify

Check that these files were created:
- `versioned_docs/version-1.0.0/`
- `versioned_sidebars/version-1.0.0-sidebars.json`
- `versions.json`

---

## Version Configuration

### versions.json

Lists all versions in order (newest first):

```json title="versions.json"
[
  "2.0.0",
  "1.0.0"
]
```

### docusaurus.config.js

Configure version behavior:

```javascript title="docusaurus.config.js"
presets: [
  [
    'classic',
    {
      docs: {
        // Show last update info
        showLastUpdateAuthor: true,
        showLastUpdateTime: true,

        // Version configuration
        lastVersion: 'current', // or specific version like '2.0.0'
        versions: {
          current: {
            label: 'Next 🚧',
            path: 'next',
            banner: 'unreleased',
          },
          '2.0.0': {
            label: '2.0.0',
            path: '2.0.0',
            banner: 'none',
          },
          '1.0.0': {
            label: '1.0.0 (LTS)',
            path: '1.0.0',
            banner: 'unmaintained',
          },
        },
      },
    },
  ],
],
```

### Version Banners

| Banner | Use Case |
|--------|----------|
| `none` | Current/stable version |
| `unreleased` | Development version |
| `unmaintained` | Deprecated/old version |

---

## Adding a New Version

When releasing a new version:

```bash
# Create version 2.1.0
npm run docusaurus docs:version 2.1.0
```

### Update Configuration

1. Update `lastVersion` if needed
2. Add version config in `versions` object
3. Update banners for older versions

---

## Navbar Version Dropdown

Add a version dropdown to the navbar:

```javascript title="docusaurus.config.js"
navbar: {
  items: [
    // ... other items
    {
      type: 'docsVersionDropdown',
      position: 'right',
      dropdownActiveClassDisabled: true,
      dropdownItemsAfter: [
        {
          type: 'html',
          value: '<hr class="dropdown-separator">',
        },
        {
          to: '/versions',
          label: 'All versions',
        },
      ],
    },
  ],
},
```

---

## Version-Specific Content

### Conditional Content

Show content only in specific versions:

```jsx
import {useDocsVersion} from '@docusaurus/plugin-content-docs/client';

function VersionSpecificFeature() {
  const version = useDocsVersion();

  if (version.version === '2.0.0') {
    return <p>This feature is available in v2.0.0+</p>;
  }
  return null;
}
```

### Version Badges

Add badges to indicate version requirements:

```markdown
:::info Requires v2.0.0+
This feature was introduced in version 2.0.0.
:::
```

---

## Best Practices

### Version Naming

| Format | Example | Use Case |
|--------|---------|----------|
| SemVer | `1.0.0` | Most projects |
| Date-based | `2024.01` | Continuous release |
| Named | `stable`, `beta` | Simple versioning |

### Maintenance Strategy

1. **Active**: Current + 1-2 previous major versions
2. **Security-only**: Older LTS versions
3. **Deprecated**: Mark unmaintained versions

### Documentation Updates

- **Fix typos**: Apply to all versions
- **New features**: Only current/next version
- **Breaking changes**: Document migration path

---

## Removing Old Versions

To remove an old version:

1. Delete `versioned_docs/version-X.X.X/`
2. Delete `versioned_sidebars/version-X.X.X-sidebars.json`
3. Remove version from `versions.json`
4. Remove version config from `docusaurus.config.js`

---

## Troubleshooting

### Version Not Showing

1. Check `versions.json` contains the version
2. Verify `versioned_docs/version-X.X.X/` exists
3. Rebuild: `npm run build`

### Sidebar Issues

- Each version has its own sidebar in `versioned_sidebars/`
- Changes to `sidebars.js` only affect "next" version

### Build Errors

Large version counts can slow builds. Consider:
- Removing very old versions
- Using `onlyIncludeVersions` in development:

```javascript
docs: {
  onlyIncludeVersions: ['current', '2.0.0'], // Dev only
},
```

---

## Example Workflow

```bash
# 1. Develop features in docs/docs/

# 2. When ready to release v1.0.0
npm run docusaurus docs:version 1.0.0

# 3. Continue development in docs/docs/

# 4. Release v1.1.0 with new features
npm run docusaurus docs:version 1.1.0

# 5. Major release v2.0.0 with breaking changes
npm run docusaurus docs:version 2.0.0
```

---

## Resources

- [Docusaurus Versioning](https://docusaurus.io/docs/versioning)
- [Semantic Versioning](https://semver.org/)
- [Version Configuration API](https://docusaurus.io/docs/api/plugins/@docusaurus/plugin-content-docs#version)
