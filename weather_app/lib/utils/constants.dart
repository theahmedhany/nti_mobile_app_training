import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFF866BFC);
  static const kBackgroundColor = Color(0xFFF3E8F4);
  static const kGreyColor = Color(0xFFC6C6C6);
  static const kFontColor = Color(0xff26272f);
  static const kBlueColor = Color(0xFF5664EF);
  static const kPurpleColor = Color(0xFFB162E8);
  static const kPinkColor = Color(0xFFF860E5);

  static final Shader kFontGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFFEFFFE),
      Color(0xFFD7C4FF),
    ],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  static const kPrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFF860E5),
      Color(0xFFB162E8),
      Color(0xFF5664EF),
    ],
  );
}
