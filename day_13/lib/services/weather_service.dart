import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '424557b5ea9a430788a153613250402';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({String cityName = 'Cairo'}) async {
    try {
      Response response = await dio.get('$baseUrl/forecast.json',
          queryParameters: {'key': apiKey, 'q': cityName, 'days': 7});

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error. Please try again later!';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Oops, there was an error. Please try again later!');
    }
  }
}
