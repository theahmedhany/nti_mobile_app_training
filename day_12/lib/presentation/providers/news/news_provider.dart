import 'package:flutter/material.dart';

import '../../../data/models/news/article.dart';
import '../../../data/repositories/news/news_repository.dart';

enum NewsStatus { initial, loading, loaded, error }

class NewsNotifier extends ChangeNotifier {
  final NewsRepository newsRepository;

  NewsNotifier({required this.newsRepository});

  NewsStatus _status = NewsStatus.initial;
  List<Article> _articles = [];
  String? _errorMessage;

  NewsStatus get status => _status;
  List<Article> get articles => _articles;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNews(String category, String country, String lang) async {
    _status = NewsStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await newsRepository.getTopHeadlines(category, country, lang);
      _status = NewsStatus.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _status = NewsStatus.error;
      _articles = [];
    } finally {
      notifyListeners();
    }
  }
}
