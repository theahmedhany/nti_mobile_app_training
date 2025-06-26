import 'package:apis_nti_app/presentation/providers/navigation/navigation_bar_provider.dart';
import 'package:apis_nti_app/presentation/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationBarProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            navProvider.getCurrentTitle(context)[navProvider.currentIndex],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsView()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(Icons.settings, size: 30),
            ),
          ),
        ],
      ),
      body: navProvider.views(context)[navProvider.currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: navProvider.destinations(context),
        selectedIndex: navProvider.currentIndex,
        onDestinationSelected: (index) {
          context.read<NavigationBarProvider>().changeCurrentIndex(index);
        },
      ),
    );
  }
}
