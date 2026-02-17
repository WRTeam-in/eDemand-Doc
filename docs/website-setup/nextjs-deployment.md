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

## Automated Deployment (Recommended)

We have implemented a robust, automated deployment workflow designed for Custom Server (VPS) environments. This new system ensures consistent builds, optimized server configurations, and seamless updates.

To deploy the application on the VPS using the automated script:

1.  **SSH into the server** and navigate to the project directory.
2.  **Run the deployment script**:
    ```bash
    ./deploy_vps.sh
    ```
3.  **Follow the prompts**:
    *   Enter the desired PORT (default: `8001`).
    *   The script will automatically detect conflicting processes and ask to restart or replace them.

**Outcome**: The app will be running under PM2 (name: `edemand-web`), serving locally on the specified port, with Apache handling the public-facing traffic and caching.

## Manual Deployment

If you prefer to deploy manually or need to troubleshoot, follow these steps to replicate the automated process:

#### 1. Configuration & Dependencies

Ensure your `.env` file is correctly configured (see [System Configuration](./system-configuration.md)).

```bash
# Install dependencies
npm install

# (Optional) Clean old build artifacts
rm -rf .next out dist
```

#### 2. Generate Assets

Run the helper scripts to generate the sitemap and service worker:

```bash
# Generate Sitemap
node scripts/setup-sitemap.js

# Generate Service Worker
node scripts/generate-sw.js
```

#### 3. Build Application

Build the application in standalone mode. If you require SEO features, set the environment variable.

```bash
# Build with SEO enabled
export NEXT_PUBLIC_ENABLE_SEO="true"
npm run build
```

#### 4. Configure Port

Manually update the port in your `ecosystem.config.cjs` file if you are not using the default `8001`.

```javascript
// ecosystem.config.cjs
module.exports = {
  apps: [{
    // ...
    env: {
      NODE_ENV: 'production',
      PORT: 8001, // Update this value
    }
  }]
}
```

#### 5. Generate Apache Configuration
Use the included script to generate the correct .htaccess file for your port.
Ensure `NEXT_PUBLIC_ENABLE_SEO="true"` is set in your environment or `.env` file to enable performance caching.
```bash
# Replace 8001 with your chosen port
npm run generate-htaccess -- 8001

```

#### 6. Start with PM2

Start or reload the application using PM2.

```bash
# Start the application
pm2 start ecosystem.config.cjs

# Save the process list to resurrect on reboot
pm2 save
```

#### 7. Finalize Apache

Reload Apache to apply the new `.htaccess` rules (ensure `mod_rewrite` and `mod_headers` are valid).

```bash
sudo systemctl reload apache2
```

## Deployment System Details

### Key Features

*   **Standalone Build Mode**: The application is now forced to build in Next.js standalone mode. This produces a lightweight, production-ready Node.js server (`server.js`) that minimizes memory usage and removes the need for the entire `node_modules` directory in production.
*   **Automated Deployment Script**: A single script (`deploy_vps.sh`) handles the end-to-end deployment lifecycle:
    *   **Safety Checks**: Verifies ports and detects conflicting PM2 processes (e.g., auto-resolving conflicts between `edemand-web` and test instances).
    *   **Clean Build**: Removes stale artifacts (`.next`, `out`) to prevent cache inconsistencies.
    *   **Asset Generation**: Automatically runs scripts to generate the `sitemap.xml`, `robots.txt`, and `firebase-messaging-sw.js` before building.
    *   **Dynamic Configuration**: Updates `ecosystem.config.cjs` with the selected port at runtime.
    *   **Smart Apache Configuration**: Introduces a dynamic `.htaccess` generator (`scripts/generate-htaccess.js`) that:
        *   Configures Reverse Proxy rules to route traffic to the Node.js server.
        *   Serves static assets (`/_next/static`, public images) directly via Apache for maximum speed.
    *   **SEO Mode**: When enabled, injects high-performance caching headers (Cache-Control, Expires) to improve Google PageSpeed Insights scores.

### New Scripts & Files

| Script/File | Description |
| :--- | :--- |
| `deploy_vps.sh` | Main deployment entry point. Run this on the VPS to deploy. prompts for a PORT and handles the rest. |
| `scripts/generate-htaccess.js` | Generates the Apache `.htaccess` file programmatically based on the active PORT and `NEXT_PUBLIC_ENABLE_SEO` flag. |
| `package.json` | Added "generate-htaccess" command. Updated "build" to use --webpack (disabling Turbopack for compatibility). |
| `next.config.mjs` | Configuration reduced to force output: 'standalone' regardless of environment, ensuring reliability. |

### Integration Notes for Developers

:::caution Important
If you need to change the caching logic or rewrite rules, **do not edit `.htaccess` directly**. Instead, modify `scripts/generate-htaccess.js`. The `.htaccess` file is regenerated every time `npm run generate-htaccess` or `./deploy_vps.sh` is run, so manual changes will be lost.
:::
