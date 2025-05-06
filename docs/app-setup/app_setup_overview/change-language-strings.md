---
sidebar_position: 7
---

# How to Change Language String Values

Customizing language strings in your Flutter app allows you to modify text as per your requirements. Follow these steps to update the language strings.  

---

## 📂 Step 1: Locate the Language Files  

  1. Navigate to the following directory in your project:  

     ```
     assets/languages/
     ```

     ![language](../../../static/img/app/language_1.webp)

  2. Open the file corresponding to your **language code** (e.g., `en.json`, `fr.json`, `es.json`).  

   
---

## ✏️ Step 2: Modify String Values  

  -   Find the **string key** you want to update.  
  -   Change its **value** while keeping the key unchanged.  

  **Example (`en.json`):**  

  ```json
  {
    "welcome_message": "Hello, Welcome!",
    "logout": "Sign Out"
  }
  ``` 