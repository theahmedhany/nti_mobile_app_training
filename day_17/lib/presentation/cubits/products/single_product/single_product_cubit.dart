import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/products/products_repository.dart';
import 'single_product_states.dart';

class SingleProductCubit extends Cubit<SingleProductStates> {
  final ProductsRepository _productsRepository;
  SingleProductCubit(this._productsRepository) : super(SingleProductInitial());

  Future<void> fetchSingleProduct(int productId) async {
    emit(SingleProductLoading());

    try {
      final product = await _productsRepository.getProductById(productId);
      emit(SingleProductLoaded(product));
    } catch (e) {
      emit(SingleProductError(e.toString()));
    }
  }
}
