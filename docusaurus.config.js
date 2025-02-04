// @ts-check
import { themes as prismThemes } from "prism-react-renderer";

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "eDemand",
  tagline: "WRTeam",
  favicon: "img/edemand.svg",
  url: "https://your-docusaurus-site.example.com",
  baseUrl: "/",
  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  plugins: [
    require.resolve("@easyops-cn/docusaurus-search-local"),
  ],

  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: "./sidebars.js",
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ["rss", "atom"],
            xslt: true,
          },
          editUrl:
            "https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/",
          onInlineTags: "warn",
          onInlineAuthors: "warn",
          onUntruncatedBlogPosts: "warn",
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: "img/edemand.svg",
      navbar: {
        title: "eDemand",
        items: [
          {
            type: "docSidebar",
            sidebarId: "webSidebar",
            position: "left",
            label: "Web Documentation",
          },
          {
            type: "docSidebar",
            sidebarId: "appSidebar",
            position: "left",
            label: "App Documentation",
          },
          {
            type: "docSidebar",
            sidebarId: "adminSidebar",
            position: "left",
            label: "Admin Documentation",
          },
          {
            type: "docSidebar",
            sidebarId: "featuresSidebar",
            position: "left",
            label: "Features",
          },
          {
            type: "docSidebar",
            sidebarId: "changelogSidebar",
            position: "left",
            label: "Changelog",
          },
          {
            type: "docSidebar",
            sidebarId: "supportSidebar",
            position: "left",
            label: "Community",
          },
          {
            type: 'search',
            position: 'right',
          },
        ],
      },
      footer: {
        style: "dark",
        copyright: `Copyright ${new Date().getFullYear()} eDemand.`,
      },
      colorMode: {
        defaultMode: "dark",
      },
      prism: {
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;