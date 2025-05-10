import 'package:day_4_task/features/congratulations/widgets/congrats_button.dart';
import 'package:day_4_task/features/congratulations/widgets/congratulation_check_icon.dart';
import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CongratulationCheckIcon(),
            const SizedBox(height: 40),
            Text(
              'Congratulations!!!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Your order have been taken and\nis beeing attended to',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
            CongratsButton(
              press: () {},
              buttonText: 'Track Order',
              backgroundColor: Colors.orangeAccent,
              boarderColor: Colors.orangeAccent,
              textColor: Colors.white,
              width: 150,
            ),
            const SizedBox(height: 30),
            CongratsButton(
              press: () {},
              buttonText: 'Continue Shopping',
              backgroundColor: Colors.transparent,
              boarderColor: Colors.orangeAccent,
              textColor: Colors.orangeAccent,
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
