---
sidebar_position: 7
---

# New Version Update

1. **Extract the ZIP File**:
   Extract the ZIP file containing the web code that you received from Codecanyon.

2. **Open the Code in VS Code**:
   Open the extracted web code in Visual Studio Code (VS Code).

3. **Edit the .env File**:
   Locate and open the .env file in your code editor. Add the admin URL as specified in the documentation.

4. **Configure Firebase**:
   Open the Firebase Console. Follow the steps outlined in the Firebase documentation. Add the Firebase details to the .env file of your web project.

5. **Install Dependencies**:
   Run the following command to install the necessary dependencies:

   ```bash
   npm install
   ```

6. **Build the Project**:
   Run the following command to build the project:

   ```bash
   npm run export
   ```

7. **Deploy the Build Folder**:
   After the build process completes, create a ZIP file of the **out** folder. Upload the contents of the build folder to your web server.
