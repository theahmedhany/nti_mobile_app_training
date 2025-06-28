import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/weather_model.dart';
import '../utils/responsive_helpers/size_provider.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';
import 'hourly_forecast_item.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: const Size(65, 160),
      width: context.setMinSize(65),
      height: context.setMinSize(160),
      child: Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.only(left: context.setMinSize(14)),
          height: context.sizeProvider.height,
          child: ListView.builder(
            itemCount: weather.hourlyForecast.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              String currentTimeFormatted =
                  DateFormat('hh a').format(DateTime.now());

              DateTime forecastDateTime = DateTime.parse(
                weather.hourlyForecast[index]["time"],
              ).toLocal();
              String forecastTimeFormatted =
                  DateFormat('hh a').format(forecastDateTime);

              String forecastWeatherName =
                  weather.hourlyForecast[index]["condition"]["text"];
              String forecastWeatherIcon =
                  "${forecastWeatherName.replaceAll(' ', '').toLowerCase()}.png";
              String forecastTemperature =
                  weather.hourlyForecast[index]["temp_c"].round().toString();

              return HourlyForecastItem(
                forecastTimeFormatted: forecastTimeFormatted,
                forecastWeatherIcon: forecastWeatherIcon,
                forecastTemperature: forecastTemperature,
                currentTimeFormatted: currentTimeFormatted,
              );
            },
          ),
        );
      }),
    );
  }
}
