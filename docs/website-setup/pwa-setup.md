---
sidebar_position: 6
---

# Progressive Web App (PWA) Setup

Progressive Web Applications (PWAs) combine the best features of web and mobile apps. They are installable on devices and provide an app-like experience while remaining accessible via web browsers.

The eDemand web codebase ships with the eDemand logo, name, and colors as **defaults**. Rebranding is a handful of file edits plus one command that regenerates every icon and splash-screen size for you — no design tool or online favicon converter required.

---

## What you'll change

| # | What | Filename | Folder |
|---|------|----------|--------|
| 1 | Your logo (used for every icon + splash screen) | `splash_logo.svg` | `public/` |
| 2 | Fallback logo (only used if #1 is missing) | `app_logo_icon.png` | `public/` |
| 3 | Generate all icon/splash sizes | — one terminal command | project root |
| 4 | App name shown on install/home screen | `manifest.json` | `public/` |
| 5 | App name used in-app (titles, emails, etc.) | `site-config.ts` | `src/lib/` |
| 6 | Brand color | your admin panel's theme colors — read automatically | — |
| 7 | iOS install title | `_document.tsx` | `pages/` |
| 8 | Turn the install prompt on | `site-config.ts` | `src/lib/` |

:::note
There is **no `.env` variable** for enabling PWA anymore — that used to be `NEXT_PUBLIC_PWA_ENABLED`, but the toggle now lives in code (`pwaEnabled` in `site-config.ts`, Step 7 below).
:::

---

## Step 1 — Prepare your logo file

Add this file: **`public/splash_logo.svg`** — the one image every generated asset is built from (app icon, Android adaptive icon, iOS home screen icon, every splash screen size).

Requirements:

- **White or very light-colored** logo — a mark, a wordmark, or both together. It gets placed on top of a solid brand-color fill, so it needs to read clearly against a flat color.
- **Transparent background** — no white/colored box around it, just the logo shape itself. The generator paints the background for you using your live brand color.
- **SVG format recommended** (scales perfectly from a 96×96 icon up to a 2048×2732 iPad splash screen). A transparent-background PNG also works — provide one at 1000px+ wide so it doesn't look soft when scaled up.
- Filename and location must match exactly: **`public/splash_logo.svg`**.

**Optional fallback — `public/app_logo_icon.png`**: used only if `splash_logo.svg` is missing, cropped square. Must be square, 512×512px or larger, PNG, no transparency needed. You only need one of these two files.

## Step 2 — Drop the file in

Copy your logo to the exact path, overwriting what's there:

```
public/splash_logo.svg
```

## Step 3 — Generate every icon and splash screen

Run this once from the project root:

```bash
npm run pwa:assets
```

This also fetches your **actual configured brand color** from your backend's theme-colors settings (the same color your admin panel already lets you customize) and:

- Paints every icon's and every splash screen's background with it, your logo centered on top.
- Writes it into `manifest.json`'s `theme_color` / `background_color`.

You never hardcode a hex color — change your brand color in the admin panel, re-run this command, done. (If the backend isn't reachable when you run it, it falls back to whatever color is already in `manifest.json`.)

This single command reads `splash_logo.svg` and writes every size a real install needs straight into `public/`:

- `icon.png`, `icon-192.png`, `icon-512.png`, `apple-icon.png` — standard app icons
- `maskable-icon-512.png` — Android adaptive icon, padded 10% so launchers that crop it to a circle/squircle/teardrop don't clip your logo
- 11× `apple-splash-*.png` — iOS's launch loading screen, one image per device size

**Re-run this command any time you update the logo or brand color** — nothing else needs to change, it overwrites the same files.

## Step 4 — Set your app name

`theme_color` / `background_color` in `public/manifest.json` are already handled by Step 3 — you only need to set the name fields:

```json
{
  "name": "Your Company Name",
  "short_name": "YourApp",
  "start_url": "/",
  "scope": "/",
  "icons": [ /* leave as-is — filenames match what Step 3 generated */ ],
  "theme_color": "#FF8800",
  "background_color": "#FF8800"
}
```

- **`name`** — full name shown on the "Install app?" confirmation screen.
- **`short_name`** — label under the home-screen icon. Keep it short (~12 characters) or Android truncates it with "…".
- **`theme_color`** / **`background_color`** — leave these alone; `npm run pwa:assets` keeps them synced to your admin panel's brand color.

## Step 5 — Set your app name in-app

Open `src/lib/site-config.ts`:

```ts
export const siteConfig = {
  appName: "Your Company Name",
  pwaEnabled: true,
  ...
};
```

`appName` is used throughout the app beyond just the PWA — page titles, the "Open in App" prompt, OTP/email copy, etc. Keep it consistent with `manifest.json`'s `name`.

## Step 6 — Set the iOS install title

Open `pages/_document.tsx` and find:

```tsx
<meta name="apple-mobile-web-app-title" content="eDemand" />
```

Change `"eDemand"` to your app name — this is what shows under the icon when someone adds your site to their iPhone home screen.

## Step 7 — Turn on the install prompt

Still in `src/lib/site-config.ts`:

```ts
pwaEnabled: true,
```

Set to `true` to show the "Install app" prompt to visitors. Set to `false` to hide it — the site still works as a normal responsive web app either way, this only controls the install banner.

---

## What's dynamic vs. what needs regenerating

The OS reads icons, splash screens, and `theme_color` from the **static files in `public/`** once, at install/launch time — those never update themselves. Two things *do* self-correct once your app's JS loads:

- **Status bar color** — updates the live `<meta name="theme-color">` tag to match the brand color loaded from your admin panel at that moment.
- **`manifest.json`'s colors, live** — the page's `<link rel="manifest">` swaps to a version with `theme_color` / `background_color` patched to the current brand color, fetched fresh (works even on a static-export/shared-hosting deploy). The icons listed inside that manifest are still the static files, unchanged.

So in practice:

- **Returning visitor** — status bar corrected before first paint, no flash.
- **First-ever visit** — briefly shows `manifest.json`'s color, then corrects once settings load.
- **Icons and splash screens** — always the static files. Changing your brand color in the admin panel does **not** regenerate these — re-run `npm run pwa:assets` and redeploy for a new install to pick up the new color/logo. Already-installed users additionally need to uninstall and reinstall (see Troubleshooting).

## Step 8 — Verify it worked

1. Run the app (`npm run dev` or your deployed build).
2. Open Chrome DevTools → **Application** tab → **Manifest** panel — confirms your name, colors, and icons all loaded correctly, and flags any errors.
3. Run a **Lighthouse** audit (DevTools → Lighthouse → check "Progressive Web App") — flags anything still missing.
4. **iOS splash screens can only be seen on a real device or the Xcode Simulator** — Chrome's device emulation does not render them. Add the site to your home screen from an actual iPhone/iPad Safari to confirm the splash screen shows your logo.

---

## Troubleshooting

**Old icon still showing after rebranding?**
Browsers cache install icons aggressively. Remove the app from your home screen and re-install it, or clear the site's data in browser settings.

- **iOS**: a plain remove/re-add often isn't enough. Settings → Safari → Advanced → Website Data → delete your domain, then force-quit Safari before re-adding.
- **Android/Chrome**: uninstall the app, then Chrome menu → Settings → Site settings → find your domain → Clear & reset (or clear Chrome's app data entirely from Android system settings) before reinstalling. Google's WebAPK "minting" service also caches your manifest/icons server-side for a while — if a fresh install still shows the old icon after clearing everything client-side, that cache hasn't expired yet.
- **Either platform**: confirm the rebrand was actually **deployed** — regenerating files locally with `npm run pwa:assets` does nothing for real users until that commit is built and live.

**Splash screen shows a color seam around my logo?**
`npm run pwa:assets` writes the same brand color into both the splash PNGs and `manifest.json`'s `background_color` in one pass. If you hand-edited `manifest.json`'s `background_color` afterwards, that's the mismatch — re-run `npm run pwa:assets` to put them back in sync.

**Brand color didn't pick up — splash/manifest still show the old color?**
The script fetches from `NEXT_PUBLIC_API_URL` (your `.env.local`) at `get_theme_colors` — confirm that endpoint is reachable and returns your current color (check the "Using brand color: ..." line the script prints). If it can't reach the API, it silently falls back to whatever's already in `manifest.json`.

**Want to change the icon padding, or fall back to a plain hex color instead of fetching from the API?**
Edit `scripts/generate-pwa-assets.mjs` directly — `fetchBrandColor()` controls where the color comes from, the `icons` array controls padding per size.

---

## Benefits of PWA for Your eDemand Application

- **Installable**: Users can add your app to their home screen without app store requirements
- **Responsive**: Works on any device with a browser
- **App-like Experience**: Provides a seamless, immersive user experience
- **Fresh Content**: Always updated when online
- **Safe**: Served via HTTPS to ensure content hasn't been tampered with
- **Discoverable**: Identifiable as an "application" by search engines
- **Re-engageable**: Can use push notifications to re-engage users
- **Linkable**: Can be shared via URL without requiring installation

> **Note:** While PWAs can provide some caching benefits, the eDemand application requires network connectivity to function properly as it relies on API calls to fetch data.
