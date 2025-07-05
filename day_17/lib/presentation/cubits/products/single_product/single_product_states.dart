import '../../../../data/models/product/product_model.dart';

abstract class SingleProductStates {}

class SingleProductInitial extends SingleProductStates {}

class SingleProductLoading extends SingleProductStates {}

class SingleProductLoaded extends SingleProductStates {
  final Product product;

  SingleProductLoaded(this.product);
}

class SingleProductError extends SingleProductStates {
  final String message;

  SingleProductError(this.message);
}
