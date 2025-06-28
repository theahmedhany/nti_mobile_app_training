import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashIcon extends StatefulWidget {
  const SplashIcon({super.key});

  @override
  State<SplashIcon> createState() => _SplashIconState();
}

class _SplashIconState extends State<SplashIcon> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _rotateController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    _sizeAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut),
    );

    _sizeController.forward();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_sizeController, _rotateController]),
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotateController.value * 2 * pi,
          child: SizedBox(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            child: child,
          ),
        );
      },
      child: SvgPicture.asset('assets/images/Icon.svg', fit: BoxFit.cover),
    );
  }
}
