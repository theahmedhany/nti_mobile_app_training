import 'package:apis_nti_app/configs/extentions/context_extention.dart';
import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  List<String> getCurrentTitle(BuildContext context) => [
    context.appLocalizations.sports,
    context.appLocalizations.politics,
    context.appLocalizations.entertainment,
  ];

  List<Widget> views(BuildContext context) {
    return [
      Center(child: Text(context.appLocalizations.sports)),
      Center(child: Text(context.appLocalizations.politics)),
      Center(child: Text(context.appLocalizations.entertainment)),
    ];
  }

  List<Widget> destinations(BuildContext context) {
    return [
      NavigationDestination(
        icon: Icon(Icons.sports_football_sharp),
        label: context.appLocalizations.sports,
      ),
      NavigationDestination(
        icon: Icon(Icons.newspaper),
        label: context.appLocalizations.politics,
      ),
      NavigationDestination(
        icon: Icon(Icons.games_outlined),
        label: context.appLocalizations.entertainment,
      ),
    ];
  }
}
