import 'package:flutter/material.dart';

class MyBasketAppBar extends StatelessWidget {
  const MyBasketAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.orangeAccent),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Go Back',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              const Text(
                'My Basket',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
