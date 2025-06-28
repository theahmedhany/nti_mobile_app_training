import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/widgets/custom_progress_indicator.dart';

import '../manager/weather_provider.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';
import '../widgets/custom_weather_card.dart';
import '../widgets/custom_weather_items_value.dart';
import '../widgets/forecasts_header_widget.dart';
import '../widgets/hourly_forecast_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(currentWeatherProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: weatherAsync.when(
        data: (weather) => SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                CustomWeatherCard(
                  cityController: _cityController,
                  size: Size(context.screenWidth, context.screenHeight),
                  weather: weather,
                ),
                SizedBox(height: context.setHeight(24)),
                CustomWeatherItemsValue(weather: weather),
                SizedBox(height: context.setHeight(24)),
                ForecastsHeaderWidget(weather: weather),
                SizedBox(height: context.setHeight(16)),
                HourlyForecastList(weather: weather),
                SizedBox(height: context.setHeight(24)),
              ],
            ),
          ),
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

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
