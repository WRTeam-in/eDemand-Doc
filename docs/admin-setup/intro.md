---
id: admin-intro
sidebar_position: 1
---

import DocBanner from '@site/src/components/doc-banner/DocBanner';

# Admin Panel Prerequisites

<DocBanner />

:::note
**Recommended:** Deploy the admin panel on a subdomain when you use the web application.
:::

---

## What You Need Before You Start

Check the items below **before** you install the admin panel. This avoids errors during setup and when uploading files.

---

## 1. Server Requirements (All Hosting)

Your server must meet these settings. You can change them in your **php.ini** file (or in your hosting control panel if it edits PHP settings).

### PHP Version

| Requirement | Value |
|------------|--------|
| **PHP version** | **8.3** (recommended) |

### Upload and Post Size

| Setting | Required value | Purpose |
|--------|-----------------|---------|
| **max_upload_size** | **100M** | Allows uploading files up to 100 MB. |
| **post_max_size** | **100M** | Must be at least as large as max_upload_size. |

### Time Limits

| Setting | Recommended value | Purpose |
|--------|--------------------|---------|
| **max_execution_time** | **300** (seconds) | Prevents long tasks from being cut off. |
| **max_input_time** | **300** (seconds) | Gives enough time for large form submissions. |

:::tip
**Where to change these:** In **php.ini**, set the values above. On shared hosting, use the control panel (e.g. cPanel) and look for "PHP settings" or "Select PHP version" → "Options".
:::

---

## 2. Extra Requirements

If your admin panel runs on a **VPS (Virtual Private Server)**, follow the extra steps in this section. If you use **shared hosting**, you can skip this part.

:::info
**VPS users:** Apply the recommendations in the **[VPS Essentials](#vps-essentials)** section below. They cover web server, database, PHP functions, and extensions.
:::

### VPS Essentials

1. **Web server:** Use **Apache** (recommended) instead of Nginx.
2. **Database:** Use **MySQL** (recommended) instead of MariaDB.
3. **PHP function:** Enable **putenv**. If it is in your "disabled functions" list, remove it or enable it.
4. **PHP extensions:** Install and enable:
   - **mbstring**
   - **fileinfo**
   - **intl**

:::caution
If you skip these VPS steps, the admin panel may not work correctly on your server.
:::

:::note
**If you use NGINX:** You must ensure correct server configuration from your side. We do not provide support for server or environment configuration. This applies to both **shared hosting** and **VPS hosting**.
:::

---

## 3. DNS Configuration

On a VPS, your domain must point to your server’s IP address. Add the DNS records below at your domain registrar or DNS provider (e.g. Cloudflare, GoDaddy, Namecheap).

### Main domain (root)

Point your main domain to the VPS by adding an **A record**:

| Field   | Value |
|--------|--------|
| **Type** | A |
| **Name / Host** | `@` (meaning “root domain”) |
| **Value / Points to** | Your VPS server’s IP address |
| **TTL** | 300 or default |

**Example:** To point `yourdomain.com` to VPS IP `203.0.113.50`:

| Type | Name | Value |
|------|------|--------|
| A | @ | 203.0.113.50 |

### Subdomain (e.g. admin panel)

Point a subdomain to the same VPS by adding an **A record** with the subdomain as the name (alias):

| Field   | Value |
|--------|--------|
| **Type** | A |
| **Name / Host** | The subdomain (e.g. `admin`, `panel`, or `app`) |
| **Value / Points to** | Your VPS server’s IP address (same as main domain) |
| **TTL** | 300 or default |

**Example:** To use `admin.yourdomain.com` for the admin panel and your VPS IP is `203.0.113.50`:

| Type | Name | Value |
|------|------|--------|
| A | admin | 203.0.113.50 |

Visitors will use `https://admin.yourdomain.com`. The **Name** is the part before your main domain.

:::tip
DNS changes can take a few minutes up to 48 hours to apply. After adding the records, you can verify propagation using a tool such as [DNS Checker](https://dnschecker.org). Then try opening your domain or subdomain in a browser.
:::

---

## Quick Checklist

Before installing, confirm:

- [ ] PHP version is **8.3** (or as recommended).
- [ ] **max_upload_size** = **100M**
- [ ] **post_max_size** = **100M**
- [ ] **max_execution_time** and **max_input_time** = **300** (or higher).
- [ ] If you use a **VPS**, you have applied the [VPS Essentials](#vps-essentials) above.
- [ ] If you use a **VPS**, you have added the [DNS A records](#3-dns-configuration-vps-only) for your domain and subdomain.

When all items are done, you can continue to installation: **Shared hosting** → [Installation](./installation.md). **VPS** → [Visit the install URL](./installation.md#install-url-step) (direct link to the step where you open the install URL in your browser).
