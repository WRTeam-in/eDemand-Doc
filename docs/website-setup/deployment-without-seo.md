---
sidebar_position: 7
---

# Deployment Without SEO

If you don't require SEO functionality, you can deploy your eDemand web application on a standard shared hosting server using this simplified approach.

## Building Your Application

After making all necessary changes to your web application:

1. Open VS Code terminal by pressing `CTRL+J` in Windows/Linux or `CMD+J` in macOS
2. Make sure `.env` does **not** set `NEXT_PUBLIC_SEO=true` (unset, or `false`), then run the build:

```bash
npm run build
```

With SEO disabled, `next.config.ts` automatically sets `output: "export"`, so this single command produces the static export.

## Output Files

After the build process completes:

1. Navigate to the `out` folder in your project directory
2. This folder contains all the files needed for deployment
3. **Important:** Only upload files from the `out` folder to your server

## Uploading to Your Server

You can use any FTP client (like FileZilla) or your hosting control panel to upload the files:

1. Connect to your hosting server
2. Navigate to the public directory (often named `public_html`, `www`, or `htdocs`)
3. Upload all files and folders from the `out` directory
4. Maintain the same folder structure as in the `out` directory

## Adding the .htaccess File (Important for URL Rewriting)

You no longer need to write this file by hand — it's generated automatically.

`npm run build` runs `generate:htaccess` as part of its `prebuild` step (via `scripts/generate-htaccess.mjs`), which writes `public/.htaccess` for you based on your `NEXT_PUBLIC_SEO` setting. Since `public/` is copied into `out/` during export, the correct `.htaccess` is already included when you upload the `out` folder — no manual step needed.

See [.htaccess Configuration](./htaccess-config.md) for the exact rules it generates and how to customize them.

## Configuring Your Domain

Once all files are uploaded:

1. Point your domain to the directory containing the uploaded files
2. If necessary, configure your DNS settings to point to your hosting server
3. Wait for DNS propagation (can take up to 24-48 hours)

## Testing Your Deployment

After deployment:

1. Visit your website using your domain name
2. Verify that all pages load correctly
3. Test all functionality (search, user registration, login, etc.)
4. Check that all assets (images, styles, scripts) are loading properly

## Troubleshooting

If you encounter issues:

- Check your server error logs
- Verify that all files were uploaded correctly
- Ensure your hosting environment supports modern JavaScript applications
- Check if any server configuration is blocking your application (e.g., `.htaccess` rules)

## Additional Resources

For more detailed information about Next.js deployment, refer to the [official Next.js deployment documentation](https://nextjs.org/docs/pages/building-your-application/deploying).
