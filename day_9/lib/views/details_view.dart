import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_1/models/cart_manager.dart';
import 'package:practice_1/models/order_manager.dart';
import 'package:practice_1/models/restaurant.dart';
import 'package:uuid/uuid.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
    required this.restaurant,
    required this.cartManager,
    required this.onTapAddToCart,
    required this.orderManager,
  });

  final Restaurant restaurant;
  final CartManager cartManager;
  final VoidCallback onTapAddToCart;
  final OrderManager orderManager;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final formKey = GlobalKey<FormState>();
  final contactNameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  bool isDeliverySelected = true;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void showDatePickerMethod() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null && mounted) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('dd/MM/yy').format(pickedDate);
      });
    }
  }

  void showTimePickerMethod() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && mounted) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = pickedTime.format(context);
      });
    }
  }

  void _submitOrder() {
    if (formKey.currentState!.validate() &&
        widget.cartManager.items.isNotEmpty) {
      final order = Order(
        selectedSegment: {
          isDeliverySelected ? DeliveryMode.delivery : DeliveryMode.pickup,
        },
        selectedTime: selectedTime,
        selectedDate: selectedDate,
        name: contactNameController.text,
        items: List.from(widget.cartManager.items),
      );

      widget.orderManager.addOrder(order);
      widget.cartManager.resetCart();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order submitted successfully!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    contactNameController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            backgroundColor: const Color(0xFFE8C3D0),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            label: Text('${widget.cartManager.items.length} items in cart'),
          );
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            actions: [
              Builder(
                builder:
                    (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + kToolbarHeight,
                  left: 16,
                  right: 16,
                  bottom: 24,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        width: double.infinity,
                        widget.restaurant.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: -20,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE8C3D0),
                        ),
                        child: const Icon(
                          Icons.store,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurant.name,
                    style:
                        textTheme.headlineLarge ??
                        const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.restaurant.address,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    widget.restaurant.getRatingAndDistance(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    widget.restaurant.attributes,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Menu',
                    style:
                        textTheme.headlineMedium ??
                        const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 80.0),
            sliver: SliverList.separated(
              itemCount: widget.restaurant.items.length,
              itemBuilder: (context, index) {
                return DetailsViewMenuItem(
                  item: widget.restaurant.items[index],
                  cartManager: widget.cartManager,
                  onTapAddToCart: () {
                    if (mounted) {
                      setState(() {});
                    }
                    widget.onTapAddToCart();
                  },
                );
              },
              separatorBuilder:
                  (context, index) => const SizedBox(height: 10.0),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.88,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      "Order Details",
                      style:
                          textTheme.headlineSmall ??
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () => setState(() => isDeliverySelected = true),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color:
                                  isDeliverySelected
                                      ? Colors.pink.shade100
                                      : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pedal_bike_rounded),
                                SizedBox(width: 10),
                                Text('Delivery'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () => setState(() => isDeliverySelected = false),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color:
                                  !isDeliverySelected
                                      ? Colors.pink.shade100
                                      : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_bag),
                                SizedBox(width: 10),
                                Text('PickUp'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: contactNameController,
                    decoration: const InputDecoration(
                      hintText: "Contact Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Contact Name Can't be Empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: TextFormField(
                          controller: dateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Select Date",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          onTap: showDatePickerMethod,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Empty Date";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 130,
                        child: TextFormField(
                          controller: timeController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Select Time",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.access_time),
                          ),
                          onTap: showTimePickerMethod,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Empty Time";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Order Summary",
                      style:
                          textTheme.headlineSmall?.copyWith(fontSize: 18.0) ??
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child:
                        widget.cartManager.items.isEmpty
                            ? const Center(child: Text("No items in cart"))
                            : ListView.builder(
                              itemCount: widget.cartManager.items.length,
                              itemBuilder: (context, index) {
                                final item = widget.cartManager.items[index];
                                return ListTile(
                                  title: Text(item.name),
                                  subtitle: Text('Quantity: ${item.quantity}'),
                                  trailing: Text(
                                    '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                                  ),
                                );
                              },
                            ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed:
                          widget.cartManager.items.isEmpty
                              ? null
                              : _submitOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8C3D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        disabledBackgroundColor: Colors.grey.shade300,
                      ),
                      child: Text(
                        'Submit Order - \$${widget.cartManager.totalCost.toStringAsFixed(2)}',
                        style: TextStyle(
                          color:
                              widget.cartManager.items.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsViewMenuItem extends StatelessWidget {
  const DetailsViewMenuItem({
    super.key,
    required this.item,
    required this.cartManager,
    required this.onTapAddToCart,
  });

  final Item item;
  final CartManager cartManager;
  final VoidCallback onTapAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return MenuBottomModelSheet(
              item: item,
              cartManager: cartManager,
              onAddToCart: onTapAddToCart,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.description,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.thumb_up, color: Colors.green, size: 18),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE7E6E2),
                    image: DecorationImage(
                      image: NetworkImage(item.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text('Add', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBottomModelSheet extends StatefulWidget {
  const MenuBottomModelSheet({
    super.key,
    required this.item,
    required this.cartManager,
    required this.onAddToCart,
  });

  final Item item;
  final CartManager cartManager;
  final VoidCallback onAddToCart;

  @override
  State<MenuBottomModelSheet> createState() => _MenuBottomModelSheetState();
}

class _MenuBottomModelSheetState extends State<MenuBottomModelSheet> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE8C3D0),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('#1 Most Liked'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.item.description,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    widget.item.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (_itemCount > 1) {
                          setState(() {
                            _itemCount--;
                          });
                        }
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.remove_circle,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Text(
                        _itemCount.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _itemCount++;
                        });
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.add_circle,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        final uuid = const Uuid().v4();
                        widget.cartManager.addItem(
                          CartItem(
                            id: uuid,
                            quantity: _itemCount,
                            name: widget.item.name,
                            price: widget.item.price,
                            imageUrl: widget.item.imageUrl,
                          ),
                        );
                        widget.onAddToCart();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8C3D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
