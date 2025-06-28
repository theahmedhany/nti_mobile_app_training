import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/weather_model.dart';
import '../utils/constants.dart';
import '../utils/responsive_helpers/size_provider.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';
import 'main_card_items.dart';

class CustomWeatherItemsValue extends StatelessWidget {
  const CustomWeatherItemsValue({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: const Size(250, 250),
      width: context.setMinSize(250),
      height: context.setMinSize(250),
      child: Builder(builder: (context) {
        return Container(
          padding: EdgeInsets.all(context.setMinSize(20)),
          margin: EdgeInsets.symmetric(horizontal: context.setMinSize(12)),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGreyColor.withValues(alpha: 0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/air_quality.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.kPrimaryColor,
                      BlendMode.srcIn,
                    ),
                    width: context.setWidth(40),
                  ),
                  SizedBox(width: context.setWidth(12)),
                  Text(
                    'Air Quality',
                    style: TextStyle(
                      color: AppColors.kPurpleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: context.setSp(26),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.setWidth(12)),
              Row(
                children: [
                  MainCardItems(
                    value: weather.feelsLike.round(),
                    unit: ' °',
                    imageUrl: 'assets/icons/real_feel.svg',
                    valueType: 'Real Feel',
                  ),
                  const Spacer(),
                  MainCardItems(
                    value: weather.windSpeed.round(),
                    unit: ' km/h',
                    imageUrl: 'assets/icons/wind.svg',
                    valueType: 'Wind',
                  ),
                  const Spacer(),
                  MainCardItems(
                    value: weather.humidity.round(),
                    unit: '%',
                    imageUrl: 'assets/icons/humidity.svg',
                    valueType: 'Humidity',
                  ),
                ],
              ),
              SizedBox(height: context.setWidth(12)),
              Row(
                children: [
                  MainCardItems(
                    value: weather.rain.round(),
                    unit: '%',
                    imageUrl: 'assets/icons/chance_of_rain.svg',
                    valueType: 'Rain    ',
                  ),
                  const Spacer(),
                  MainCardItems(
                    value: weather.uvIndex.toInt(),
                    unit: ' ',
                    imageUrl: 'assets/icons/uv_index.svg',
                    valueType: 'UV Index',
                  ),
                  const Spacer(),
                  MainCardItems(
                    value: weather.cloudCover.toInt(),
                    unit: '%',
                    imageUrl: 'assets/icons/cloud_value.svg',
                    valueType: 'Cloud    ',
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
