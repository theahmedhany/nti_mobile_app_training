import 'package:flutter/material.dart';
import 'package:news_provider/config/extensions/context_extension.dart';
import 'package:news_provider/presentation/providers/localization/localization_provider.dart';
import 'package:news_provider/presentation/providers/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.appLocalizations.settings, //
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(context.appLocalizations.language), //
            trailing: DropdownButton<String>(
              value: context.watch<LocalizationProvider>().locale.languageCode,
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'), //
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('ألعربية'), //
                ),
              ],
              onChanged: (value) {
                context.read<LocalizationProvider>().changeCurrentLang(value!);
              }, //
            ),
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text(context.appLocalizations.theme),
            subtitle: Text(
              context.isDarkMode
                  ? context.appLocalizations.darkMode
                  : context.appLocalizations.lightMode, //
            ),
            trailing: Switch(
              value: context.isDarkMode,
              onChanged: (_) {
                context.read<ChangeThemeProivder>().toggleTheme();
              }, //
            ),
          ),
        ], //
      ),
    );
  }
}
