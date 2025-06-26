// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق الأخبار';

  @override
  String get sports => 'رياضة';

  @override
  String get politics => 'سياسة';

  @override
  String get entertainment => 'ترفيه';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'المظهر';

  @override
  String get lightMode => 'الوضع النهاري';

  @override
  String get darkMode => 'الوضع الليلي';

  @override
  String get errorLoadingNews => 'خطأ في تحميل الأخبار';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noNewsFound => 'لم يتم العثور على أخبار';

  @override
  String get search => 'بحث...';

  @override
  String get unexpectedError =>
      'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get noArticlesFound => 'لم يتم العثور على مقالات.';
}
