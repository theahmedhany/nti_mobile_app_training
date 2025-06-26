import 'package:flutter/material.dart';
import 'package:news_provider/config/extensions/context_extension.dart';
import 'package:news_provider/presentation/providers/localization/localization_provider.dart';
import 'package:news_provider/presentation/widgets/news_item_builder.dart';
import 'package:provider/provider.dart';

import '../providers/news/news_provider.dart';

class NewsList extends StatefulWidget {
  final String category;

  const NewsList({super.key, required this.category});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  bool _hasFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasFetched) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final newsNotifier = context.read<NewsNotifier>();
        final languageCode =
            context.read<LocalizationProvider>().locale.languageCode;
        final country = languageCode == 'en' ? 'us' : 'eg';

        newsNotifier.fetchNews(widget.category, country, languageCode);
      });
      _hasFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsNotifier>(
      builder: (_, notifier, __) {
        switch (notifier.status) {
          case NewsStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case NewsStatus.error:
            return Center(
              child: Text(
                notifier.errorMessage ??
                    context.appLocalizations.unexpectedError,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );

          case NewsStatus.loaded:
            if (notifier.articles.isEmpty) {
              return Center(
                child: Text(
                  context.appLocalizations.noArticlesFound,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: notifier.articles.length,
              itemBuilder:
                  (_, index) =>
                      NewsItemBuilder(article: notifier.articles[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
            );

          case NewsStatus.initial:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
