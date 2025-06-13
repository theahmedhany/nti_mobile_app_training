import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../pages/details_page.dart';
import '../utils/constants.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';

class ForecastsHeaderWidget extends StatelessWidget {
  const ForecastsHeaderWidget({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: context.setSp(20),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsPage(
                    cityName: weather.cityName,
                  ),
                ),
              );
            },
            child: Text(
              'Forecasts',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: context.setSp(18),
                color: AppColors.kPurpleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
