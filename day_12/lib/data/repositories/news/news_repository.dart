import 'dart:developer';

import '../../models/news/article.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines(
    String category,
    String country,
    String language,
  );
}

class NewsRepositoryImpl implements NewsRepository {
  final ApiClient apiClient;

  NewsRepositoryImpl({required this.apiClient});

  @override
  Future<List<Article>> getTopHeadlines(
    String category,
    String country,
    String language,
  ) async {
    try {
      final response = await apiClient.get(
        ApiConstants.topHeadlines,
        queryParameters: {
          'language': language,
          'country': country,
          'category': category, // e.g., 'sports', 'politics', 'entertainment'
        },
      );

      if (response.statusCode == 200) {
        final articles =
            (response.data['articles'] as List)
                .map(
                  (articleJson) =>
                      Article.fromJson(articleJson as Map<String, dynamic>),
                )
                .toList();
        return articles;
      } else {
        throw Exception('Failed to load news: ${response.statusMessage}');
      }
    } catch (e) {
      log('Error fetching news: $e');
      throw Exception('Failed to load news');
    }
  }
}
