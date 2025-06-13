import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';

final locationServiceProvider = Provider((ref) => LocationService());

final weatherServiceProvider = Provider((ref) => WeatherService(Dio()));

final currentLocationProvider = FutureProvider<Position>((ref) async {
  final locationService = ref.watch(locationServiceProvider);
  return locationService.getCurrentLocation();
});

final searchCityProvider = StateProvider<String?>((ref) => null);

final weatherProvider =
    FutureProvider.family<WeatherModel, String>((ref, cityName) async {
  final weatherService = ref.watch(weatherServiceProvider);
  try {
    return await weatherService.getCurrentWeather(cityName: cityName);
  } catch (e) {
    final position = await ref.watch(currentLocationProvider.future);
    return weatherService.getCurrentWeather(
      cityName: '${position.latitude},${position.longitude}',
    );
  }
});

final currentWeatherProvider = FutureProvider<WeatherModel>((ref) async {
  final searchCity = ref.watch(searchCityProvider);

  if (searchCity != null) {
    try {
      final weatherService = ref.watch(weatherServiceProvider);
      return await weatherService.getCurrentWeather(cityName: searchCity);
    } catch (e) {
      final position = await ref.watch(currentLocationProvider.future);
      final weatherService = ref.watch(weatherServiceProvider);
      return weatherService.getCurrentWeather(
        cityName: '${position.latitude},${position.longitude}',
      );
    }
  }

  try {
    final position = await ref.watch(currentLocationProvider.future);
    final weatherService = ref.watch(weatherServiceProvider);
    return weatherService.getCurrentWeather(
      cityName: '${position.latitude},${position.longitude}',
    );
  } catch (e) {
    final weatherService = ref.watch(weatherServiceProvider);
    return weatherService.getCurrentWeather(cityName: 'London');
  }
});
