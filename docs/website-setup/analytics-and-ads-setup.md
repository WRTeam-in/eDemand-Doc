---
sidebar_position: 10
---

# Analytics and Advertising Setup

This guide explains how to set up Microsoft Clarity and Google Analytics for your eDemand web application.

---

## Microsoft Clarity Setup

### Step 1: Get Your Clarity Project ID

1. **Sign up for Microsoft Clarity:**

   - Visit: https://clarity.microsoft.com/
   - Sign in with your Microsoft account (or create one)
     ![Microsoft Clarity project ID preview](/img/adminPanel/microsoft-clarity-new-project.png)

2. **Create a new project:**

   - Click "Add New Project"
   - Enter your website name
   - Enter your website URL
   - Select your country/region
   - Click "Create"

3. **Get your Project ID:**
   - After creating the project, you'll see a tracking code snippet
   - Your Project ID is the string at the end of the script URL
   - Example: `u5frguc1k8` (from `https://www.clarity.ms/tag/u5frguc1k8`)
     ![Microsoft Clarity project ID preview](/img/adminPanel/microsoft-clarity-project-id.png)

### Step 2: Set Your Project ID

No code editing needed — just set the env var. Open `.env.local` (copy from `.env.example` if you haven't) and set:

```env
NEXT_PUBLIC_CLARITY_PROJECT_ID=u5frguc1k8
```

:::note
The Clarity script only loads **after the visitor grants analytics consent** on the cookie banner — see `src/components/layout/consent-scripts.tsx`. It won't fire on page load even with a valid ID set.
:::

---

## Google Analytics Setup


### Step 1: Get Your Google Analytics Tracking ID

1. **Sign up for Google Analytics:**

   - Visit: https://analytics.google.com/
   - Sign in with your Google account

2. **Create a new property:**

   - Click "Admin" (gear icon)
   - Under "Property", click "Create Property"
   - Enter property name (e.g., "eDemand Website")
   - Select timezone and currency
   - Click "Next"

3. **Set up data stream:**

   - Select "Web" platform
   - Enter your website URL
   - Enter a stream name
   - Click "Create stream"

4. **Get your Measurement ID:**
   - After creating the stream, you'll see your Measurement ID
   - Format: `G-XXXXXXXXXX` (e.g., `G-J4RWHNVBG0`)
   - Copy this ID

### Step 2: Set Your Measurement ID

No code editing needed — just set the env var. Open `.env.local` and set:

```env
NEXT_PUBLIC_GA_MEASUREMENT_ID=G-J4RWHNVBG0
```

:::note
Same as Clarity above — the GA script only loads after the visitor grants analytics consent (`src/components/layout/consent-scripts.tsx`). A Consent Mode v2 denied-default stub (`pages/_document.tsx`) also runs before this, so Google collects nothing until consent is actually granted.
:::

<!--
---

## Google AdSense Setup

:::caution Not currently implemented
The current web codebase has **no AdSense integration at all** — no script, no publisher-ID hook, nothing in `pages/_document.tsx` or anywhere else. The steps below describe getting a Publisher ID from Google; adding it to the site would require new code (confirm with the dev team before promising this to a client).
:::

### Step 1: Get Your AdSense Publisher ID

1. **Sign up for Google AdSense:**

   - Visit: https://www.google.com/adsense/
   - Sign in with your Google account

2. **Add your website:**

   - Click "Add site"
   - Enter your website URL
   - Click "Continue"

3. **Complete the setup:**

   - Choose your country
   - Enter payment information
   - Submit for review (approval can take 1-14 days)

4. **Get your Publisher ID:**
   - After approval, go to "Account" → "Account information"
   - Your Publisher ID format: `ca-pub-XXXXXXXXXX`
   - Example: `ca-pub-5187122762138955`

### Step 2: Add AdSense to the Code

Since there's no existing integration, this needs an actual code change, not a config edit — likely following the same pattern as GA/Clarity above (an env var read in `src/lib/site-config.ts`, loaded conditionally in `src/components/layout/consent-scripts.tsx`). Flag this to the dev team as a feature request rather than following manually.

### Step 3: Enable Auto Ads (Optional)

After adding the AdSense script, you can enable Auto Ads:

1. Go to AdSense dashboard
2. Click "Ads" → "Overview"
3. Enable "Auto ads"
4. Google will automatically place ads on your site
-->
