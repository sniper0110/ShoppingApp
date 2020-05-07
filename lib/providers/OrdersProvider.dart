import 'package:flutter/material.dart';
import 'CartProvider.dart';

class Order {
  final double total_price;
  Map<String, int> product_name_to_nbr_of_products;
  final DateTime date_of_order;

  Order({
    this.total_price,
    this.product_name_to_nbr_of_products,
    this.date_of_order,
  });
}

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void place_order(CartProvider cart) {
    var cart_items = cart.productId_to_cartItem.values.toList();

    Map<String, int> name_to_number = {};

    cart_items.forEach((item) {
        if (!name_to_number.containsKey(item.product_name)) {
            name_to_number.putIfAbsent(
            item.product_name,
            () => item.number_of_same_products,
          );
        }
      },
    );

    Order my_order = Order(
      total_price: cart.total_price,
      product_name_to_nbr_of_products: name_to_number,
      date_of_order: DateTime.now(),
    );

    _orders.add(my_order);
    cart.clear();

    notifyListeners();
  }
}
