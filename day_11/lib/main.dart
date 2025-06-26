import 'package:apis_nti_app/configs/themes/app_theme.dart';
import 'package:apis_nti_app/l10n/app_localizations.dart';
import 'package:apis_nti_app/presentation/providers/localization/localization_provider.dart';
import 'package:apis_nti_app/presentation/providers/navigation/navigation_bar_provider.dart';
import 'package:apis_nti_app/presentation/providers/theme/theme_provider.dart';
import 'package:apis_nti_app/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
      ],
      child: Consumer2<ThemeProvider, LocalizationProvider>(
        builder: (_, themeProvider, localizationProvider, __) {
          return MaterialApp(
            locale: Locale(localizationProvider.currentLang),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightThemeMode,
            darkTheme: AppTheme.darkThemeMode,
          );
        },
      ),
    );
  }
}
