import 'package:day_4_task/features/my_basket/widgets/my_basket_app_bar.dart';
import 'package:day_4_task/features/my_basket/widgets/my_basket_food_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBasketPage extends StatelessWidget {
  const MyBasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MyBasketAppBar(),
          SizedBox(height: 20),
          MyBasketFoodCard(
            title: 'Quinoa Fruit Salad',
            subtitle: '2 Packs',
            price: '\$ 5.15',
            image: 'assets/images/food_1.png',
            color: Colors.orange.withValues(alpha: 0.2),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.4), thickness: 1),
          MyBasketFoodCard(
            title: 'Melon Fruit Salad',
            subtitle: '2 Packs',
            price: '\$ 8.54',
            image: 'assets/images/food_2.png',
            color: Colors.purpleAccent.withValues(alpha: 0.2),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.4), thickness: 1),
          MyBasketFoodCard(
            title: 'Tropical Fruit Salad',
            subtitle: '2 Packs',
            price: '\$ 12.45',
            image: 'assets/images/food_3.png',
            color: Colors.red.withValues(alpha: 0.2),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.4), thickness: 1),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total', style: TextStyle(fontSize: 18)),
                    Text(
                      '\$452.54',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                MyBasketButton(buttonText: 'Checkout', press: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyBasketButton extends StatelessWidget {
  const MyBasketButton({
    super.key,
    required this.buttonText,
    required this.press,
  });

  final String buttonText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: press,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
