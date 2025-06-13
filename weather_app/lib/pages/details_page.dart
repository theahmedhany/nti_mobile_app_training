import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../manager/weather_provider.dart';
import '../models/weather_model.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';
import '../widgets/custom_progress_indicator.dart';
import '../widgets/weather_details_card.dart';

class DetailsPage extends ConsumerWidget {
  final String cityName;

  const DetailsPage({
    super.key,
    required this.cityName,
  });

  Map<String, dynamic> getForecastWeather(
      Map<String, dynamic> dayData, String date) {
    int maxWindSpeed = dayData["maxwind_kph"].toInt();
    int avgHumidity = dayData["avghumidity"].toInt();
    int chanceOfRain = dayData["daily_chance_of_rain"].toInt();
    var parsedDate = DateTime.parse(date);
    var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

    String weatherName = dayData["condition"]["text"];
    String weatherIcon = "${weatherName.replaceAll(' ', '').toLowerCase()}.png";

    int minTemperature = dayData["mintemp_c"].toInt();
    int maxTemperature = dayData["maxtemp_c"].toInt();

    return {
      'maxWindSpeed': maxWindSpeed,
      'avgHumidity': avgHumidity,
      'chanceOfRain': chanceOfRain,
      'forecastDate': forecastDate,
      'weatherName': weatherName,
      'weatherIcon': weatherIcon,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider(cityName));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Forecasts',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: context.setSp(24),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: context.setMinSize(8)),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              'assets/icons/back_arrow.svg',
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
              width: context.setWidth(40),
              height: context.setHeight(40),
            ),
          ),
        ),
      ),
      body: weatherAsync.when(
        data: (weather) => _buildWeatherDetails(
          weather: weather,
          context: context,
        ),
        loading: () => Center(
          child: CustomProgressIndicator(
            color: theme.colorScheme.primary,
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            error.toString(),
            style: TextStyle(
              color: theme.colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetails({
    required BuildContext context,
    required WeatherModel weather,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setMinSize(14)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.setHeight(20)),
            for (int i = 0; i < weather.dailyForecast.length; i++)
              WeatherDetailsCard(
                forecastData: getForecastWeather(
                  weather.dailyForecast[i]['day'],
                  weather.dailyForecast[i]['date'],
                ),
                isToday: i == 0,
              ),
            SizedBox(height: context.setHeight(20)),
          ],
        ),
      ),
    );
  }
}
