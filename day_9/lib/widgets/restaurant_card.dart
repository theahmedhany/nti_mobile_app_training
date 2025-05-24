import 'package:flutter/material.dart';
import 'package:practice_1/models/cart_manager.dart';
import 'package:practice_1/models/order_manager.dart';
import 'package:practice_1/models/restaurant.dart';
import 'package:practice_1/views/details_view.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({
    super.key,
    required this.restaurantItems,
    required this.orderManager,
  });

  final List<Restaurant> restaurantItems;
  final OrderManager orderManager;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: restaurants.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DetailsView(
                        restaurant: widget.restaurantItems[index],
                        cartManager: CartManager(),
                        onTapAddToCart: () {
                          setState(() {});
                        },
                        orderManager: widget.orderManager,
                      ),
                ),
              ).then((_) {
                setState(() {});
              });
            },
            child: SizedBox(
              width: 140,
              child: Card(
                color: const Color(0xFFE7E6E2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image(
                        image: AssetImage(
                          widget.restaurantItems[index].imageUrl,
                        ),
                        height: 80,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurantItems[index].name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.restaurantItems[index].attributes,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
