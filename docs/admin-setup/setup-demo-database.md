---
sidebar_position: 9
---


# Demo Database Setup

:::note
This step is **optional**. Only follow these instructions if you want to set up a demo database with sample data for testing or exploration.
If you do **not** want demo data, you can skip this section.
:::
Setting up a demo database helps you quickly test and explore the eDemand platform with sample data. Follow these steps to import the demo database:

### Step 1: Download the Demo SQL File

[Download demo-database.sql](../../static/demo-database.sql)

> This file contains sample tables and data for a quick start.

### Step 2: Import the SQL File into Your Database

1. Open your database management tool (such as phpMyAdmin, MySQL Workbench, or command line).
2. Create a new database (e.g., `edemand_demo`).
3. Import the downloaded `demo-database.sql` file into your new database.
   - In phpMyAdmin: Select your database, go to the 'Import' tab, and upload the file.
   - In MySQL CLI: Run `mysql -u youruser -p edemand_demo < path/to/demo-database.sql`
4. Update your application's `.env` file to use the new demo database credentials.

> **Note:** The demo data is for testing and learning purposes only. Do not use it in production environments.
