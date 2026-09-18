---
sidebar_position: 7
---

# Cron Job

Cron jobs are scheduled tasks that your server runs automatically.
They make sure important background work happens on time, without you having to log in and do it manually.

In **eDemand** you only need **one cron job**:

- **Tasks cron**: runs CodeIgniter Tasks, which handles subscription status updates, notification queue processing (email, SMS, FCM), and other scheduled jobs — all under a single cron.

> **Note:** Previously, eDemand required separate cron jobs for subscription status updates, the notification queue, and other background jobs. These have now been merged into a single **Tasks cron** powered by CodeIgniter Tasks. You no longer need to configure multiple cron entries.

If this cron job is not set:

- Subscription statuses may not update on time.
- Notifications may stay in the queue or be delayed.
- Other scheduled tasks may not run.

You run this cron using the **PHP CLI** via the `spark` command (recommended).

Below you will find step‑by‑step instructions, including examples for **cPanel**.

---

## 1. PHP CLI Cron for Tasks (spark) {#php-cli-cron-for-tasks-spark}

The **Tasks cron** regularly runs a `spark` command that executes all due CodeIgniter Tasks and then exits.

The command looks like this:

```shell
<path-to-php> <path-to-your-project>/spark tasks:run
```

- `<path-to-php>`: full path to the PHP binary.
- `<path-to-your-project>`: full path to the project root where the `spark` file is located.

You need to find both paths on your server.

### 1.1. How to Find `<path-to-php>`

#### a) On a normal Linux server (SSH)

1. Connect via SSH.
2. Run:

   ```shell
   which php
   ```

3. The output is usually something like:

   ```shell
   /usr/bin/php
   ```

This is your `<path-to-php>`.

#### b) In cPanel

There are a few common ways:

- **Terminal feature** (if enabled):
  1. In cPanel, search for **Terminal** and open it.
  2. Run:

     ```shell
     which php
     ```

  3. Use the resulting path (for example `/usr/bin/php` or `/usr/local/bin/php`).

- **Select PHP Version / MultiPHP**:
  - Some hosts show the PHP path on the **PHP Selector / MultiPHP Manager** page.
  - Look for text like “PHP executable path” or similar in your host’s documentation.

If you cannot find it, your hosting provider’s documentation or support can usually tell you the correct PHP path for cron jobs.

### 1.2. How to Find `<path-to-your-project>`

You need the absolute path to the folder where the `spark` file lives.

Common patterns on shared hosting:

- `/home/<cpanel-username>/public_html`
- `/home/<cpanel-username>/domains/<your-domain>/public_html`

#### a) Using cPanel File Manager

1. In cPanel, open **File Manager**.
2. Navigate to your **document root** for the domain where eDemand runs.
   - For the main domain, this is often `public_html`.
   - For addon domains or subdomains, use **Domains** in cPanel to see the **Document Root**.
3. Find the folder where eDemand is installed (the folder that contains the `spark` file).
4. Look at the **full path** displayed at the top of File Manager, or right‑click the folder and check “Copy path” if your host provides that.

Example full path:

```text
/home/user/domains/domain.com/public_html/edemand
```

This becomes your `<path-to-your-project>`.

#### b) Using SSH

1. Go to your project folder:

   ```shell
   cd /path/to/your/project
   ```

2. Run:

   ```shell
   pwd
   ```

3. The output is your `<path-to-your-project>`.

### 1.3. Example Full spark Command

Putting it together:

```shell
/usr/bin/php /home/user/domains/domain.com/public_html/edemand/spark tasks:run
```

### 1.4. cPanel – Add the Tasks Cron

Now that you have the PHP path and project path:

1. Log in to **cPanel**.
2. Open **Cron Jobs**.
3. In **Add New Cron Job**:
   - Set the schedule to run **every minute**:
     - Minute: `*`
     - Hour: `*`
     - Day: `*`
     - Month: `*`
     - Weekday: `*`
4. In the **Command** field, enter:

   ```shell
   <path-to-php> <path-to-your-project>/spark tasks:run >/dev/null 2>&1
   ```

   Example:

   ```shell
   /usr/bin/php /home/user/domains/domain.com/public_html/edemand/spark tasks:run >/dev/null 2>&1
   ```

5. Click **Add New Cron Job**.
6. Confirm that the cron job appears in the list.

---

## 2. Verifying and Maintaining Your Cron Job

After setting up the cron job:

- **Check logs or application behavior**:
  - Confirm that subscription statuses are updated as expected (for example, after midnight).
  - Check that queued notifications are being sent and the queue is not growing indefinitely.
  - Confirm any other scheduled tasks are running as expected.
- **Edit or remove the cron job**:
  - In cPanel, use the same **Cron Jobs** screen to modify or delete.

Keeping this cron job configured and running is essential for correct and timely background processing in eDemand.
