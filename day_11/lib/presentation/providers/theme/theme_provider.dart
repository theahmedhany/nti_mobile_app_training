import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _themeKey = 'theme_key';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _loadThemeDate();
  }
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  //get last cashed theme
  Future<void> _loadThemeDate() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    // true >> dark
    // false >> light
    final bool newVal = sharedPreferences.getBool(_themeKey) ?? false;
    _themeMode = newVal ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    _saveThemeData(_themeMode == ThemeMode.dark);
    // bool isDark = _themeMode == ThemeMode.dark;

    // if (_themeMode == ThemeMode.light) {
    //   _themeMode = ThemeMode.dark;
    //   notifyListeners();
    //   _saveThemeData(isDark);
    // } else if (_themeMode == ThemeMode.dark) {
    //   _themeMode = ThemeMode.light;
    //   notifyListeners();
    //   _saveThemeData(isDark);
    // }
  }

  Future<void> _saveThemeData(bool isDark) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setBool(_themeKey, isDark);
  }
}
