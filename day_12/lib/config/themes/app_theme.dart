import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightThemeMode = ThemeData(
    // Defines the base brightness of the theme (light mode)
    brightness: Brightness.light,

    // Sets the full color scheme for the light theme
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      // Main color used across the app (AppBar, buttons, etc.)
      primary: Colors.blue,

      // Secondary accent color (FABs, tags, indicators)
      secondary: Colors.amber,

      // Color of containers, sheets, dialogs, backgrounds
      surface: Colors.white,

      // Text/icon color on top of surface
      onSurface: Colors.black,

      // Text/icon color on top of primary
      onPrimary: Colors.white,

      // Text/icon color on top of secondary
      onSecondary: Colors.black,

      // Used for error states (optional)
      error: Colors.red,
      onError: Colors.white,

      // Deprecated: no need to use background/onBackground
      // background: Colors.grey[100]!,
      // onBackground: Colors.black,
    ),

    // Background color for Scaffold widgets
    scaffoldBackgroundColor: Colors.grey[100],

    // Theme for AppBar: background and text/icon colors
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),

    // Theme for the bottom navigation bar (NavigationBar widget)
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.blue,
    ),

    // Enables Material 3 design system
    useMaterial3: true,
  );

  static final ThemeData darkThemeMode = ThemeData(
    // Sets the base brightness of the theme (dark mode)
    brightness: Brightness.dark,

    // Defines the dark mode color scheme
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blueGrey,
      secondary: Colors.tealAccent,
      surface: Colors.grey[850]!,
      onSurface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      // background: Colors.grey[900]!,
      // onBackground: Colors.white,
    ),

    // Background for Scaffold widgets
    scaffoldBackgroundColor: Colors.grey[900],

    // AppBar appearance in dark mode
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
    ),

    // Navigation bar styling for dark mode
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.grey[850],
    ),

    // Enables Material 3 design system
    useMaterial3: true,
  );
}
