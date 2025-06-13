import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../manager/weather_provider.dart';
import '../utils/constants.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';
import 'custom_model_bottom_sheet.dart';

class CustomSearchButton extends ConsumerWidget {
  const CustomSearchButton({
    super.key,
    required TextEditingController cityController,
    required this.size,
  }) : _cityController = cityController;

  final TextEditingController _cityController;
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(currentWeatherProvider);

    return weatherAsync.when(
      data: (weather) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _cityController.clear();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.kBackgroundColor,
            builder: (context) => CustomModelBottomSheet(
              size: size,
              cityController: _cityController,
            ),
          );
        },
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: context.setWidth(22),
              height: context.setHeight(22),
            ),
            SizedBox(width: context.setWidth(8)),
            Text(
              weather.cityName.length > 15
                  ? '${weather.cityName.substring(0, 18)}...'
                  : weather.cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.setSp(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: context.setWidth(8)),
            SvgPicture.asset(
              'assets/icons/bottom_arrow.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: context.setWidth(18),
              height: context.setHeight(18),
            ),
          ],
        ),
      ),
      loading: () => const CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: null,
        child: Text(
          "Loading...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      error: (error, stack) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _cityController.clear();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.kBackgroundColor,
            builder: (context) => CustomModelBottomSheet(
              size: size,
              cityController: _cityController,
            ),
          );
        },
        child: const Text(
          "Enter a city",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
