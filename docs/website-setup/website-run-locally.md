---
sidebar_position: 4
---

# Run Website Locally

## Install Packages and Dependencies

Install Packages and Dependencies. Run the command below to install all the required dependencies and packages:

   ```bash
   npm i
   ```

## Start the web app

Hit the below command to start the app and to check local server browser:

   ```bash
   npm run dev
   ```

This first runs `predev` (generates the sitemap), then starts the Next.js dev server. Once ready, the terminal prints something like:

```
▲ Next.js 16.3.1
- Local:        http://localhost:3000
- Network:      http://192.168.x.x:3000

✓ Ready in 1.2s
```

Leave this terminal running — it stays active and hot-reloads on file changes until you stop it (`Ctrl+C`).

## Open the browser
Open browser, navigate to localhost:3000

Check everything in a local browser (e.g., Google Chrome). Once everything works correctly, proceed to the deployment step.