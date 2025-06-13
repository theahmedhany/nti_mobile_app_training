import 'package:flutter/cupertino.dart';

import 'size_provider.dart';

extension SizeHelperExtensions on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get screenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  SizeProvider get sizeProvider => SizeProvider.of(this);

  double get scaleWidth => sizeProvider.width / sizeProvider.baseSize.width;
  double get scaleHeight => sizeProvider.height / sizeProvider.baseSize.height;

  double setWidth(num w) => w * scaleWidth;

  double setHeight(num h) => h * scaleHeight;

  double setSp(num fontSize) => fontSize * scaleWidth;

  double setMinSize(num size) =>
      size * (scaleWidth < scaleHeight ? scaleWidth : scaleHeight);
}
