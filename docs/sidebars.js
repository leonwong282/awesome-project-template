// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docsSidebar: [
    {
      type: 'doc',
      id: 'intro',
      label: '🚀 Getting Started',
    },
    {
      type: 'category',
      label: '📚 Guides',
      items: [
        'guides/GETTING_STARTED',
        'guides/EDITORCONFIG_GUIDE',
        'guides/PRECOMMIT_GUIDE',
        'guides/LICENSE_GUIDE',
        'guides/GITHUB_SETTINGS_GUIDE',
        {
          type: 'category',
          label: '⚙️ Advanced',
          collapsed: true,
          items: [
            'guides/SEARCH_GUIDE',
            'guides/VERSIONING_GUIDE',
            'guides/ANALYTICS_GUIDE',
            'guides/ACCESSIBILITY_GUIDE',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: '📖 Reference',
      items: [
        'reference/contributing',
      ],
    },
    {
      type: 'category',
      label: '👥 Community',
      items: [
        'community/code-of-conduct',
        'community/security',
      ],
    },
    {
      type: 'category',
      label: '🏛️ Decisions',
      items: [
        'decisions/README',
        'decisions/adr-0000-use-adrs',
      ],
    },
  ],
};

export default sidebars;
