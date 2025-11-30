// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Awesome Project Template',
  tagline: 'A beautiful, documentation-first open source project template',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://leonwong282.github.io',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/awesome-project-template/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'leonwong282', // Usually your GitHub org/user name.
  projectName: 'awesome-project-template', // Usually your repo name.
  trailingSlash: false,

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'zh-TW'],
    localeConfigs: {
      en: {
        label: 'English',
      },
      'zh-TW': {
        label: '繁體中文',
      },
    },
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: './sidebars.js',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/leonwong282/awesome-project-template/tree/main/website/',
          showLastUpdateAuthor: true,
          showLastUpdateTime: true,
        },
        blog: false, // Disable blog for now
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // Replace with your project's social card
      image: 'img/social-card.png',
      navbar: {
        title: 'Awesome Template',
        logo: {
          alt: 'Awesome Project Template Logo',
          src: 'img/logo.png',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'docsSidebar',
            position: 'left',
            label: 'Documentation',
          },
          {
            type: 'localeDropdown',
            position: 'right',
          },
          {
            href: 'https://github.com/leonwong282/awesome-project-template',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Documentation',
            items: [
              {
                label: 'Getting Started',
                to: '/docs/intro',
              },
              {
                label: 'EditorConfig Guide',
                to: '/docs/guides/editorconfig',
              },
              {
                label: 'Pre-commit Guide',
                to: '/docs/guides/precommit',
              },
            ],
          },
          {
            title: 'Learning Paths',
            items: [
              {
                label: 'EditorConfig Mastery',
                to: '/docs/guides/editorconfig/phase1-fundamentals',
              },
              {
                label: 'Pre-commit Mastery',
                to: '/docs/guides/precommit/phase1-fundamentals',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'GitHub',
                href: 'https://github.com/leonwong282/awesome-project-template',
              },
              {
                label: 'Issues',
                href: 'https://github.com/leonwong282/awesome-project-template/issues',
              },
              {
                label: 'Discussions',
                href: 'https://github.com/leonwong282/awesome-project-template/discussions',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Contributing',
                to: '/docs/community/contributing',
              },
              {
                label: 'Code of Conduct',
                to: '/docs/community/code-of-conduct',
              },
              {
                label: 'Security Policy',
                to: '/docs/community/security',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Leon Wong. Built with Docusaurus. Licensed under GPL-3.0.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
        additionalLanguages: ['bash', 'yaml', 'toml', 'ini', 'python', 'json', 'typescript', 'javascript', 'rust', 'go', 'ruby', 'shell-session'],
      },
      // Announcement bar (optional)
      announcementBar: {
        id: 'star_us',
        content:
          '⭐ If you like this template, give it a star on <a target="_blank" rel="noopener noreferrer" href="https://github.com/leonwong282/awesome-project-template">GitHub</a>!',
        backgroundColor: '#4CAF50',
        textColor: '#ffffff',
        isCloseable: true,
      },
      // Table of contents
      tableOfContents: {
        minHeadingLevel: 2,
        maxHeadingLevel: 4,
      },
      // Color mode
      colorMode: {
        defaultMode: 'light',
        disableSwitch: false,
        respectPrefersColorScheme: true,
      },
    }),
};

export default config;
