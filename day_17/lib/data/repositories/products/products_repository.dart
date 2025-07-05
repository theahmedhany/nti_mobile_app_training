import '../../../configs/services/dio/dio_service.dart';
import '../../../core/api/api.dart';
import '../../models/product/product_model.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
}

class ProductsRepositoryImpl implements ProductsRepository {
  final DioService _dioService;
  const ProductsRepositoryImpl(this._dioService);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dioService.get(url: '/${Api.products}');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((product) => Product.fromJson(product))
            .toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final response = await _dioService.get(url: '/${Api.products}/$id');

      if (response.statusCode == 200) {
        return (Product.fromJson(response.data));
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}
