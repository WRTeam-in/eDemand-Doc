---
sidebar_position: 9
---

# Payment Gateway Settings

eDemand supports multiple payment gateways.  
Follow the steps below to connect each gateway to your admin panel.

Use the **right-side navigation** to quickly jump to a specific gateway:

- **Stripe**
- **Razorpay**
- **Paystack**
- **PayPal**
- **Flutterwave**
 - **Xendit**
- **Cashfree**

---

## Stripe

### Stripe – Get API keys

1. **Open the Stripe dashboard.**  
   Go to [https://dashboard.stripe.com/login](https://dashboard.stripe.com/login) and sign in to your Stripe account.

   ![Stripe Login](../../static/img/adminPanel/stripe1.webp)

2. **Open the Developers section.**  
   Click **Developers** in the top navigation bar.

   ![Stripe Developers](../../static/img/adminPanel/stripe2.webp)

3. **Go to API keys.**  
   In the left sidebar, click **API keys**.

   ![Stripe API Keys](../../static/img/adminPanel/stripe3.webp)

4. **Copy your keys.**  
   Click **Reveal key** and copy:
   - **Publishable key**
   - **Secret key**

   ![Stripe Keys](../../static/img/adminPanel/stripe4.webp)

### Stripe – Add keys in eDemand

5. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

6. **Paste Stripe credentials.**  
   Paste the **Publishable key** and **Secret key** into the Stripe section.

   ![Stripe Payment Gateway](../../static/img/adminPanel/stripe_payment_gateway.png)

### Stripe – Webhook setup

7. **Set the Stripe webhook.**

   ![Stripe Webhook](../../static/img/adminPanel/stripe_webhook.webp)

   ![Stripe Add Webhook](../../static/img/adminPanel/stripe_add_webhook.webp)

Make sure the webhook URL matches the one shown in your eDemand admin panel.

---

## Razorpay

### Razorpay – Get API keys

1. **Open the Razorpay dashboard.**  
   Go to [https://dashboard.razorpay.com/app/dashboard](https://dashboard.razorpay.com/app/dashboard) and sign in.

   ![Razorpay Dashboard](../../static/img/adminPanel/rp.webp)

2. **Open Settings.**  
   Click **Settings**.

   ![Razorpay Settings](../../static/img/adminPanel/rp1.webp)

3. **Go to API keys.**  
   Click **API Keys**.

   ![Razorpay API Keys](../../static/img/adminPanel/rp2.webp)

4. **Generate and copy keys.**  
   Click **Generate Key** (or **Regenerate Key**) and copy the keys shown.

   ![Razorpay Generate Key](../../static/img/adminPanel/rp3.webp)

### Razorpay – Add keys in eDemand

5. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

6. **Paste Razorpay credentials.**  
   Paste the Razorpay keys into the Razorpay section.

   ![Razorpay Payment Gateway](../../static/img/adminPanel/razorpay_payment_gateway.png)

### Razorpay – Webhook setup

7. **Set the Razorpay webhook.**

   ![Razorpay Webhook 1](../../static/img/adminPanel/razorpay_webhook1.webp)

   ![Razorpay Webhook 2](../../static/img/adminPanel/razorpay_webhook2.webp)

   ![Razorpay Webhook 3](../../static/img/adminPanel/razorpay_webhook3.webp)

Use the webhook URL provided in your eDemand admin panel and ensure required events are enabled.

---

## Paystack

### Paystack – Get API keys

1. **Open the Paystack dashboard.**  
   Go to [https://dashboard.paystack.com/](https://dashboard.paystack.com/) and sign in.

   ![Paystack Dashboard](../../static/img/adminPanel/ps.webp)

2. **Open API Keys & Webhooks.**  
   Go to **Settings → API Keys & Webhooks**.

   ![Paystack Settings](../../static/img/adminPanel/ps1.webp)

3. **Copy your credentials.**  
   Copy the keys shown in the **API Keys** section.

   ![Paystack Credentials](../../static/img/adminPanel/ps2.webp)

### Paystack – Add keys in eDemand

4. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

5. **Paste Paystack credentials.**  
   Paste the Paystack keys into the Paystack section.

   ![Paystack Payment Gateway](../../static/img/adminPanel/paystack_payment_gateway.png)

### Paystack – Webhook setup

6. **Set the Paystack webhook.**

   ![Paystack Webhook](../../static/img/adminPanel/paystack_webhook.webp)

Use the webhook URL from your eDemand admin panel and save the configuration in Paystack.

---

## PayPal

### PayPal – Find your business email

1. **Login to the PayPal dashboard.**
2. **Open Account Owner Information.**  
   Go to **Account Settings → Account Owner Information**.
3. **Open the email section.**  
   Click **Update** in the email section.

   ![Paypal Email](../../static/img/adminPanel/paypalkey1.webp)

4. **Copy your business email.**  
   This is your PayPal business email.

   ![Paypal Business Email](../../static/img/adminPanel/paypalkeys2.webp)

### PayPal – Add credentials in eDemand

5. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

6. **Paste PayPal credentials.**  
   Enter your PayPal business email and any other required PayPal fields.

   ![Paypal Payment Gateway](../../static/img/adminPanel/paypal_payment_gateway_setting.png)

### PayPal – Webhook (IPN) settings

1. **Login to the PayPal dashboard.**
2. **Open Profile Settings.**

   ![Paypal Profile Settings](../../static/img/adminPanel/paypal_step1.webp)

3. **Go to Instant Payment Notification (IPN).**  
   Navigate to **Website Payments → Instant payment notification**.

   ![Paypal Website Payments](../../static/img/adminPanel/paypal_step2.webp)

4. **Edit IPN settings.**

   ![Paypal Edit Settings](../../static/img/adminPanel/paypal_step3.webp)

5. **Paste the webhook URL from eDemand.**  
   Copy the PayPal webhook / IPN URL from **Admin panel → Settings → System Settings** and paste it here.

   ![Paypal Webhook](../../static/img/adminPanel/paypal_step4.webp)

Save your changes in PayPal.

---

## Flutterwave

### Flutterwave – Get API keys

1. **Open Flutterwave.**  
   Go to [https://flutterwave.com/](https://flutterwave.com/) and sign in to your Flutterwave account.
2. **Open API keys.**  
   Go to **Developers → API Keys**.
3. **Copy your credentials.**  
   Copy the public and secret keys shown.

   ![Flutterwave Credentials](../../static/img/adminPanel/flutterwave_1.png)

### Flutterwave – Webhook setup

4. **Set the Flutterwave webhook.**

   ![Flutterwave Webhook](../../static/img/adminPanel/flutterwave_webhook.png)

Use the webhook URL shown in your eDemand admin panel.

### Flutterwave – Add keys in eDemand

5. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

6. **Paste Flutterwave credentials.**  
   Paste the Flutterwave keys into the Flutterwave section.

   ![Flutterwave Payment Gateway](../../static/img/adminPanel/flutterwave_payment_gateway_setting.png)

---

## Xendit

:::danger Important: Only one webhook per account
Xendit allows **only one webhook configuration per account**.  
If you use the same Xendit account for multiple projects or environments, make sure the webhook URL is set to your **eDemand production site**, or payments and status updates may not reach the correct system.
:::

### Xendit – Get API keys

1. **Open the Xendit dashboard.**  
   Go to [https://dashboard.xendit.co/](https://dashboard.xendit.co/) and sign in to your Xendit account.

   ![Xendit Dashboard](../../static/img/adminPanel/xendit_dashboard.png)

2. **Open the API keys section.**  
   Open the **Settings → Developers** area and go to **API Keys**.  
   On this screen, click **Generate secret key** to create a new secret key.

   ![Xendit API Keys](../../static/img/adminPanel/xendit_api_keys.png)

3. **Set permissions and copy your secret key.**  
   In the permissions popup:
   - Enable **write** permission wherever available.  
   - Use **read** permission where **write** is not available.

   ![Xendit Permissions](../../static/img/adminPanel/xendit_api_permissions.png)
   
   Then copy the generated key and store it safely.  
   Xendit will not show this secret key again.

   ![Xendit Key](../../static/img/adminPanel/xendit_key.png)

### Xendit – Add keys in eDemand

4. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

5. **Paste Xendit credentials.**  
   Paste the copied secret key into the **Xendit** section of the payment gateway settings.

   ![Xendit Payment Gateway Placeholder](../../static/img/adminPanel/xendit_payment_gateway.png)

### Xendit – Webhook / callback URL setup

6. **Set your website URL.**  
   Add your live website domain (for example, `https://yourdomain.com`) so it matches the URL where your eDemand site is hosted.

7. **Find the webhook URL in eDemand.**  
   In the eDemand admin panel, note the **Webhook URL** shown in the Xendit payment gateway configuration.

8. **Configure webhook in Xendit.**  
   In the Xendit dashboard, open **Webhooks** in the sidebar.  
   - Copy the **Webhook verification token** and paste it into the Xendit payment gateway settings in the eDemand admin panel.  
   - Scroll down and add the eDemand webhook URL for the following events (the text in brackets is the **section name** in the Webhooks screen where you must set the URL):
     - **Refund finalized** (section: **Direct Debit**)  
     - **Invoice paid** (section: **Invoices**)  
     - **Refund Request Succeeded** and **Refund Request Failed** (section: **Unified Refunds**)  
     - **eWallet Payment Status** (section: **E‑Wallets**)  
     - **QR code paid** & **QR code refunded** (section: **QR codes**)

   ![Xendit Webhook](../../static/img/adminPanel/xendit_webhook.png)

Save your settings in Xendit to ensure payments and status updates are correctly sent back to eDemand.

---

## Cashfree

### Cashfree – Get API keys

1. **Open the Cashfree dashboard.**  
   Go to [https://merchant.cashfree.com/](https://merchant.cashfree.com/) and sign in to your Cashfree account.

   ![Cashfree Dashboard](../../static/img/adminPanel/cashfree_dashboard.png)

2. **Go to API keys / credentials.**  
   In the left sidebar, open the **Developers -> API Keys** section.

3. **Generate (or view) keys.**  
   Generate or view your **Client ID** and **Client Secret** (or **App ID** and **Secret Key**, depending on your account type).  
   Keep these values safe and do not share them publicly.

   ![Cashfree API Keys](../../static/img/adminPanel/cashfree_api_keys.png)

### Cashfree – Add keys in eDemand

4. **Open eDemand admin panel.**  
   Go to **Settings → Payment Gateway Settings**.

5. **Paste Cashfree credentials.**  
   In the **Cashfree** section:
   - Paste the **Client ID / App ID**.  
   - Paste the **Client Secret / Secret Key**.  
   - Select the correct **mode** (Sandbox / Test or Live) matching the environment of your Cashfree account.

   ![Cashfree PG Settings](../../static/img/adminPanel/cashfree_pg_settings.png)

### Cashfree – Webhook / callback URL setup

6. **Find the Cashfree webhook URL in eDemand.**  
   In the eDemand admin panel, under the **Cashfree** payment gateway configuration, copy the **Webhook URL** shown there.

7. **Configure webhook in Cashfree.**  
   In the Cashfree dashboard:
   - Open the **Developers -> Webhooks** section.  
   - Paste the webhook URL you copied from eDemand and click on test. 
   - Once test passes, click continue. 
   - Enable all events related to **payment success / failure**, **refunds**, and any other status updates required for your integration.
   - The **Client Secret / Secret Key** you generated earlier will be used as the **webhook secret**.

   ![Cashfree Webhook Settings](../../static/img/adminPanel/cashfree_webhook.png) 

8. **Save changes.**  
   Save the webhook configuration in Cashfree and ensure the same environment (Test/Live) is used in both Cashfree and your eDemand payment settings so that payment notifications are delivered correctly.

