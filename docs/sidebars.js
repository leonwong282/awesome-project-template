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
            'guides/EDITORCONFIG_GUIDE',
            'guides/PRECOMMIT_GUIDE',
            'guides/LICENSE_GUIDE',

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
  ],
};

export default sidebars;
