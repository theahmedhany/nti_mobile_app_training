import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 57.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0XFF40BFFF), //
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF40BFFF).withValues(alpha: 0.24), // Shadow color
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
