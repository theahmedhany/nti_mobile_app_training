# Day 16: Flight Booking Screen.

## Description

The **Flight Booking Screen** is a core part of a travel booking Flutter application that allows users to browse available flight options between two cities for specific dates. The design is user-friendly and optimized for quick decision-making with segmented filters and visually rich cards showing key flight details.

---

## ✨ Features

### 🔘 CupertinoSegmentedControl Filters

- **Filter Options**: Cheaper, Faster, Special
- **Purpose**: Allows users to filter flights based on preferences such as price, speed, or special offers.
- **Design**: iOS-style segmented control integrated with Flutter for a native look on iOS devices.

### 🛫 Flight Information Cards

Each flight is presented as a card with comprehensive details:

- **Airline Logo and Name**: Displays the airline’s logo icon and name prominently.
- **Departure & Arrival Times**: Clearly labeled time slots (e.g., 08:20 - 14:40).
- **Origin & Destination**: City codes displayed (e.g., LDN - NY).
- **Duration**: Total flight time (e.g., 6h 00m).
- **Transfer Info**: Number of transfers or note about direct flight.
- **Price Tag**: Distinct color-coded price chip (e.g., $120 in purple).

### 🧾 Example Flights:

| Airline          | Departure | Arrival | Duration | Stops         | Price |
| ---------------- | --------- | ------- | -------- | ------------- | ----- |
| Turkish Airlines | 08:20     | 14:40   | 6h 00m   | +2 transfers  | $120  |
| Emirates         | 09:15     | 16:00   | 6h 45m   | +1 transfer   | $150  |
| Qatar Airways    | 07:30     | 13:20   | 5h 50m   | Direct flight | $180  |

### 📆 Date & Route Selector

- **Displayed Route**: `LDN - NY`
- **Selected Dates**: `25 Dec - 26 Dec`
- **Purpose**: Gives users quick context of their current search.

### ☑️ Other UI Highlights

- **Drawer & Notification Buttons**: For quick access to navigation and alerts.
- **Material Design 3 Styling**: Clean cards, rounded corners, spacing, and chip colors for pricing.
- **Bottom Safe Area Padding**: Ensures the layout is visually balanced on all screen sizes.

---

## 🧰 Technical Implementation

### 🔧 Key Technologies

- **Flutter**: Used for building the cross-platform interface.
- **CupertinoSegmentedControl**: Provides iOS-native filter switching.
- **Material Components**: Used for cards, icons, and text styling.
- **Dynamic Data Integration** _(Optional)_: Easily extendable to fetch flight data from RESTful APIs.

---

## 🧰 Screenshots

![Flight Booking Screen](https://github.com/user-attachments/assets/15b4e2c5-17ce-4f42-ac6f-9531390406f5)

---
