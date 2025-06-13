import 'package:flutter/cupertino.dart';

class SizeProvider extends InheritedWidget {
  final Size baseSize;
  final double width;
  final double height;

  const SizeProvider({
    super.key,
    required this.baseSize,
    required this.width,
    required this.height,
    required super.child,
  });

  static SizeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant SizeProvider oldWidget) {
    return baseSize != oldWidget.baseSize ||
        width != oldWidget.width ||
        height != oldWidget.height ||
        child != oldWidget.child;
  }
}
