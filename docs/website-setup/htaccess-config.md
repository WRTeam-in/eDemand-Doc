---
sidebar_position: 12
---

# .htaccess Configuration

This guide explains how to configure your Apache web server for both static and dynamic (SEO-enabled) deployments of the eDemand web application using .htaccess rules.

:::tip Automated Configuration
The `.htaccess` file is **automatically generated** by `scripts/generate-htaccess.mjs`, which runs as part of the `generate:htaccess` npm script — itself run automatically during `npm run build` (via the `prebuild` hook).

To generate (or regenerate) it manually, with an optional proxy port argument (defaults to `8001`):

```bash
npm run generate:htaccess -- 8001
```

**Do not edit `.htaccess` directly.** Any manual changes will be overwritten on the next build. Instead, modify `scripts/generate-htaccess.mjs` if you need to change rewrite rules or caching logic — it selects which of the two configurations below to write based on `NEXT_PUBLIC_SEO`.
:::

## Apache Configuration (.htaccess)

### Option 1: Static File Hosting (`NEXT_PUBLIC_SEO` unset or `false`)

Generated for the static export build (`npm run build` → `out/`). Dynamic-segment routes (`service-details`, `provider-details`, `booking`, `my-service-request-details`, `blog-details`, `custom-page`, `chats`) are rewritten to their shared `[lang]/…` export files, once locale-prefixed and once bare (no locale prefix, since the default locale is served unprefixed):

```apache
Options -Indexes -MultiViews
RewriteEngine On
RewriteBase /

# No server exists to detect the visitor's locale under static export —
# serve the default locale's shared build directly at "/", internally, so
# the URL never shows "/en".
RewriteRule ^$ /[lang].html [L]

# Serve a real file exactly as requested (e.g. /_next/static/..., /favicon.ico).
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

# Prefer a route's own flat "<path>.html" export over the same-named directory.
RewriteCond %{DOCUMENT_ROOT}/$1.html -f
RewriteRule ^(.*[^/])/?$ $1.html [L]

# Dynamic-segment routes, locale-prefixed -> shared build's literal bracket-named file.
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/service-details/.*$ /[lang]/service-details/[...slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/provider-details/.*$ /[lang]/provider-details/[...slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/booking/.*$ /[lang]/booking/[...slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/my-service-request-details/.*$ /[lang]/my-service-request-details/[...slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/blog-details/.*$ /[lang]/blog-details/[slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/custom-page/.*$ /[lang]/custom-page/[slug].html [L]
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/chats(/.*)?$ /[lang]/chats/[[...chatId]].html [L]

# Same dynamic-segment routes again, bare (no locale prefix).
RewriteRule ^service-details/.*$ /[lang]/service-details/[...slug].html [L]
RewriteRule ^provider-details/.*$ /[lang]/provider-details/[...slug].html [L]
RewriteRule ^booking/.*$ /[lang]/booking/[...slug].html [L]
RewriteRule ^my-service-request-details/.*$ /[lang]/my-service-request-details/[...slug].html [L]
RewriteRule ^blog-details/.*$ /[lang]/blog-details/[slug].html [L]
RewriteRule ^custom-page/.*$ /[lang]/custom-page/[slug].html [L]
RewriteRule ^chats(/.*)?$ /[lang]/chats/[[...chatId]].html [L]

# Locale root (e.g. "/en/", "/en") -> the shared build's own root export.
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/?$ /[lang].html [L]

# Everything else under a locale prefix -> the shared "[lang]" build.
RewriteRule ^[a-z]{2}(-[A-Z]{2})?/(.*)$ /[lang]/$2.html [L]

# Everything else, bare -> the shared "[lang]" build, only if it exists
# (prevents an infinite-redirect 500 on a genuinely bad URL).
RewriteCond %{DOCUMENT_ROOT}/[lang]/$1.html -f
RewriteRule ^(.*)$ /[lang]/$1.html [L]

ErrorDocument 404 /404.html
```

:::note
`[`/`]` are literal, safe characters in a RewriteRule's **target** (substitution) — only the **pattern** treats them as regex. Percent-encoding them (`%5B`/`%5D`) is a bug: `%5` in a target is mod_rewrite's backreference syntax, not a hex escape, so it silently produces the wrong filename.
:::

### Option 2: Reverse Proxy with SEO Optimization (`NEXT_PUBLIC_SEO=true`)

Generated for the standalone/VPS build. PM2 runs `next start` on `127.0.0.1:<port>` (default `8001`, or whatever port you pass to `generate:htaccess`); Apache reverse-proxies everything to it except static assets served directly off disk:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /

    RewriteRule ^favicon\.ico$ - [L]

    # Allow SSL certificate verification
    RewriteRule ^.well-known/acme-challenge/(.*) /.well-known/acme-challenge/$1 [L]

    # Serve Next.js STATIC files directly from filesystem (JS/CSS bundles).
    # Only _next/static/ — not all of _next/ (data/image requests still need the proxy).
    RewriteRule ^_next/static/(.*) /.next/static/$1 [L]

    # Proxy Next.js DATA requests to the Node process (required for client-side navigation).
    RewriteRule ^_next/data/(.*) http://127.0.0.1:8001/_next/data/$1 [P,L]

    # Serve public/'s own static files directly.
    RewriteCond %{REQUEST_URI} \.(js|css|svg|jpg|jpeg|png|gif|ico|woff|woff2|ttf|eot|webp|mp4|webm)$
    RewriteRule ^ - [L]

    # Forward everything else to the Node process.
    RewriteRule ^index.html http://127.0.0.1:8001/$1 [P]
    RewriteRule ^index.php http://127.0.0.1:8001/$1 [P]
    RewriteRule ^/?(.*)$ http://127.0.0.1:8001/$1 [P]
</IfModule>
```

## Important Notes

1. **Port Configuration**:
   - The port isn't set in `package.json` — pass it to the generator instead: `npm run generate:htaccess -- <port>` or set `HTACCESS_PROXY_PORT` in your environment. Defaults to `8001`.
   - Make sure your PM2 process (`next start`) is actually listening on the same port you generated the `.htaccess` for.

2. **SSL/HTTPS**:
   - For production, always use HTTPS
   - Configure SSL certificates in your Apache virtual host configuration

3. **File Permissions**:
   - Ensure proper file permissions for your web server
   - Apache should have read access to all files
   - Node.js process should have necessary permissions for dynamic content

4. **Performance Tips**:
   - Enable gzip compression in Apache configuration
   - Set appropriate cache headers for static content
   - Use CDN for static assets in production

5. **Troubleshooting**:
   - Check Apache error logs if you encounter issues
   - Verify that mod_rewrite is enabled for Apache
   - Make sure mod_proxy is enabled when using Option 2 (Reverse Proxy)

Remember to reload Apache (`sudo systemctl reload apache2`) after every regenerated `.htaccess` — i.e. after every build, or every manual `npm run generate:htaccess` run.