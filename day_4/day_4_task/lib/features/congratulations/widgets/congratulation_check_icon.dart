import 'package:flutter/material.dart';

class CongratulationCheckIcon extends StatelessWidget {
  const CongratulationCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
