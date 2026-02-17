---
sidebar_position: 12
---

# .htaccess Configuration

This guide explains how to configure your Apache web server for both static and dynamic (SEO-enabled) deployments of the eDemand web application using .htaccess rules.

:::tip Automated Configuration
If you're using the **automated deployment script** (`deploy_vps.sh`) or the `npm run generate-htaccess` command, the `.htaccess` file is **automatically generated**.

**Do not edit `.htaccess` directly.** Any manual changes will be overwritten during the next deployment. Instead, modify the `scripts/generate-htaccess.js` file if you need to change rewrite rules or caching logic.
:::

## Apache Configuration (.htaccess)

### Option 1: Static File Hosting (Default Configuration)

```apache
 <IfModule mod_rewrite.c>
      RewriteEngine On
      RewriteBase /

      # Enable symlinks
      Options +FollowSymLinks

      # If the request is for a file that exists, serve it directly
      RewriteCond %{REQUEST_FILENAME} -f [OR]
      RewriteCond %{REQUEST_FILENAME} -d
      RewriteRule ^ - [L]

      # Handle Next.js static files and assets
      RewriteRule ^_next/(.*)$ _next/$1 [L]
      RewriteRule ^static/(.*)$ static/$1 [L]
      RewriteRule ^manifest\.json$ manifest.json [L]

      # Test rule for search - redirect to actual file
      RewriteRule ^search/([^/]+)/?$ search/[slug].html [L]

      # Test rule for service
      RewriteRule ^service/(.*)/?$ service/[...slug].html [L]

      # Test rule for booking
      RewriteRule ^booking/(.*)/?$ booking/[...slug].html [L]

      # Test rule for provider-details
      RewriteRule ^provider-details/(.*)/?$ provider-details/[...slug].html [L]

      # Test rule for my-service-request-details
      RewriteRule ^my-service-request-details/(.*)/?$ my-service-request-details/[...slug].html [L]

      # Test rule for blog-details
      RewriteRule ^blog-details/([^/]+)/?$ blog-details/[slug].html [L]

      # Handle static HTML files
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteCond %{DOCUMENT_ROOT}/$1.html -f
      RewriteRule ^([^/]+)/?$ $1.html [L]

      # Handle directory index files
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteCond %{DOCUMENT_ROOT}/$1/index.html -f
      RewriteRule ^([^/]+)/?$ $1/index.html [L]

      # Final fallback to 404 page
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteRule ^ 404.html [L]
    </IfModule>
```

### Option 2: Reverse Proxy with SEO Optimization


```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    
    RewriteRule ^favicon\.ico$ - [L]
    
    # Allow SSL certificate verification
    RewriteRule ^.well-known/acme-challenge/(.*) /.well-known/acme-challenge/$1 [L]

    # Serve Next.js STATIC files directly from filesystem (JS/CSS bundles)
    # IMPORTANT: Only match _next/static/, NOT all _next/ requests!
    RewriteRule ^_next/static/(.*) /.next/static/$1 [L]
    
    # Proxy Next.js DATA requests to Node.js server (required for client-side navigation)
    RewriteRule ^_next/data/(.*) http://127.0.0.1:8001/_next/data/$1 [P,L]
    
    # Serve public folder static files directly
    RewriteCond %{REQUEST_URI} \.(js|css|svg|jpg|jpeg|png|gif|ico|woff|woff2|ttf|eot|webp|mp4|webm)$
    RewriteRule ^ - [L]
    
    # Forward all other requests to Node.js server
    RewriteRule ^index.html http://127.0.0.1:8001/$1 [P]
    RewriteRule ^index.php http://127.0.0.1:8001/$1 [P]
    RewriteRule ^/?(.*)$ http://127.0.0.1:8001/$1 [P]
</IfModule>
```

## Important Notes

1. **Port Configuration**: 
   - Make sure the Node.js server port (8001) matches your `package.json` configuration
   - Update the port in the configurations if you're using a different port

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

Remember to restart your Apache web server after making changes to these configurations. 