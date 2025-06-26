import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _themeKey = 'isDarkMode';

class ChangeThemeProivder extends ChangeNotifier {
  final SharedPreferences _sharedPreferences;
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  ChangeThemeProivder(this._sharedPreferences) {
    _loadThemeFromCache();
  }

  Future<void> _loadThemeFromCache() async {
    bool? isDarkMode = _sharedPreferences.getBool(_themeKey);
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> _saveTheme(bool isDarkMode) async {
    await _sharedPreferences.setBool(_themeKey, isDarkMode);
  }

  void toggleTheme() {
    bool isDarkMode = _themeMode == ThemeMode.dark;
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    _saveTheme(isDarkMode);
    notifyListeners();
  }
}
