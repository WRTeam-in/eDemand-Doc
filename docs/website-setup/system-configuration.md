---
sidebar_position: 5
---

# System Configuration

## Language Configuration

:::tip  
Get Your Language Codes → [Get language codes](https://developers.google.com/admin-sdk/directory/v1/languages)
:::

### Add a New Language

Language management is now handled through the admin panel. Follow these simple steps:

#### Step 1: Access Language Settings
1. **Login to Admin Panel**: Go to your admin panel dashboard
2. **Navigate to Languages**: Click on **System Settings > Language Settings**

![add-lang-form](../../static/img/web/lang_add.png)

#### Step 2: Fill Language Details
In the "Add" section, complete the following fields:

1. **Language Name**: Enter the full name (e.g., "Spanish", "French", "German")
2. **Language Code**: Enter the 2-letter code (e.g., "es", "fr", "de")
3. **RTL Support**: Toggle "Is RTL" if the language reads right-to-left (like Arabic, Hebrew)
4. **Language Flag**: Upload a flag image for the language

#### Step 3: Upload Translation Files
Upload the translation files for each platform:

1. **Panel**: Upload admin panel translation file
2. **Web**: Upload website translation file  
3. **Customer App**: Upload customer app translation file
4. **Provider App**: Upload provider app translation file

:::tip
You can download sample files first to understand the format, then create your own translation files.
:::

#### Step 4: Submit
Click the **Submit** button to add the new language.

#### Step 5: Set as Default (Optional)
From the language list below, you can set any language as the default:

![get-language-codes](../../static/img/web/default_lang_admin.png)

1. Find your language in the table
2. Click **"Set as Default"** button in the Default column
3. The language will be marked with ✓ Default

:::caution  
When updating translations, **only change the text on the right side (the value)** and do **not** modify the text on the left side (the key).

✅ **Correct way to update:**

<pre>
"all_providers": "All Providers"
</pre>

❌ **Incorrect way (Do NOT change the key):**

<pre>
"all_providers_updated": "All Providers"  // ❌ Incorrect!
</pre>

:::

![get-language-codes](../../static/img/web/add_lang.png)

---

## Change Theme Color

Theme colors can now be configured directly from the **Admin Panel** — no code changes required.

### Steps to Update Theme Colors

1. Log in to the **Admin Panel**
2. Navigate to **Settings > Web Settings**
3. Scroll down to find the **Theme Color** cards
4. You will see separate sections for **Light Theme Colors** and **Dark Theme Colors**, each containing:
   - **Primary Color**
   - **Secondary Color**
   - **Light Background Color**
   - **Text Color**
   - **Card Background Color**
   - **Description Text Color**
5. Click on any color swatch to pick a new color
6. Use the **Reset to Default** button to restore the original theme colors
7. Save your changes

![web_dynamic_color](../../static/img/web/web_dynamic_color.png)

:::tip
Both **Light** and **Dark** theme colors can be customized independently. After saving, **reload the website** to see the updated theme colors applied.
:::

## Change Font style

- Go to: **src -> pages -> app.js**

   ![font-file](../../static/img/web/update_font.png)