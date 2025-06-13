import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentTap(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  List<Widget> get destinations => [
    NavigationDestination(
      icon: const Icon(Icons.sports_baseball_outlined),
      label: 'Sports',
      selectedIcon: const Icon(Icons.sports_baseball),
    ),
    NavigationDestination(
      icon: const Icon(Icons.gamepad_outlined),
      label: 'Games',
      selectedIcon: const Icon(Icons.gamepad),
    ),
    NavigationDestination(
      icon: const Icon(Icons.tv_outlined),
      label: 'Entertainment',
      selectedIcon: const Icon(Icons.tv),
    ),
  ];

  Widget get appBarTitle {
    switch (_currentIndex) {
      case 0:
        return const Text('Sports');
      case 1:
        return const Text('Games');
      case 2:
        return const Text('Entertainment');
      default:
        return const Text('Home');
    }
  }

  List<Widget> get screens => [
    const Center(child: Text('Sports Screen')),
    const Center(child: Text('Games Screen')),
    const Center(child: Text('Entertainment Screen')),
  ];

  Widget get currentScreen => screens[_currentIndex];
}
