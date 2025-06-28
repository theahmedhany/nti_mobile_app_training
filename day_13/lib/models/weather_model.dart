class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final String condition;
  final double windSpeed;
  final double feelsLike;
  final double uvIndex;
  final int humidity;
  final int cloudCover;
  final double rain;
  final List hourlyForecast;
  final List dailyForecast;
  late String weatherIcon;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.condition,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
    required this.cloudCover,
    required this.hourlyForecast,
    required this.dailyForecast,
    required this.feelsLike,
    required this.uvIndex,
    required this.rain,
  }) {
    weatherIcon = "${condition.replaceAll(' ', '').toLowerCase()}.png";
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String conditionText = json['current']['condition']['text'];

    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['location']['localtime']),
      temp: json['current']['temp_c'].toDouble(),
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      condition: conditionText,
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      windSpeed: json['current']['wind_kph'].toDouble(),
      humidity: json['current']['humidity'].toInt(),
      cloudCover: json['current']['cloud'].toInt(),
      rain: json['current']['precip_in'].toDouble(),
      uvIndex: json['current']['uv'].toDouble(),
      feelsLike: (json['current']['feelslike_c'] != null)
          ? json['current']['feelslike_c'].toDouble()
          : json['current']['temp_c'].toDouble(),
      hourlyForecast: json['forecast']['forecastday'][0]['hour'],
      dailyForecast: json['forecast']['forecastday'],
    );
  }
}
