import 'package:flutter/material.dart';

ThemeMode themeMode = ThemeMode.light;

void changeTheme() {
  if (themeMode == ThemeMode.light) {
    themeMode = ThemeMode.dark;
  } else if (themeMode == ThemeMode.dark) {
    themeMode = ThemeMode.light;
  }
}
