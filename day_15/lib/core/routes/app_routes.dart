import 'package:day_14/features/home/presentation/home_view.dart';
import 'package:day_14/features/login/screens/login_screen.dart';
import 'package:day_14/features/splash/screens/splash_screen.dart';
import 'package:day_14/features/start/start_view.dart';
import 'package:flutter/material.dart';

class AppRoutesNames {
  static const String splash = '/';
  static const String start = '/start';
  static const String login = '/login';
  static const String home = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutesNames.start:
        return MaterialPageRoute(builder: (_) => const StartView());
      case AppRoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutesNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return null;
    }
  }
}
