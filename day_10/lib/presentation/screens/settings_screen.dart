import 'package:day_10/presentation/manager/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Theme'),
              trailing: Switch(
                value:
                    context.watch<ThemesProvider>().themeMode == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemesProvider>().toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
