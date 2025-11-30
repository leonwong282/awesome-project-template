# Accessibility Guide

This guide covers accessibility (a11y) best practices for building inclusive documentation sites with Docusaurus.

## Why Accessibility Matters

- **Legal Compliance**: Many regions require WCAG 2.1 AA compliance
- **Larger Audience**: ~15% of the world's population has some form of disability
- **Better UX**: Accessibility improvements benefit all users
- **SEO Benefits**: Semantic HTML improves search engine understanding

## Built-in Accessibility Features

This template includes several accessibility enhancements:

### Skip Link

A "Skip to main content" link appears when users press Tab, allowing keyboard users to bypass navigation:

```css
.skip-link {
  position: absolute;
  top: -100%;
  left: 50%;
  transform: translateX(-50%);
  z-index: 1000;
  padding: 0.75rem 1.5rem;
  background: var(--ifm-color-primary);
  color: white;
}

.skip-link:focus {
  top: 0;
}
```

### Enhanced Focus Styles

Clear focus indicators for keyboard navigation:

```css
:focus-visible {
  outline: 3px solid var(--ifm-color-primary);
  outline-offset: 2px;
}
```

### Reduced Motion Support

Respects user preferences for reduced motion:

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

### High Contrast Mode

Enhanced visibility for users who prefer high contrast:

```css
@media (prefers-contrast: high) {
  :root {
    --ifm-color-primary: #0000ff;
  }
  
  a {
    text-decoration: underline;
  }
}
```

## Writing Accessible Content

### Heading Hierarchy

Always use proper heading levels (h1 → h2 → h3, don't skip):

```markdown
# Main Title (h1)

## Section (h2)

### Subsection (h3)

## Another Section (h2)
```

### Link Text

Use descriptive link text, avoid "click here":

```markdown
<!-- ❌ Bad -->
Click [here](./guide.md) for more information.

<!-- ✅ Good -->
Read the [complete installation guide](./guide.md).
```

### Image Alt Text

Always provide meaningful alt text:

```markdown
<!-- ❌ Bad -->
![](./screenshot.png)
![image](./screenshot.png)

<!-- ✅ Good -->
![Dashboard showing user analytics with a pie chart of traffic sources](./screenshot.png)
```

For decorative images, use empty alt:

```markdown
![](./decorative-divider.png)
```

### Tables

Use proper table headers and consider adding captions:

```markdown
| Feature | Description |
|---------|-------------|
| Search | Full-text search across docs |
| i18n | Multi-language support |
```

### Code Blocks

Always specify the language for proper syntax highlighting and screen reader context:

````markdown
```javascript
const greeting = "Hello, World!";
```
````

## ARIA Best Practices

### When to Use ARIA

1. **First Rule of ARIA**: Don't use ARIA if native HTML can do the job
2. Use semantic HTML elements (`<nav>`, `<main>`, `<article>`, `<aside>`)
3. Only add ARIA when enhancing native behavior

### Common ARIA Patterns

```jsx
// ✅ Navigation landmark
<nav aria-label="Main navigation">
  {/* links */}
</nav>

// ✅ Expandable section
<button aria-expanded={isOpen} aria-controls="content-id">
  Toggle Section
</button>
<div id="content-id" aria-hidden={!isOpen}>
  {/* content */}
</div>

// ✅ Loading state
<div aria-busy={isLoading} aria-live="polite">
  {isLoading ? 'Loading...' : content}
</div>
```

## Color Contrast

### Minimum Requirements

- **WCAG AA**: 4.5:1 for normal text, 3:1 for large text
- **WCAG AAA**: 7:1 for normal text, 4.5:1 for large text

### Testing Contrast

Use these tools to verify color contrast:

- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [Colour Contrast Analyser](https://www.tpgi.com/color-contrast-checker/)
- Browser DevTools (Chrome, Firefox have built-in contrast checkers)

### Our Color Palette

The template's primary colors meet WCAG AA standards:

| Color | Hex | Contrast (on white) |
|-------|-----|---------------------|
| Primary | #667eea | 4.52:1 ✅ |
| Primary Dark | #4c63e0 | 5.82:1 ✅ |

## Testing Tools

### Automated Testing

| Tool | Type | Best For |
|------|------|----------|
| [axe DevTools](https://www.deque.com/axe/) | Browser Extension | Quick audits |
| [WAVE](https://wave.webaim.org/) | Browser Extension | Visual feedback |
| [Lighthouse](https://developer.chrome.com/docs/lighthouse/) | Built into Chrome | Overall scores |
| [Pa11y](https://pa11y.org/) | CLI/CI | Automation |

### Manual Testing

Always supplement automated tests with manual testing:

1. **Keyboard Navigation**
   - Tab through all interactive elements
   - Ensure logical focus order
   - Test without a mouse

2. **Screen Reader Testing**
   - VoiceOver (macOS): `Cmd + F5`
   - NVDA (Windows): Free, open-source
   - JAWS (Windows): Commercial, industry standard

3. **Browser Zoom**
   - Test at 200% zoom
   - Content should remain usable

4. **Color Blindness**
   - Use tools like [Sim Daltonism](https://michelf.ca/projects/sim-daltonism/)
   - Don't rely solely on color to convey information

## CI/CD Integration

Add accessibility testing to your build pipeline:

### Using Pa11y CI

```json
// package.json
{
  "scripts": {
    "test:a11y": "pa11y-ci --sitemap http://localhost:3000/sitemap.xml"
  },
  "devDependencies": {
    "pa11y-ci": "^3.0.0"
  }
}
```

### GitHub Actions Example

```yaml
name: Accessibility Tests

on: [push, pull_request]

jobs:
  a11y:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Build site
        run: npm run build
        
      - name: Start server
        run: npm run serve &
        
      - name: Wait for server
        run: npx wait-on http://localhost:3000
        
      - name: Run Pa11y
        run: npx pa11y-ci http://localhost:3000
```

## Accessibility Checklist

Before publishing, verify these items:

### Content

- [ ] All images have appropriate alt text
- [ ] Heading hierarchy is logical (no skipped levels)
- [ ] Links have descriptive text
- [ ] Tables have proper headers
- [ ] Language is clear and simple

### Design

- [ ] Color contrast meets WCAG AA (4.5:1 minimum)
- [ ] Focus indicators are visible
- [ ] Text is readable at 200% zoom
- [ ] Information isn't conveyed by color alone

### Functionality

- [ ] All features work with keyboard only
- [ ] Skip link is present and functional
- [ ] Forms have proper labels
- [ ] Error messages are clear and helpful
- [ ] Reduced motion preference is respected

### Testing

- [ ] Automated accessibility tests pass
- [ ] Manual keyboard testing completed
- [ ] Screen reader testing completed
- [ ] Tested with browser zoom

## Resources

### Guidelines & Standards

- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [MDN Accessibility Guide](https://developer.mozilla.org/en-US/docs/Web/Accessibility)

### Docusaurus-Specific

- [Docusaurus Accessibility](https://docusaurus.io/docs/accessibility)
- [Infima CSS Framework](https://infima.dev/) (Docusaurus's CSS framework)

### Learning Resources

- [A11y Project Checklist](https://www.a11yproject.com/checklist/)
- [Inclusive Components](https://inclusive-components.design/)
- [Deque University](https://dequeuniversity.com/) (Free courses available)
