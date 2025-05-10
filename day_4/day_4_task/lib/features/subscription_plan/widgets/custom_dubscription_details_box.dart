import 'package:day_4_task/features/subscription_plan/widgets/details_box_info.dart';
import 'package:flutter/material.dart';

class CustomSubscriptionDetailsBox extends StatelessWidget {
  const CustomSubscriptionDetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You\'ll get:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DetailsBoxInfo(title: 'Unlimited access.'),
            SizedBox(height: 6),
            DetailsBoxInfo(title: '200GB storage.'),
            SizedBox(height: 6),
            DetailsBoxInfo(title: 'Sync all your devices.'),
          ],
        ),
      ),
    );
  }
}
