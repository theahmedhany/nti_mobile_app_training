import 'package:day_10/config/shared_pref_helper.dart';
import 'package:flutter/material.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      SharedPrefHelper.setData('themeMode', 'dark');
    } else {
      _themeMode = ThemeMode.light;
      SharedPrefHelper.setData('themeMode', 'light');
    }
    notifyListeners();
  }

  Future<void> loadTheme() async {
    String? theme = await SharedPrefHelper.getString('themeMode');
    if (theme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (theme == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  ThemeData get currentTheme {
    if (_themeMode == ThemeMode.dark) {
      return ThemeData.dark();
    } else if (_themeMode == ThemeMode.light) {
      return ThemeData.light();
    } else {
      return ThemeData.fallback();
    }
  }
}
