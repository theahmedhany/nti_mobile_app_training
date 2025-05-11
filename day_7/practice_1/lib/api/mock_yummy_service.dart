import 'package:practice_1/models/food_category.dart';
import 'package:practice_1/models/post.dart';
import 'package:practice_1/models/restaurant.dart';

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockYummyService {
  Future<ExploreData> getExploreData() async {
    final restaurants = await _getRestaurants();
    final categories = await _getCategories();
    final friendPosts = await _getFriendFeed();

    return ExploreData(restaurants, categories, friendPosts);
  }

  Future<List<FoodCategory>> _getCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return categories;
  }

  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return posts;
  }

  Future<List<Restaurant>> _getRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return restaurants;
  }
}
