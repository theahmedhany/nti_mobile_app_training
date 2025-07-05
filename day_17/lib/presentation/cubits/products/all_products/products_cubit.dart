import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/products/products_repository.dart';
import 'products_states.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository _productsRepository;

  ProductCubit(this._productsRepository) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    try {
      final products = await _productsRepository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
