---
sidebar_position: 13
---

# How to Separate Provider and Handyman App

By default, Provider and Handyman use the same app codebase. If you want them as two independent apps, you can split it into a separate app setup.

---

### 🔧 What You Need to Do

- [Change Package Name](./change-package-name.md) — give the Handyman app its own unique package name/bundle ID
- [Change App Name](./change-app-name.md) — set a distinct app name for the Handyman app
- [Change App Icon](./change-app-icon.md) — set a distinct icon for the Handyman app
- Publish it as a new, separate listing on the Play Store/App Store

---

> ⚠️ **Important:**
Since it's the same codebase, repeat the above setup on a separate build for the Handyman app, then submit it to the stores as a new listing (not an update to the existing Provider app).
