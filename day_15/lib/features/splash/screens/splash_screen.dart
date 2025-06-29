import 'package:day_14/features/splash/widgets/splash_icon.dart';
import 'package:day_14/features/start/start_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const StartView()),
            (route) => false,
          );
        }),
        builder: (context, snapshot) {
          return Center(
            child: SizedBox(width: 100, height: 100, child: SplashIcon()),
          );
        },
      ),
    );
  }
}
