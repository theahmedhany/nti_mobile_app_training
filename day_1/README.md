# 📘 Day 1: Dart Practice Problems.

This guide provides an overview and explanation of five beginner-friendly Dart programming exercises to help reinforce control structures such as `if-else`, `switch-case`, loops, and basic input/output handling.

---

## ✏️ Practice 1: Grade Evaluation (Using `if-else`).

### ✅ Objective:

Evaluate a student's grade and categorize it based on numeric input.

### 📥 Input:

A number from **0 to 100** representing a student's grade.

### 🧠 Logic:

Use `if-else` statements to classify the grade into performance categories.

### 🔎 Grade Categories:

- **95 – 100**: Excellent
- **85 – 94**: Very Good
- **75 – 84**: Good
- **65 – 74**: Satisfactory
- **Below 65**: Poor

> ⚠️ _Make sure there are no logical gaps in the ranges. Overlapping or missing ranges can lead to unexpected results._

---

## ✏️ Practice 2: Grade Evaluation (Using `switch-case` with conditions).

### ✅ Objective:

Evaluate a student's grade using Dart's `switch-case` and pattern matching.

### 📥 Input:

A number from **0 to 100**.

### 🧠 Logic:

Use `switch` with `when` clauses to check range conditions.

### 🔎 Grade Categories:

- `95–100`: **Excellent**
- `85–94`: **Very Good**
- `70–84`: **Good**
- `50–69`: **Satisfactory**
- `< 50`: **Poor**

### ➕ Extra:

Includes a `default` case to handle invalid input (e.g., numbers > 100 or < 0).

> ✅ This version handles all ranges completely and avoids logical gaps.

---

## ✏️ Practice 3: Grade Evaluation (Exact Match with `switch-case`).

### ✅ Objective:

Display messages for **exact** grade values using `switch-case`.

### 📥 Input:

An **integer** representing an exact grade value.

### 🧠 Logic:

Match the grade exactly to predefined values.

### 🔎 Accepted Exact Values:

- `90`: Excellent
- `80`: Very Good
- `70`: Good
- `60`: Satisfactory
- `50`: Poor

### ❗ Notes:

- Any value **not** listed above will be considered **invalid**.
- Less practical in real-life scenarios due to reliance on specific values only.

---

## ✏️ Practice 4: Star Pattern Printer.

### ✅ Objective:

Print a simple ascending star (`*`) pattern using nested loops.

### 📥 Input:

A **positive integer** for the number of rows.

### 🧠 Logic:

- Use a **for loop** to manage rows.
- Use an inner loop to print stars in each row.
- Each row has 1 more star than the previous.

### ❗ Notes:

- Input validation should be handled to prevent negative or non-numeric values.

---

## ✏️ Practice 5: Countdown Printer.

### ✅ Objective:

Print numbers from a given number down to `1` using a loop.

### 📥 Input:

A **positive integer** (starting number).

### 🧠 Logic:

- Use a `do-while` loop:
  - Print the current number.
  - Decrement the number.
  - Continue until the number reaches 0.

### ❗ Notes:

- Should validate input to ensure it is positive.

---

## ✅ Summary.

| Practice | Topic                        | Key Concepts                        |
| -------: | ---------------------------- | ----------------------------------- |
|        1 | Grade Evaluation (`if-else`) | Conditional statements, ranges      |
|        2 | Grade Evaluation (`switch`)  | Pattern matching, control flow      |
|        3 | Exact Match Evaluation       | `switch-case`, constants            |
|        4 | Star Pattern Printer         | Nested loops, input/output          |
|        5 | Countdown Printer            | `do-while` loop, decrement, control |

---
