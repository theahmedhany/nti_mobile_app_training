import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/responsive_helpers/sizer_helper_extension.dart';
import 'custom_search_button.dart';

class CustomHeadRowData extends StatelessWidget {
  const CustomHeadRowData({
    super.key,
    required TextEditingController cityController,
    required this.size,
  }) : _cityController = cityController;

  final TextEditingController _cityController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/cloud.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: context.setWidth(30),
            height: context.setHeight(30),
          ),
          CustomSearchButton(
            cityController: _cityController,
            size: size,
          ),
        ],
      ),
    );
  }
}
