import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _localKey = 'local_key';

class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider() {
    _loadLocalization();
  }
  String _currentLang = "en";

  String get currentLang => _currentLang;

  Future<void> _loadLocalization() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final bool newVal = sharedPreferences.getBool(_localKey) ?? true;
    _currentLang = newVal ? "en" : "ar";
    notifyListeners();
  }

  void changeLang(String value) {
    if (value == "en") {
      _currentLang = "en";
    } else {
      _currentLang = "ar";
    }
    notifyListeners();
    _saveLocalization(value == 'en');
  }

  Future<void> _saveLocalization(bool isEn) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setBool(_localKey, isEn);
  }
}
