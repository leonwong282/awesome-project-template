# Static Assets

This directory contains static assets for the Docusaurus documentation website.

## Structure

```
static/
├── img/
│   ├── logo.svg          # Site logo (navbar, favicon)
│   ├── logo-dark.svg     # Dark mode logo (optional)
│   └── docusaurus.png    # Social card image
└── .gitkeep
```

## Usage

- Place images in `img/` folder
- Reference in docs: `![Alt text](/img/filename.png)`
- Configured in `docusaurus.config.js` for navbar/footer

## Logo Requirements

- **Format**: SVG preferred (vector), PNG/JPG acceptable
- **Size**: Navbar logo should be ~32-40px height
- **Variants**: Consider light/dark mode versions
