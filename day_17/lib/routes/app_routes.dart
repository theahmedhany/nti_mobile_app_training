import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/products/products_repository.dart';
import '../presentation/cubits/products/all_products/products_cubit.dart';
import '../presentation/cubits/products/single_product/single_product_cubit.dart';
import '../presentation/views/auth/auth_view.dart';
import '../presentation/views/products/product_details.dart';
import '../presentation/views/products/products_view.dart';
import '../presentation/views/start/start_view.dart';

class AppRoutesNames {
  static const String home = '/';
  static const String login = '/login';
  static const String products = '/products';
  static const String productDetails = '/product-details';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.home:
        return MaterialPageRoute(
          builder: (_) => const StartView(), //
        );
      case AppRoutesNames.login:
        return MaterialPageRoute(
          builder: (_) => const AuthView(), // Placeholder for login view
        );
      case AppRoutesNames.products:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<ProductCubit>(
              create: (context) => ProductCubit(
                context.read<ProductsRepository>(), //
              )..fetchProducts(),
              child: const ProductsView(),
            );
          }, //
        );
      case AppRoutesNames.productDetails:
        return MaterialPageRoute(
          builder: (context) {
            int? productId = settings.arguments as int?;
            return BlocProvider<SingleProductCubit>(
              create: (context) => SingleProductCubit(
                context.read<ProductsRepository>(), //
              )..fetchSingleProduct(productId!),
              child: const ProductDetails(), //
            );
          }, //
        );
      default:
        return null;
    }
  }
}
