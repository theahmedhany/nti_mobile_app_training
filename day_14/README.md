# Day 14: Login Screen – Lafyuu App

## 📝 Description

The Login Screen is a crucial entry point for users of the Lafyuu mobile application. It provides a clean and simple interface for users to securely access their accounts using their email and password credentials.

---

## ✨ Features

### 👋 Welcome Text

- **Title**: "Welcome To Lafyuu"
- **Subtitle**: "sign in to continue"
- **Purpose**: Creates a friendly first impression and clarifies the intent of the screen.

### 📨 Email & Password Fields

- **Email Input Field**:
  - Placeholder: `Email`
  - Validates proper email formatting _(not shown but typically implemented)_.
- **Password Input Field**:
  - Placeholder: `Password`
  - Eye icon toggle for showing/hiding password input.
  - Ensures privacy and usability.

### 🔐 Secure Login Button

- **Label**: `Login`
- **Style**: Bright blue button for visibility.
- **On tap**: Triggers login action _(integration with authentication logic required)_.

---

## 🧑‍💻 Technical Implementation

### 🔧 Key Technologies

- **Flutter**: Cross-platform mobile development framework.
- **Material Components**: Used for form fields, buttons, and text.
- **Form Validation**: Easily extendable using `TextFormField` and `FormState`.
- **Password Visibility Toggle**: Ensures secure and user-friendly password input.

---

## 📱 UI Highlights

- **Center-Aligned Content**: Clean, vertical stack layout for balanced visual structure.
- **Minimalist Design**: Uses whitespace effectively for a clutter-free user experience.
- **Rounded Input Fields**: Modern aesthetic consistent with Material Design 3.
- **Color Scheme**:
  - **Background**: Light pastel tone
  - **Primary Button**: Bright blue for clear call-to-action

---

## 🔒 Best Practices (Recommended)

- Add form validation for:
  - **Email Format** (e.g., using regex or `EmailValidator`)
  - **Password Strength** (e.g., min length, character types)
- Use secure text entry for password fields.
- Add a "Forgot Password?" link.
- Optionally support social login (Google, Facebook, Apple).

---

## Screenshots

## ![Login Screen](https://github.com/user-attachments/assets/42cd32cc-4e08-45e7-9a9a-2a22827b3170)

---
