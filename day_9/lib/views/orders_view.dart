import 'package:flutter/material.dart';
import 'package:practice_1/models/order_manager.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key, required this.orderManager});

  final OrderManager orderManager;

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Orders",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          if (widget.orderManager.orders.isEmpty)
            Center(child: Text("No orders yet", style: textTheme.bodyLarge))
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.orderManager.orders.length,
                itemBuilder: (context, index) {
                  final order = widget.orderManager.orders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.getFormattedOrderInfo(),
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          ...order.items.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xFFE7E6E2),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item.imageUrl ??
                                              'https://via.placeholder.com/50',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: textTheme.bodyMedium,
                                        ),
                                        Text(
                                          "Quantity: ${item.quantity}",
                                          style: textTheme.bodySmall?.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
