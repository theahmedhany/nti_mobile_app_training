void main() {
  // Hello.

  var apple = Product(name: "Apple", price: 1.5);
  var bread = Product(name: "Bread", price: 2.0);

  var item1 = CartItem(product: apple, quantity: 4);
  var item2 = CartItem(product: bread, quantity: 2);

  var cart = ShoppingCart();
  cart.addItem(item1);
  cart.addItem(item2);

  cart.showCartDetails();
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;
}

class ShoppingCart {
  final List<CartItem> items = [];

  void addItem(CartItem item) {
    items.add(item);
  }

  double getTotalPrice() {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void showCartDetails() {
    for (var item in items) {
      print(
        '${item.quantity} x ${item.product.name} ( \$${item.product.price} ) = \$${item.totalPrice}',
      );
    }
    print('Total: \$${getTotalPrice()}');
  }
}
