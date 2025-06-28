import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/home_page.dart';
import 'utils/responsive_helpers/size_provider.dart';
import 'utils/responsive_helpers/sizer_helper_extension.dart';
import 'utils/theme/app_theme.dart';
import 'widgets/network_connection.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizeProvider(
      baseSize: const Size(360, 690),
      height: context.screenHeight,
      width: context.screenWidth,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        builder: (context, child) {
          return NetworkConnection(child: child!);
        },
        home: const HomePage(),
      ),
    );
  }
}
