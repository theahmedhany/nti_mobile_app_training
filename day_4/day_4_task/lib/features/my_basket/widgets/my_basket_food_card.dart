import 'package:flutter/material.dart';

class MyBasketFoodCard extends StatelessWidget {
  const MyBasketFoodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.color,
  });

  final String title, subtitle, price, image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(subtitle, style: TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          Flexible(
            child: Text(
              price,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
