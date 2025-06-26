import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _localeKey = 'Change-Lang';

class LocalizationProvider extends ChangeNotifier {
  late Locale _locale;
  final SharedPreferences _sharedPreferences;
  LocalizationProvider(this._sharedPreferences) {
    _loadLocale();
  }

  Locale get locale => _locale;

  void _loadLocale() {
    String? countryCode = _sharedPreferences.getString(_localeKey);

    _locale = countryCode != null ? Locale(countryCode) : Locale('en');
    notifyListeners();
  }

  Future<void> _saveLocale(String countryCode) async {
    _sharedPreferences.setString(_localeKey, countryCode);
  }

  void changeCurrentLang(String countryCode) {
    _locale = Locale(countryCode);
    notifyListeners();
    _saveLocale(countryCode);
  }
}
