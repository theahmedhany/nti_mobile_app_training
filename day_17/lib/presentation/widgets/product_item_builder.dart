import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../data/models/product/product_model.dart';

class ProductItemBuilder extends StatelessWidget {
  final Product product;
  const ProductItemBuilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesNames.productDetails, //
          arguments: product.id, //
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, //
          border: Border.all(color: Color(0xFFEBF0FF)), //
          borderRadius: BorderRadius.circular(5.0), //
        ), //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), //
              ),
              child: Center(
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover, // Adjust fit as needed
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                product.title ?? '',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Change color to green for price
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
