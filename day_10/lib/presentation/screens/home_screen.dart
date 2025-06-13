import 'package:day_10/presentation/manager/bottom_navigation_bar_provider.dart';
import 'package:day_10/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: context.watch<BottomNavigationBarProvider>().destinations,
        selectedIndex:
            context.watch<BottomNavigationBarProvider>().currentIndex,
        onDestinationSelected: (index) {
          context.read<BottomNavigationBarProvider>().changeCurrentTap(index);
        },
      ),
      appBar: AppBar(
        title: context.watch<BottomNavigationBarProvider>().appBarTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: context.watch<BottomNavigationBarProvider>().currentIndex,
        children: context.watch<BottomNavigationBarProvider>().screens,
      ),
    );
  }
}
