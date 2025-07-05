import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/images_manager.dart';
import '../../../routes/app_routes.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/auth/auth_states.dart';
import '../../cubits/products/all_products/products_cubit.dart';
import '../../cubits/products/all_products/products_states.dart';
import '../../widgets/product_item_builder.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text('All Products'),
        actions: [
          SizedBox(
            width: 110.0,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 30.0),
                  onPressed: () {},
                ),
                BlocListener<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Lottie.asset(
                                AssetsManager.loadingAnimation,
                                repeat: true,
                                animate: true,
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is AuthLoggedOutState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesNames.login,
                        (route) => false,
                      );
                    }
                  },
                  child: IconButton(
                    icon: const Icon(Icons.logout, size: 30.0),
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading || state is ProductInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.78,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductItemBuilder(product: product);
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
