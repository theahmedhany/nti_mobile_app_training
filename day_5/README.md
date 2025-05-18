# Day 5: Dart Practice Problems.

This repository contains a collection of Dart practice problems with solutions. Below is a detailed explanation of each problem:

---

## Problem 1: Personal Details (`practice_1.dart`)

- Collects personal details from the user: **name**, **age**, and **birth year**.
- Calculates how many years the user has lived in the 21st century (since 2001).
- Handles cases where the user was born before or after 2001.
- Displays all the information along with the calculated years lived in the 21st century.

---

## Problem 2: Student Grades (`practice_2.dart`)

- Works with **lists** and **maps**.
- Contains a list of student names and a map of their corresponding grades.
- Prints names and grades of students who scored **50 or above**.
- Calculates and displays the **average grade** of all students.

---

## Problem 3: Student Filtering (`practice_3.dart`)

- Uses **records** (a new Dart feature) to store student information: **name**, **age**, and **country**.
- Filters students who are:
  - Between **20 and 30 years old**.
  - From **Egypt**.
- Prints the filtered students’ details.
- Calculates and displays the **average age** of all students.

---

## Problem 4: Triangle Validator (`practice_4.dart`)

- Contains a function that checks if three given side lengths can form a valid triangle.
- Implements the **triangle inequality theorem**:  
  The sum of any two sides must be greater than the third side.
- The main function tests the validator with several example cases.

---

## Problem 5: Grade Converter (`practice_5.dart`)

- Converts a **numerical grade** (0-100) to a **letter grade** (A-F) based on standard grading scales.
- Provides encouragement messages:
  - Congratulates students who get **A** or **B**.
  - Encourages others to try again.

---

## Problem 6: Number Printer (`practice_6.dart`)

- Prints numbers from **1 to 100**, but skips numbers that:
  - Are divisible by **4**.
  - Contain the digit **'7'**.
- Demonstrates the use of loops, conditionals, and string manipulation for filtering numbers.

---

## Practice 7: Named Parameters with Default Values

- Demonstrates **named parameters** in functions for better readability.
- Uses the `required` keyword to define **required parameters**.
- Shows how to set a **default value** (`false`) for the optional `uppercase` parameter.
- The function formats a name by combining first and last names, with an option to convert the output to uppercase.

---

## Practice 8: Class Composition and List Management

- Illustrates **class composition** with `Book` and `Library` classes.
- Manages collections using Dart’s `List` type.
- Demonstrates **object instantiation** using named parameters.
- The `Library` class includes methods to **add**, **remove**, and **display** books, showcasing encapsulation.

---

## Practice 9: Abstract Classes and Inheritance

- Introduces **abstract classes** via the `Shape` class which defines an interface.
- Demonstrates **inheritance** with `Circle` and `Rectangle` classes extending `Shape`.
- Shows **polymorphism** by implementing the `area()` method differently in each subclass.
- Each concrete class provides its own implementation of the abstract method.

---

## Practice 10: Encapsulation with Private Members

- Demonstrates **encapsulation** using a private member `_balance` (underscore prefix).
- Controls access to class internals while providing public methods.
- Includes basic banking operations: **deposit** and **withdraw**, with validation.
- Protects the internal state by allowing modification of `_balance` only through class methods.

---

## Practice 11: Interfaces and Factory Constructors

- Shows usage of **interfaces** with the abstract class `Printable`.
- Demonstrates **implicit interface implementation** with the `Order` class.
- Includes a **factory constructor** (`fromMap`) for creating objects from Map data.
- Implements the `printInvoice` method fulfilling the interface contract with specific logic.

---

## Practice 12: Mixins for Code Reuse

- Introduces **mixins** as a mechanism for sharing code across unrelated classes.
- The `Logger` mixin provides logging functionality that can be added to any class.
- Applies the mixin using the `with` keyword.
- The `Service` class gains logging capability without inheritance, demonstrating horizontal code reuse.

---
