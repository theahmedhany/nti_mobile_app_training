import 'package:flutter/material.dart';
import 'package:news_provider/data/repositories/news/news_repository.dart';
import 'package:news_provider/presentation/providers/navigation/navigation_provider.dart';
import 'package:news_provider/presentation/providers/news/news_provider.dart';
import 'package:news_provider/presentation/screens/settings_screen.dart';
import 'package:news_provider/presentation/widgets/news_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NewsNotifier> _newsNotifiers = [];
  final List<String> _categories = ['sports', 'politics', 'entertainment'];

  @override
  void initState() {
    super.initState();
    final newsRepository = context.read<NewsRepository>();
    for (var _ in _categories) {
      _newsNotifiers.add(NewsNotifier(newsRepository: newsRepository));
    }
  }

  @override
  void dispose() {
    for (var notifier in _newsNotifiers) {
      notifier.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationProvider>();

    final List<Widget> views =
        _categories.asMap().entries.map((entry) {
          int idx = entry.key;
          String category = entry.value;
          return ChangeNotifierProvider.value(
            value: _newsNotifiers[idx],
            child: NewsList(category: category),
          );
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(navProvider.getCurrentTitle(context)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: IndexedStack(index: navProvider.currentIndex, children: views),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navProvider.currentIndex,
        destinations: navProvider.destinations(context),
        onDestinationSelected:
            (index) =>
                context.read<NavigationProvider>().changeCurrentIndex(index),
      ),
    );
  }
}
