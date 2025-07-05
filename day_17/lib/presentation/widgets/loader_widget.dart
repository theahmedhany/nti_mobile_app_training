import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/images_manager.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _rotateController;

  late Animation<double> _sizeAnimation;
  @override
  void initState() {
    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _sizeAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeOutBack),
    );

    _sizeController.forward();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
      child: SvgPicture.asset(AssetsManager.logo),
    );
  }
}
