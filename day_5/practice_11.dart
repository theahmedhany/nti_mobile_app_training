void main() {
  // Hello.

  Map<String, dynamic> orderData = {
    'id': '123',
    'customer': 'John Doe',
    'item': 99.99,
  };

  Order order = Order.fromMap(orderData);
  order.printInvoice();
}

abstract class Printable {
  void printInvoice();
}

class Order implements Printable {
  String id;
  String customer;
  double item;

  Order(this.id, this.customer, this.item);

  Order.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      customer = map['customer'],
      item = map['item'];

  @override
  void printInvoice() {
    print('Printing invoice...');
    print('Order ID: $id');
    print('Customer: $customer');
    print('Item: $item');
  }
}
