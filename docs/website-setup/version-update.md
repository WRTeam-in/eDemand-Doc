---
sidebar_position: 13
---

# New Version Update

Follow these steps to update to a new version of the web app. Choose deployment based on whether your site is configured with SEO or without SEO.

1. **Extract the ZIP File**:
   Extract the ZIP file containing the web code that you received from Codecanyon.

2. **Open the Code in VS Code**:
   Open the extracted web code in Visual Studio Code (VS Code).

3. **Edit the `.env.local` File**:
   Copy `.env.example` to `.env.local` (if you haven't already) and set `NEXT_PUBLIC_API_URL` to your admin API URL. See [Website Setup Locally](./website-setup.md) for the full list of variables and where each one comes from.

4. **Configure Firebase**:
   Open the Firebase Console. Follow the steps outlined in the [Firebase Setup documentation](./firebase.md). Add the Firebase details to the `.env.local` file of your web project.

5. **Install Dependencies**:
   Run the following command to install the necessary dependencies:

   ```bash
   npm install
   ```

6. **Choose your deployment option**:

   ### Option A: Without SEO (static export)
   - Make sure `.env.local` does **not** set `NEXT_PUBLIC_SEO=true` (unset, or `false`), then build the project locally (generates the `out` folder — `next.config.ts` switches to static export automatically when SEO is off):

     ```bash
     npm run build
     ```

   - Upload the contents of the `out` folder to your domain's public directory (e.g., `public_html`). The `.htaccess` for this mode is generated automatically as part of the build — no manual step needed.

   ### Option B: With SEO (build on server)
   - Upload your updated source code to the server.
   - On your VPS, install dependencies and build on the server with `NEXT_PUBLIC_SEO=true` set (in `.env.local` or your shell) — this keeps SEO/standalone behavior intact:

     ```bash
     export NEXT_PUBLIC_SEO="true"
     npm run build
     ```

   - If you're already using PM2, you do not need to create a new PM2 app. Simply restart the existing PM2 process after the build so the update takes effect:

     ```bash
     pm2 restart <your-existing-process-name>
     ```

   - Or restart by process ID:

     1. List processes and note the ID:

        ```bash
        pm2 ls
        ```

     2. Restart using the ID (example uses ID 0):

        ```bash
        pm2 restart 0
        ```

7. **Need more details?**

- For the full SEO (VPS) deployment flow, see: [Next.js Deployment](./nextjs-deployment.md)
- For static hosting without SEO, see: [Deployment Without SEO](./deployment-without-seo.md)
