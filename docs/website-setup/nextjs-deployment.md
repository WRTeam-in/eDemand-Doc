---
sidebar_position: 11
---

# Next.js Deployment

This guide explains how to deploy your eDemand web application with SEO support using Next.js on a VPS server.

:::warning
This is an advanced deployment option for users who have a VPS server and are familiar with Node.js, npm, and pm2. The instructions assume you're using a Debian-based Linux distribution.
:::

:::info Server Compatibility
The **Automated** and **Manual** deployment methods described below are specifically configured for **Apache** web servers (using `.htaccess` for reverse proxy and rewrite rules).

Different web servers (like Nginx) require different configuration. If you are using a different server environment and encounter issues, please **connect with our technical team**, and we will surely help you.
:::

## Uploading Your Project

Before starting deployment, upload your project to the server:

1. Use an FTP client like [FileZilla](https://filezilla-project.org/download.php) to upload your project files to your server
2. Alternatively, use Git to clone your repository directly on the server

## Installing Node.js

Node.js can be installed using NVM (Node Version Manager) to easily manage multiple Node.js versions:

```bash
sudo apt install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc  # or restart your terminal
nvm install node 20.*
```

Verify the installation with:

```bash
node -v
```

For more information, refer to the [official Node.js documentation](https://nodejs.org/docs/latest/api/).

## Installing PM2

PM2 is a production process manager for Node.js applications. Install it globally with:

```bash
npm install pm2 -g
```

:::caution Doc under revision
The codebase moved to Next.js 16 (Pages Router) and this page is being updated to match. The `deploy_vps.sh` automated script and `ecosystem.config.cjs` PM2 file referenced in the previous version of this guide are **not present in the current repo** — confirm with the dev team whether an automated script still exists before relying on this section. The manual steps below reflect what's actually in the repo today.
:::

## Manual Deployment

#### 1. Configuration & Dependencies

Ensure your `.env` file is correctly configured (see [System Configuration](./system-configuration.md)).

```bash
# Install dependencies
npm install

# (Optional) Clean old build artifacts
npm run clean
```

#### 2. Build Application

Sitemap and `.htaccess` generation now run automatically as part of the build (via the `prebuild` npm hook) — no separate asset-generation step needed. Set `NEXT_PUBLIC_SEO=true` (in `.env` or your shell) if you require SEO/VPS mode, which also switches the build to Next's `standalone` output:

```bash
# Build with SEO enabled
export NEXT_PUBLIC_SEO="true"
npm run build
```

#### 3. Configure Apache Proxy Port

The `.htaccess` proxy port is set when it's generated (part of `prebuild`, see below), not in a separate PM2 config file. Default is `8001`.

#### 4. Generate Apache Configuration (if regenerating outside a build)

```bash
# Replace 8001 with your chosen port
npm run generate:htaccess -- 8001
```

#### 5. Start with PM2

```bash
# Start the application
pm2 start npm --name edemand-web -- start

# Save the process list to resurrect on reboot
pm2 save
```

:::note
Confirm with the dev team whether an `ecosystem.config.cjs` file should be reintroduced for this project — it is not currently part of the repo.
:::

#### 6. Finalize Apache

Reload Apache to apply the new `.htaccess` rules (ensure `mod_rewrite` and `mod_headers` are valid).

```bash
sudo systemctl reload apache2
```

## Deployment System Details

### Key Features

*   **Config-Driven Output Mode**: `next.config.ts` picks the build's `output` mode automatically — `standalone` when `NEXT_PUBLIC_SEO=true` and not on Vercel, `export` when SEO is disabled, and left unset on Vercel (Vercel's own build pipeline expects the default output).
*   **Automatic Asset Generation**: `scripts/setup-sitemap.mjs` and `scripts/generate-htaccess.mjs` both run automatically via the `prebuild` npm hook (see `package.json`) — no manual script calls needed for a normal `npm run build`.
*   **Smart Apache Configuration**: `scripts/generate-htaccess.mjs` generates the correct `.htaccess` for the active mode:
    *   `NEXT_PUBLIC_SEO=true` → reverse-proxy rules routing traffic to the Node.js server.
    *   `NEXT_PUBLIC_SEO=false` (or unset) → static-file rewrite rules for the exported `out/` build.

### Scripts & Files

| Script/File | Description |
| :--- | :--- |
| `scripts/generate-htaccess.mjs` | Generates the Apache `.htaccess` file based on the active port and `NEXT_PUBLIC_SEO` flag. Run via `npm run generate:htaccess`. |
| `scripts/setup-sitemap.mjs` | Generates the sitemap. Run via `npm run generate:sitemap`. |
| `scripts/generate-pwa-assets.mjs` | Generates PWA icon assets. Run via `npm run pwa:assets`. |
| `scripts/clean-build.mjs` | Removes stale build artifacts. Run via `npm run clean`. |
| `next.config.ts` | TypeScript config; picks `output` mode per build phase and `NEXT_PUBLIC_SEO`/Vercel detection (see above). |

### Integration Notes for Developers

:::caution Important
If you need to change the caching logic or rewrite rules, **do not edit `.htaccess` directly**. Instead, modify `scripts/generate-htaccess.mjs`. The `.htaccess` file is regenerated every time `npm run generate:htaccess` or `npm run build` is run, so manual changes will be lost.
:::
