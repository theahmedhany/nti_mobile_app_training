import 'package:day_4_task/features/congratulations/pages/congratulations_page.dart';
import 'package:day_4_task/features/home/widgets/custom_home_button.dart';
import 'package:day_4_task/features/info/pages/info_page.dart';
import 'package:day_4_task/features/my_basket/pages/my_basket_page.dart';
import 'package:day_4_task/features/privacy/pages/privacy_page.dart';
import 'package:day_4_task/features/subscription_plan/pages/subscription_plan_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withValues(alpha: 0.4),
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text(
                'Choose what page you want to go to',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            CustomHomeButton(
              buttonText: 'Subscription Plan',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionPlanPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomHomeButton(
              buttonText: 'Info',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomHomeButton(
              buttonText: 'Congratulations',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CongratulationsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomHomeButton(
              buttonText: 'My Basket',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBasketPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomHomeButton(
              buttonText: 'Privacy',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrivacyPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
