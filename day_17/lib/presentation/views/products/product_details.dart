import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/products/single_product/single_product_cubit.dart';
import '../../cubits/products/single_product/single_product_states.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleProductCubit, SingleProductStates>(
      builder: (context, state) {
        switch (state) {
          case SingleProductInitial():
          case SingleProductLoading():
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case SingleProductLoaded():
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  state.product.title ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  Stack(
                    children: [
                      Image(
                        image: NetworkImage(state.product.image ?? ''),
                        height: 300.0,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    state.product.title ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    state.product.description ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          case SingleProductError():
            return Scaffold(
              body: Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          default:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
