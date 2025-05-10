import 'package:flutter/material.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.plan,
    required this.isSelected,
  });

  final bool isSelected;

  final String title, subTitle, price, plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            isSelected
                ? Colors.blueAccent.withValues(alpha: 0.1)
                : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color:
              isSelected
                  ? Colors.blueAccent.withValues(alpha: 0.1)
                  : Colors.grey,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.circle_outlined,
              color: isSelected ? Colors.blueAccent : Colors.grey,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                Text(plan, style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
