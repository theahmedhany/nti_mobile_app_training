import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/responsive_helpers/size_provider.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';

class WeatherDetailsCard extends StatelessWidget {
  final Map<String, dynamic> forecastData;
  final bool isToday;

  const WeatherDetailsCard(
      {super.key, required this.forecastData, required this.isToday});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizeProvider(
      baseSize: const Size(250, 100),
      width: context.setMinSize(250),
      height: context.setMinSize(100),
      child: Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.only(bottom: context.setMinSize(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGreyColor.withValues(alpha: 0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
              colors: isToday
                  ? (AppColors.kPrimaryGradient.colors)
                  : [
                      Colors.white.withValues(alpha: 0.7),
                      Colors.white.withValues(alpha: 0.7),
                    ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            border: Border.all(
              width: 1,
              color: isToday
                  ? Colors.transparent
                  : AppColors.kPurpleColor.withValues(alpha: 0.4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.setMinSize(10),
                vertical: context.setMinSize(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/${forecastData["weatherIcon"] ?? 'assets/images/heavycloudy.png'}',
                  width: context.setWidth(72),
                ),
                SizedBox(width: context.setWidth(12)),
                Column(
                  children: [
                    Text(
                      forecastData["forecastDate"],
                      style: TextStyle(
                        color: isToday ? Colors.white : AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: context.setSp(14),
                      ),
                    ),
                    Text(
                      '${forecastData["weatherName"].length > 13 ? forecastData["weatherName"].substring(0, 13) + "..." : forecastData["weatherName"]}',
                      style: TextStyle(
                        fontSize: context.setSp(22),
                        color: isToday
                            ? Colors.white
                            : theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: context.setWidth(18)),
                Column(
                  children: [
                    _temperatureText(
                      temperature: forecastData["maxTemperature"],
                      color: isToday ? Colors.white : AppColors.kPurpleColor,
                      size: context.setSp(36),
                      context: context,
                    ),
                    _temperatureText(
                      temperature: forecastData["minTemperature"],
                      color: isToday ? Colors.white : AppColors.kPinkColor,
                      size: context.setSp(24),
                      context: context,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _temperatureText(
      {required int temperature,
      required Color color,
      required double size,
      required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.setMinSize(8)),
          child: Text(
            temperature.round().toString(),
            style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          '°',
          style: TextStyle(
            fontSize: context.setSp(22),
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
