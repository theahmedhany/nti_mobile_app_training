import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({
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
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
