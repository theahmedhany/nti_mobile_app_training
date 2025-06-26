import 'package:flutter/material.dart';
import 'package:news_provider/config/extensions/context_extension.dart';
import 'package:news_provider/presentation/widgets/news_list.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<String> _titles(BuildContext context) => [
    context.appLocalizations.sports,
    context.appLocalizations.politics,
    context.appLocalizations.entertainment,
  ];

  final List<Widget> views = [
    const NewsList(category: 'sports'),
    const NewsList(category: 'politics'),
    const NewsList(category: 'entertainment'),
  ];

  List<Widget> destinations(BuildContext context) => [
    NavigationDestination(
      icon: const Icon(Icons.sports_soccer),
      label: context.appLocalizations.sports,
    ),
    NavigationDestination(
      icon: const Icon(Icons.account_balance),
      label: context.appLocalizations.politics,
    ),
    NavigationDestination(
      icon: const Icon(Icons.movie),
      label: context.appLocalizations.entertainment,
    ),
  ];

  String getCurrentTitle(BuildContext context) {
    return _titles(context)[_currentIndex];
  }

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
