import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightThemeMode = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: Colors.blue,

      secondary: Colors.amber,

      surface: Colors.white,

      onSurface: Colors.black,

      onPrimary: Colors.white,

      onSecondary: Colors.black,

      error: Colors.red,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: Colors.grey[100],

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.blue,
    ),

    useMaterial3: true,
  );

  static final ThemeData darkThemeMode = ThemeData(
    brightness: Brightness.dark,

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
    ),

    scaffoldBackgroundColor: Colors.grey[900],

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.grey[850],
    ),

    useMaterial3: true,
  );
}
