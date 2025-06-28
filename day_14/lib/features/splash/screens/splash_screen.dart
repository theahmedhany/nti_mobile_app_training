import 'package:day_14/features/splash/widgets/splash_icon.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(width: 100, height: 100, child: SplashIcon()),
      ),
    );
  }
}
