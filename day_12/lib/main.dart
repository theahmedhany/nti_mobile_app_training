import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_provider/config/themes/app_theme.dart';
import 'package:news_provider/l10n/app_localizations.dart';
import 'package:news_provider/presentation/providers/localization/localization_provider.dart';
import 'package:news_provider/presentation/providers/navigation/navigation_provider.dart';
import 'package:news_provider/presentation/providers/themes/themes_provider.dart';
import 'package:news_provider/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_client.dart';
import 'data/repositories/news/news_repository.dart';
import 'presentation/providers/news/news_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>.value(value: sharedPreferences),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(
          create: (_) => ChangeThemeProivder(sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => LocalizationProvider(sharedPreferences),
        ),
        Provider<ApiClient>(create: (_) => ApiClient()),
        Provider<NewsRepository>(
          create:
              (context) =>
                  NewsRepositoryImpl(apiClient: context.read<ApiClient>()),
        ),
        ChangeNotifierProvider<NewsNotifier>(
          create:
              (context) =>
                  NewsNotifier(newsRepository: context.read<NewsRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ChangeThemeProivder, LocalizationProvider>(
      builder: (_, themeProvider, localeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightThemeMode,
          darkTheme: AppTheme.darkThemeMode,
          locale: localeProvider.locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomeScreen(),
        );
      },
    );
  }
}
