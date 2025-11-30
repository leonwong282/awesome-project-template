---
sidebar_position: 9
title: Privacy-Respecting Analytics
description: Guide to adding analytics while respecting user privacy
keywords: [analytics, privacy, plausible, umami, gdpr]
---

# 📊 Privacy-Respecting Analytics Guide

This guide covers analytics options that respect user privacy and comply with regulations like GDPR.

## Philosophy

This template **does not include analytics by default** because:

- 🔒 **Privacy first**: Users should opt-in to tracking
- 🌍 **GDPR compliance**: Cookie consent is complex
- 🎯 **Your choice**: Different projects have different needs

---

## Comparison of Options

| Service | Type | Cookies | GDPR | Cost | Complexity |
|---------|------|---------|------|------|------------|
| **Plausible** | SaaS/Self-host | ❌ No | ✅ Compliant | €9/mo or free (self-host) | Low |
| **Umami** | Self-hosted | ❌ No | ✅ Compliant | Free | Medium |
| **Simple Analytics** | SaaS | ❌ No | ✅ Compliant | $9/mo | Low |
| **Goat Counter** | SaaS/Self-host | ❌ No | ✅ Compliant | Free tier | Low |
| **Fathom** | SaaS | ❌ No | ✅ Compliant | $14/mo | Low |
| **Google Analytics** | SaaS | ✅ Yes | ⚠️ Requires consent | Free | Medium |

---

## Option 1: Plausible Analytics

**[Plausible](https://plausible.io/)** is a lightweight, privacy-focused alternative to Google Analytics.

### Features

- ✅ No cookies, no consent banner needed
- ✅ GDPR, CCPA, PECR compliant
- ✅ Lightweight script (~1KB)
- ✅ Open source (self-hostable)

### Setup (SaaS)

#### Step 1: Create Account

Sign up at [plausible.io](https://plausible.io/) and add your site.

#### Step 2: Install Plugin

```bash
npm install docusaurus-plugin-plausible
```

#### Step 3: Configure

```javascript title="docusaurus.config.js"
plugins: [
  [
    'docusaurus-plugin-plausible',
    {
      domain: 'your-docs-site.com',
    },
  ],
],
```

### Setup (Self-Hosted)

Use the headTags approach:

```javascript title="docusaurus.config.js"
headTags: [
  {
    tagName: 'script',
    attributes: {
      defer: 'true',
      'data-domain': 'your-docs-site.com',
      src: 'https://your-plausible-instance.com/js/script.js',
    },
  },
],
```

---

## Option 2: Umami

**[Umami](https://umami.is/)** is a simple, fast, privacy-focused analytics solution.

### Features

- ✅ 100% open source
- ✅ Self-hosted (full data ownership)
- ✅ No cookies
- ✅ GDPR compliant
- ✅ Real-time dashboard

### Setup

#### Step 1: Deploy Umami

Deploy using Docker, Vercel, Railway, or other platforms. See [Umami docs](https://umami.is/docs/getting-started).

#### Step 2: Add Tracking Script

```javascript title="docusaurus.config.js"
headTags: [
  {
    tagName: 'script',
    attributes: {
      async: 'true',
      defer: 'true',
      'data-website-id': 'YOUR_WEBSITE_ID',
      src: 'https://your-umami-instance.com/script.js',
    },
  },
],
```

### Docker Compose Example

```yaml title="docker-compose.yml"
version: '3'
services:
  umami:
    image: ghcr.io/umami-software/umami:postgresql-latest
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: postgresql://umami:umami@db:5432/umami
      DATABASE_TYPE: postgresql
      HASH_SALT: your-random-salt-here
    depends_on:
      - db

  db:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: umami
      POSTGRES_USER: umami
      POSTGRES_PASSWORD: umami
    volumes:
      - umami-db:/var/lib/postgresql/data

volumes:
  umami-db:
```

---

## Option 3: Simple Analytics

**[Simple Analytics](https://simpleanalytics.com/)** is a privacy-first analytics service.

### Features

- ✅ No cookies
- ✅ EU-based (Netherlands)
- ✅ GDPR compliant by design
- ✅ Public dashboards option

### Setup

#### Step 1: Create Account

Sign up at [simpleanalytics.com](https://simpleanalytics.com/).

#### Step 2: Install Plugin

```bash
npm install @simpleanalytics/docusaurus-plugin
```

#### Step 3: Configure

```javascript title="docusaurus.config.js"
plugins: [
  [
    '@simpleanalytics/docusaurus-plugin',
    {
      domain: 'your-docs-site.com',
    },
  ],
],
```

---

## Option 4: Goat Counter

**[Goat Counter](https://www.goatcounter.com/)** is a lightweight, open-source analytics.

### Features

- ✅ No cookies
- ✅ GDPR compliant
- ✅ Free tier (100k pageviews/month)
- ✅ Self-hostable

### Setup

```javascript title="docusaurus.config.js"
headTags: [
  {
    tagName: 'script',
    attributes: {
      'data-goatcounter': 'https://YOUR_CODE.goatcounter.com/count',
      async: 'true',
      src: '//gc.zgo.at/count.js',
    },
  },
],
```

---

## Option 5: Google Analytics (with Privacy Considerations)

If you must use Google Analytics, configure it for privacy:

### Setup

```bash
npm install @docusaurus/plugin-google-gtag
```

```javascript title="docusaurus.config.js"
plugins: [
  [
    '@docusaurus/plugin-google-gtag',
    {
      trackingID: 'G-XXXXXXXXXX',
      anonymizeIP: true, // Important for GDPR
    },
  ],
],
```

### Cookie Consent Required

Google Analytics requires cookie consent in the EU. Consider:

- **[react-cookie-consent](https://www.npmjs.com/package/react-cookie-consent)**
- **[cookieconsent](https://www.osano.com/cookieconsent)**

:::warning
Google Analytics is blocked by many ad blockers and privacy browsers. Consider privacy-respecting alternatives for more accurate data.
:::

---

## Environment Variables

For security, use environment variables for analytics IDs:

```javascript title="docusaurus.config.js"
headTags: [
  {
    tagName: 'script',
    attributes: {
      defer: 'true',
      'data-domain': process.env.ANALYTICS_DOMAIN,
      src: process.env.ANALYTICS_SCRIPT_URL,
    },
  },
],
```

```bash title=".env"
ANALYTICS_DOMAIN=your-docs-site.com
ANALYTICS_SCRIPT_URL=https://plausible.io/js/script.js
```

---

## What to Track

### Useful Metrics

| Metric | Why It Matters |
|--------|----------------|
| **Page views** | Popular content identification |
| **Referrers** | Where users come from |
| **Search queries** | What users are looking for |
| **404 errors** | Broken links to fix |
| **Time on page** | Content engagement |

### Don't Track

- Personal information
- Precise location (city is enough)
- Individual user journeys (aggregate only)

---

## Recommendation

| Use Case | Recommended |
|----------|-------------|
| **Simple, hosted** | Plausible or Simple Analytics |
| **Self-hosted, free** | Umami or Goat Counter |
| **Already using Google** | Google Analytics with anonymization |
| **Privacy-critical** | Umami (self-hosted) |

---

## Testing Analytics

### Development Mode

Most analytics skip localhost. To test:

1. Build and serve locally: `npm run build && npm run serve`
2. Use ngrok or similar for public URL
3. Check analytics dashboard

### Debug Mode

Plausible example with debug:

```javascript
{
  tagName: 'script',
  attributes: {
    defer: 'true',
    'data-domain': 'your-site.com',
    src: 'https://plausible.io/js/script.local.js', // Tracks localhost
  },
}
```

---

## Resources

- [Plausible Documentation](https://plausible.io/docs)
- [Umami Documentation](https://umami.is/docs)
- [Simple Analytics Docs](https://docs.simpleanalytics.com/)
- [Goat Counter Docs](https://www.goatcounter.com/help)
- [GDPR and Analytics](https://gdpr.eu/cookies/)
