import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_manager.dart';

class Order {
  final Set<DeliveryMode> selectedSegment;
  final TimeOfDay? selectedTime;
  final DateTime? selectedDate;
  final String name;
  final List<CartItem> items;

  Order({
    required this.selectedSegment,
    required this.selectedTime,
    required this.selectedDate,
    required this.name,
    required this.items,
  });

  String getFormattedSegment() {
    return selectedSegment.first.formattedText;
  }

  String getFormattedTime() {
    if (selectedTime == null) {
      return 'Unknown';
    }
    final hour = selectedTime!.hour.toString().padLeft(2, '0');
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String getFormattedDate() {
    if (selectedDate == null) {
      return 'Unknown';
    }
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(selectedDate!);
  }

  String getFormattedName() {
    if (name.isEmpty) {
      return 'Unknown';
    }
    return name;
  }

  String getFormattedOrderInfo() {
    final segmentString = getFormattedSegment();
    final name = getFormattedName();
    final timeString = getFormattedTime();
    final dateString = getFormattedDate();

    return '$name, Date: $dateString, Time: $timeString, $segmentString';
  }
}

class OrderManager extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(Order order) {
    _orders.remove(order);
    notifyListeners();
  }

  int get totalOrders => _orders.length;
}
