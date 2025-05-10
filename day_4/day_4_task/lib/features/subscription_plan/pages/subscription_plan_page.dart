import 'package:day_4_task/features/subscription_plan/widgets/custom_dubscription_details_box.dart';
import 'package:day_4_task/features/subscription_plan/widgets/subscription_button.dart';
import 'package:day_4_task/features/subscription_plan/widgets/subscription_plan_card.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanPage extends StatelessWidget {
  const SubscriptionPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                const Text(
                  'Choose your\nsubscription plan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'And get a 7-day free trial',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 50),
                SubscriptionPlanCard(
                  isSelected: true,
                  title: 'Yearly',
                  subTitle: '-66% discount',
                  price: '\$94.80',
                  plan: 'every year',
                ),
                const SizedBox(height: 20),
                SubscriptionPlanCard(
                  isSelected: false,
                  title: 'Monthly',
                  subTitle: '-53% discount',
                  price: '\$10.90',
                  plan: 'every month',
                ),
                const SizedBox(height: 20),
                SubscriptionPlanCard(
                  isSelected: false,
                  title: 'Weekly',
                  subTitle: '',
                  price: '\$5.70',
                  plan: 'every week',
                ),
                const SizedBox(height: 50),
                CustomSubscriptionDetailsBox(),
                const SizedBox(height: 60),
                SubscriptionButton(buttonText: 'Subscribe', press: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
