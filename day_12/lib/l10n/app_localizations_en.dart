// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'News App';

  @override
  String get sports => 'Sports';

  @override
  String get politics => 'Politics';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get errorLoadingNews => 'Error loading news';

  @override
  String get retry => 'Retry';

  @override
  String get noNewsFound => 'No news found';

  @override
  String get search => 'Search...';

  @override
  String get unexpectedError =>
      'An unexpected error occurred. Please try again later.';

  @override
  String get noArticlesFound => 'No articles found.';
}
