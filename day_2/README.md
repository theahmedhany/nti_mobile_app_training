# Day 2: Dart Practice Problems (Concepts & Explanations).

This document outlines the purpose, key concepts, and design decisions behind each Dart practice problem. These exercises focus on core object-oriented programming (OOP) principles, Dart language features, and practical application structures.

---

## ✏️ Practice 1: **Library Management System**.

### ✅ Concepts Demonstrated:

- Abstract classes and inheritance
- Method overriding (polymorphism)
- Class composition (`Library` contains `LibraryItem`s)
- List operations

### 🔍 Key Highlights:

- `LibraryItem` is an **abstract base class** for all items.
- `Book` and `Magazine` extend `LibraryItem`, each with unique properties.
- The `Library` class **manages a collection** of items and displays them.
- Methods `displayItems()` and `showAllItems()` perform similar roles — consider **refactoring** for clarity.

---

## ✏️ Practice 2: **Vehicle Hierarchy with Mixins**.

### ✅ Concepts Demonstrated:

- Enums for type safety
- Mixins for code reuse
- Constructor inheritance
- Method overriding

### 🔍 Key Highlights:

- `FuelType` enum defines valid fuel options.
- `EcoFriendly` mixin provides **additional behavior** shared by multiple classes.
- `Vehicle` serves as a **base class** with shared properties.
- `ElectricCar` extends `Vehicle` and **mixes in** `EcoFriendly`, showing **mixin flexibility**.
- Cleanly separates concerns with **modular class design**.

---

## ✏️ Practice 3: **Shopping Cart System**.

### ✅ Concepts Demonstrated:

- Composition (`ShoppingCart` → `CartItem` → `Product`)
- Computed properties (`totalPrice`)
- Functional programming using `fold`
- Output formatting

### 🔍 Key Highlights:

- `Product` represents **item details** (e.g., name, price).
- `CartItem` couples a product with quantity and calculates line totals.
- `ShoppingCart` uses list operations to **compute total cost**.
- Utilizes `fold()` for **functional-style** total summation.
- Generates **clean and readable output** resembling real receipts.

---

## ✏️ Practice 4: **Employee Salary Calculator**.

### ✅ Concepts Demonstrated:

- Abstract classes with partially implemented methods
- Inheritance with salary-specific logic
- Method overriding
- Template method pattern

### 🔍 Key Highlights:

- `Employee` is an abstract class that defines the structure.
- `giveBonus()` is implemented in the base class, allowing **custom salary logic** in subclasses.
- `FullTimeEmployee` and `PartTimeEmployee` implement their own salary computation logic.
- Demonstrates **polymorphic behavior** through base interface.
- Clean **percentage-based bonus** calculation.

---

## ✏️ Practice 5: **Ticket Booking System**.

### ✅ Concepts Demonstrated:

- Abstract base classes
- Enum usage for ticket types
- List aggregation
- Simple pricing strategy pattern

### 🔍 Key Highlights:

- `Ticket` abstract class defines required methods like `getPrice()`.
- `RegularTicket` and `VIPTicket` implement different **pricing logic**.
- `BookingSystem` aggregates tickets and **calculates total revenue**.
- A simple yet extendable structure — can be enhanced with **user linking**, timestamps, etc.

---

## 🧩 Common Themes Across All Practices.

### 🎯 Object-Oriented Principles

- Strong use of **encapsulation**, **inheritance**, and **polymorphism** in every example.

### 🧪 Type Safety

- Uses Dart’s strong typing and enums to ensure **error-free behavior**.

### 🧱 Separation of Concerns

- Each class is **focused on a single responsibility**, enabling better testing and reuse.

### 🌍 Real-World Modeling

- All practice problems are **inspired by real scenarios**, making them easier to understand and applicable.

### 🧾 Clean Output

- Well-formatted outputs improve clarity and enhance the **user experience**.

---
