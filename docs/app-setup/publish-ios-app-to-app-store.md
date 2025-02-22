---
sidebar_position: 10
---

# Publish iOS App to App Store

# 🚀 Steps to Publish iOS App to App Store

Follow these steps to successfully publish your **iOS app** on the **Apple App Store**.

---

## 🔹 Step 1: Open Your Flutter Project in Xcode

1️⃣ Navigate to your Flutter project's `ios` folder.  
2️⃣ Open the file **Runner.xcworkspace** in **Xcode**.  
   ```sh
   open ios/Runner.xcworkspace
  ```

# 🔹 Step 2: Add Apple Developer Team & Firebase Configuration

Add Your Apple Developer Account

1. In Xcode, go to "Runner" > "Signing & Capabilities".
2. Select your Apple Developer Team (Your Apple Developer ID).
3. Ensure the Bundle Identifier matches the one used in your Apple Developer Account.
4. Add Google Firebase Configuration (Optional, If Using Firebase)

Download GoogleService-Info.plist from Firebase Console.

1. Add this file to the Runner folder inside Xcode.
2. Ensure it's included in the Runner target.

![ios](../../static/img/app/ios1.webp)

## 🔹 Step 3: Select a Physical iOS Device

1️⃣ In Xcode, go to the top-left device selector.     
2️⃣ Select "Any iOS Device (armv7, arm64)".

![ios](../../static/img/app/ios2.webp)

🔹 This step is important to enable the Archive option.         

## 🔹 Step 4: Archive the Build
1️⃣ In Xcode, go to Product > Archive.        
2️⃣ Wait for the build process to complete.       
3️⃣ Once completed, a popup window will appear with the generated archive.    

![ios](../../static/img/app/ios3.webp)    

## 🔹 Step 5: Validate and Distribute the App
1️⃣ Click Validate App.       
2️⃣ If validation is successful, click Distribute App.        
3️⃣ Select App Store Connect as the distribution method.      
4️⃣ Follow the prompts to upload your app.      

![ios](../../static/img/app/ios4.webp)

## 🔹 Step 6: Submit the App for Review

1️⃣ Go to **[App Store Connect](https://appstoreconnect.apple.com/)**.      
2️⃣ Navigate to My Apps and select your app.      
3️⃣ Under the TestFlight or App Store tab, find the newly uploaded build.     
4️⃣ Fill in the required details, screenshots, and submit for Apple review.       

✅ **Once approved, your app will be available on the App Store!** 🎉

📌 Click **[here](https://developer.apple.com/distribute/app-review/)** for Apple's official guidelines.

📌 Click **[here](https://codewithchris.com/submit-your-app-to-the-app-store/)** for Detailed Help.