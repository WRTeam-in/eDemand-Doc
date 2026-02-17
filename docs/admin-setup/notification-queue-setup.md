---
sidebar_position: 8
---

# Set Notification Queue Cron Job

## Why Use a Cron Job:
Sending notifications like email, and sms takes time. Also sending FCM notifications to a huge number of users takes time. So, to solve this issue queue has been used for ending the notifications.

## How to Set Up a Cron Job:

### Step 1: Log into cPanel
   Open your web browser and enter your cPanel URL. Log in using your credentials.

### Step 2: Navigate to Cron Jobs
   Search for "Cron Jobs" in the cPanel search bar, or scroll down to the "Advanced" section and find "Cron Jobs." Click on it.

### Step 3: Choose Add New Cron Job
   You'll see a list of current cron jobs. Scroll down to the "Add New Cron Job" section.

### Step 4: Set the Timing
   Set the timing to run the queue every minute. You may need to set each time manually to "*" for hour, minute, day, month, etc.

### Step 5: Add the Command
   In the "Command" field, enter the full script or path to the scriptfile you want to run as the cron job. Example of the exact format of the command is shown below:
   

   ```shell
   <path-to-php> <path-to-your-project>/spark queue:work notifications -max-jobs 20 --stop-when-empty
   ``` 

   Replace `<path-to-php>` and `<path-to-your-project>` with the actual paths on your server.
   The paths differ from server to server.
   
   Example:

   ```shell
   /usr/bin/php /home/user/domains/domain.com/public_html/edemand-test/spark queue:work notifications -max-jobs 20 --stop-when-empty
   ```

### Step 6: Save the Cron Job
   Click the "Add New Cron Job" button to save your settings.

### Step 7: Confirm Cron Job
   You'll see a confirmation message that your cron job has been added. Double-check the details to make sure everything is correct. Ensure the cron job is working as expected, you can test it. You might need to wait until the scheduled time for the test.

### Step 8: Edit or Delete Cron Jobs
   If you need to change or remove a cron job, you can do so from the same "Cron Jobs" section in cPanel.
