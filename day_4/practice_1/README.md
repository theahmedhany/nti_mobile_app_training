# Day 4: Counter App with Product List.

## 📱 Overview

**Counter App with Product List** is a Flutter application that allows users to dynamically add products to a list using a floating action button. The application enforces a limit of **4 items** to maintain simplicity and demonstrate basic Flutter state management.

---

## ✨ Features

- ✅ Floating Action Button (`+`) to add new products
- 🚫 Restricts the product list to a **maximum of 4 items**
- 🔔 Displays a **Snackbar notification** when the limit is exceeded
- 🧾 Clean product layout with:
  - Circular numbered avatar (Product 1, Product 2, ...)
  - Title text for each product
  - Light gray card background for product tiles
- 📱 Responsive design optimized for both mobile and tablet screens

---

## ⚙️ App Behavior

1. On launch, the product list is empty.
2. Each press of the floating action button adds a product:
   - Items are titled sequentially: **Product 1**, **Product 2**, ...
3. The product list appears vertically below the app bar.
4. Once 4 products have been added:
   - Pressing the `+` button triggers a `Snackbar` with the message:
     > **"Maximum 4 items allowed!"**
5. Additional product additions are blocked until the app is reset or restarted.

---

## 🎨 UI & Visual Elements

| Element      | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| App Bar      | Purple background with white centered title `"Counter App"` |
| FAB (Button) | Circular button with a white **plus (+)** icon              |
| Product Tile | Grayish background, circular number avatar, title text      |
| Snackbar     | Temporary message for user feedback on exceeding the limit  |

---

## 📸 Preview (Optional)

![App Preview](https://github.com/user-attachments/assets/c496d161-8bdd-43c2-8a09-7785ba2c3085)

---
