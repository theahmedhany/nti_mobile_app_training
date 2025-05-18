# Day 6: Recipe Calculator App.

## Description

**Recipe Calculator** is a Flutter-based mobile application designed to help users browse and manage their favorite recipes. The app features a clean, intuitive interface that displays recipe details, including ingredients and serving sizes, with the ability to dynamically adjust ingredient quantities based on the number of servings.

---

## Key Features

- **Recipe Listing**  
  Displays a scrollable list of recipe cards with images and titles.
- **Recipe Details**  
  Shows detailed information for each recipe, including an image, title, and ingredient list.
- **Dynamic Serving Adjustment**  
  A slider allows users to adjust the number of servings (1 to 10), and ingredient quantities update automatically.
- **Responsive UI**  
  Smooth navigation and a clean design using Material and Cupertino widgets.
- **Reusable Components**  
  Custom widgets like `CustomRecipeCard` and `CustomDetailsIngredients` ensure consistent UI and code reuse.

---

## Screens Overview

### 1. Home Screen

- Displays a vertical list of recipe cards.
- Each card shows a recipe image and title.
- Tapping a card navigates to the Recipe Details screen with a smooth transition.

![Home Screen](https://github.com/user-attachments/assets/fadd900c-f16c-4041-af82-a6b6025b5bb2)

### 2. Recipe Details Screen

- Displays the selected recipe’s image, title, and detailed ingredients list.
- Includes a slider to adjust servings from 1 to 10.
- Ingredient quantities update dynamically based on the slider value.

![Recipe Details Screen](https://github.com/user-attachments/assets/5fcf4981-2aa3-49e6-ae83-ba03192372a9)

---

## Technical Details

- **State Management**: Uses Flutter's built-in `setState` for managing UI updates and recalculations.
- **Navigation**: Uses `CupertinoPageRoute` for iOS-style smooth page transitions.
- **Data**: Sample recipe data is hardcoded within the `Recipe` class for demonstration.
- **Assets**: Recipe images are stored in the `assets/images/` directory.

---
