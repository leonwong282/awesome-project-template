---
sidebar_position: 7
title: Search Configuration
description: Guide to configuring search in your Docusaurus documentation
keywords: [search, algolia, docsearch, local-search]
---

# 🔍 Search Configuration Guide

This guide covers search options for your Docusaurus documentation site.

## Current Setup: Local Search

This template uses **[@easyops-cn/docusaurus-search-local](https://github.com/easyops-cn/docusaurus-search-local)** for search functionality.

### Features

- ✅ **Works offline** - No external service required
- ✅ **Privacy-friendly** - No data sent to third parties
- ✅ **Multi-language** - Supports English and Chinese
- ✅ **Zero configuration** - Works out of the box
- ✅ **Highlighting** - Search terms highlighted on target pages

### Current Configuration

```javascript title="docusaurus.config.js"
themes: [
  [
    require.resolve('@easyops-cn/docusaurus-search-local'),
    {
      hashed: true,
      language: ['en', 'zh'],
      highlightSearchTermsOnTargetPage: true,
      explicitSearchResultPath: true,
      docsRouteBasePath: '/docs',
      indexBlog: false,
    },
  ],
],
```

### Customization Options

| Option | Default | Description |
|--------|---------|-------------|
| `hashed` | `true` | Use hashed filenames for search index |
| `language` | `['en']` | Languages to index |
| `indexDocs` | `true` | Index documentation pages |
| `indexBlog` | `true` | Index blog posts |
| `indexPages` | `false` | Index custom pages |
| `docsRouteBasePath` | `/docs` | Base path for docs |
| `highlightSearchTermsOnTargetPage` | `false` | Highlight matches |

---

## Upgrade Path: Algolia DocSearch

For production sites with high traffic, consider **[Algolia DocSearch](https://docsearch.algolia.com/)**.

### Why Upgrade?

- 🚀 **Faster** - Algolia's infrastructure handles indexing
- 📊 **Analytics** - Search query insights
- 🎯 **Better relevance** - AI-powered ranking
- ♾️ **Scalability** - Handles large documentation sites

### Prerequisites

1. Your documentation must be **publicly accessible**
2. Your project should be **open source** (for free tier)
3. You need a deployed, crawlable site

### Step 1: Apply for DocSearch

1. Go to [docsearch.algolia.com/apply](https://docsearch.algolia.com/apply/)
2. Fill out the application form
3. Wait for approval (typically 1-2 weeks)
4. Receive your API credentials via email

### Step 2: Install the Plugin

```bash
npm install @docusaurus/theme-search-algolia
```

### Step 3: Remove Local Search

Remove `@easyops-cn/docusaurus-search-local` from `themes` array in `docusaurus.config.js`.

### Step 4: Configure Algolia

```javascript title="docusaurus.config.js"
themeConfig: {
  algolia: {
    // The application ID provided by Algolia
    appId: 'YOUR_APP_ID',

    // Public API key: safe to commit
    apiKey: 'YOUR_SEARCH_API_KEY',

    indexName: 'YOUR_INDEX_NAME',

    // Optional: see doc section below
    contextualSearch: true,

    // Optional: Algolia search parameters
    searchParameters: {},

    // Optional: path for search page
    searchPagePath: 'search',
  },
},
```

### Step 5: Environment Variables (Recommended)

For security, use environment variables:

```javascript title="docusaurus.config.js"
algolia: {
  appId: process.env.ALGOLIA_APP_ID,
  apiKey: process.env.ALGOLIA_API_KEY,
  indexName: process.env.ALGOLIA_INDEX_NAME,
},
```

---

## Alternative: Typesense DocSearch

**[Typesense](https://typesense.org/)** is an open-source alternative to Algolia.

### Why Typesense?

- 🆓 **Self-hosted** - Full control over your data
- 🔒 **Privacy** - No third-party data sharing
- 💰 **Cost-effective** - No per-search pricing
- ⚡ **Fast** - Built for speed

### Setup Overview

1. Deploy Typesense server (Docker, cloud, or managed)
2. Install `docusaurus-theme-search-typesense`
3. Configure crawler to index your docs
4. Update `docusaurus.config.js`

```bash
npm install docusaurus-theme-search-typesense
```

```javascript title="docusaurus.config.js"
themes: ['docusaurus-theme-search-typesense'],
themeConfig: {
  typesense: {
    typesenseCollectionName: 'docusaurus',
    typesenseServerConfig: {
      nodes: [
        {
          host: 'your-typesense-host.com',
          port: 443,
          protocol: 'https',
        },
      ],
      apiKey: 'your-search-only-api-key',
    },
  },
},
```

---

## Comparison

| Feature | Local Search | Algolia | Typesense |
|---------|-------------|---------|-----------|
| **Cost** | Free | Free (open source) | Self-host or paid cloud |
| **Setup** | Zero config | Application required | Moderate |
| **Offline** | ✅ Yes | ❌ No | ❌ No |
| **Privacy** | ✅ Excellent | ⚠️ Data sent to Algolia | ✅ Self-hosted |
| **Scalability** | Medium | Excellent | Excellent |
| **Analytics** | ❌ No | ✅ Yes | ✅ Yes |
| **Speed** | Good | Excellent | Excellent |

---

## Recommendation

| Use Case | Recommended Solution |
|----------|---------------------|
| **Small/Medium docs** | Local Search (default) |
| **Large production site** | Algolia DocSearch |
| **Privacy-focused** | Local Search or Typesense |
| **Enterprise/Self-hosted** | Typesense |

---

## Troubleshooting

### Search Not Working

1. **Rebuild the site**: `npm run build`
2. **Clear cache**: `npm run clear && npm run build`
3. **Check console** for JavaScript errors

### Search Index Too Large

For large sites, consider:
- Excluding certain pages with `noIndex: true` in frontmatter
- Using Algolia or Typesense for better performance

### Multi-language Issues

Ensure language codes match in:
- `docusaurus.config.js` → `i18n.locales`
- Search plugin → `language` array

---

## Resources

- [Docusaurus Search Documentation](https://docusaurus.io/docs/search)
- [Algolia DocSearch](https://docsearch.algolia.com/)
- [docusaurus-search-local](https://github.com/easyops-cn/docusaurus-search-local)
- [Typesense](https://typesense.org/docs/guide/docsearch.html)
