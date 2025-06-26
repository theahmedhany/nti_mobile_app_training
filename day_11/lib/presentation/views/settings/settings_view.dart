import 'package:apis_nti_app/configs/extentions/context_extention.dart';
import 'package:apis_nti_app/presentation/providers/localization/localization_provider.dart';
import 'package:apis_nti_app/presentation/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalizations.settings)),
      body: ListView(
        children: [
          ListTile(
            trailing: Switch(
              value: isDark,
              onChanged: (_) {
                context.read<ThemeProvider>().changeTheme();
              },
            ),
            leading: Icon(Icons.brightness_6),
            title: Text(context.appLocalizations.theme),
            subtitle: Text(
              isDark
                  ? context.appLocalizations.darkMode
                  : context.appLocalizations.lightMode,
            ),
          ),

          ListTile(
            leading: Icon(Icons.language),

            title: Text(context.appLocalizations.language),
            trailing: DropdownButton<String>(
              value: context.watch<LocalizationProvider>().currentLang,
              items: [
                DropdownMenuItem(value: 'en', child: Text("English")),
                DropdownMenuItem(value: 'ar', child: Text("العربية")),
              ],
              onChanged: (value) {
                context.read<LocalizationProvider>().changeLang(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
