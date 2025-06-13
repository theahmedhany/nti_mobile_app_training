import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';

class MainCardItems extends StatelessWidget {
  final int value;
  final String unit;
  final String imageUrl;
  final String valueType;

  const MainCardItems({
    super.key,
    required this.value,
    required this.unit,
    required this.imageUrl,
    required this.valueType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: context.setMinSize(10),
                bottom: context.setMinSize(10),
              ),
              child: SvgPicture.asset(
                imageUrl,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
                width: context.setWidth(26),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueType,
                  style: TextStyle(
                    color: ThemeData()
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: context.setSp(14),
                  ),
                ),
                Text(
                  value.toString() + unit,
                  style: TextStyle(
                    color: AppColors.kFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.setSp(14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
