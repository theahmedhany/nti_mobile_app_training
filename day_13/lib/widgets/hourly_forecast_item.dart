import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
    required this.forecastTimeFormatted,
    required this.forecastWeatherIcon,
    required this.forecastTemperature,
    required this.currentTimeFormatted,
  });

  final String forecastTimeFormatted;
  final String forecastWeatherIcon;
  final String forecastTemperature;
  final String currentTimeFormatted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.setMinSize(16)),
      margin: EdgeInsets.only(right: context.setMinSize(14)),
      width: context.sizeProvider.width,
      decoration: BoxDecoration(
        gradient: currentTimeFormatted == forecastTimeFormatted
            ? LinearGradient(
                colors: AppColors.kPrimaryGradient.colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
                colors: [
                  AppColors.kBackgroundColor,
                  AppColors.kBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(
          width: 1,
          color: currentTimeFormatted == forecastTimeFormatted
              ? Colors.transparent
              : AppColors.kPurpleColor.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            forecastTimeFormatted,
            style: TextStyle(
              fontSize: context.setSp(18),
              fontWeight: FontWeight.w500,
              foreground: currentTimeFormatted == forecastTimeFormatted
                  ? (Paint()..shader = AppColors.kFontGradient)
                  : (Paint()..color = AppColors.kFontColor),
            ),
          ),
          Image.asset(
            'assets/images/$forecastWeatherIcon',
            width: context.setWidth(38),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: context.setMinSize(8)),
                child: Text(
                  forecastTemperature,
                  style: TextStyle(
                    fontSize: context.setSp(20),
                    fontWeight: FontWeight.bold,
                    foreground: currentTimeFormatted == forecastTimeFormatted
                        ? (Paint()..shader = AppColors.kFontGradient)
                        : (Paint()..color = AppColors.kFontColor),
                  ),
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  fontSize: context.setSp(24),
                  fontWeight: FontWeight.bold,
                  foreground: currentTimeFormatted == forecastTimeFormatted
                      ? (Paint()..shader = AppColors.kFontGradient)
                      : (Paint()..color = AppColors.kFontColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
