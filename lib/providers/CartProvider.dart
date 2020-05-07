import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String product_id;
  final String product_name;
  final double price;
  final int number_of_same_products;

  CartItem({
    this.id,
    this.product_id,
    this.product_name,
    this.price,
    this.number_of_same_products,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _productId_to_cartItem = {};

  Map<String, CartItem> get productId_to_cartItem {
    return {..._productId_to_cartItem};
  }

  void add_item(String product_id, String product_name, double price) {
    if (_productId_to_cartItem.containsKey(product_id)) {
      _productId_to_cartItem.update(
        product_id,
        (item) => CartItem(
          id: DateTime.now().toString(),
          product_id: product_id,
          product_name: item.product_name,
          price: item.price + price,
          number_of_same_products: item.number_of_same_products + 1,
        ),
      );
    } else {
      _productId_to_cartItem.putIfAbsent(
        product_id,
        () => CartItem(
          id: DateTime.now().toString(),
          product_id: product_id,
          product_name: product_name,
          price: price,
          number_of_same_products: 1,
        ),
      );
    }

    notifyListeners();
  }

  int get number_of_items_in_cart{
    int total = 0;
    _productId_to_cartItem.values.forEach((item) => total += item.number_of_same_products);
    return total;
  }

  void delete_cart_item(cart_item_id){

    if(_productId_to_cartItem.containsKey(cart_item_id)){
      _productId_to_cartItem.remove(cart_item_id);
      notifyListeners();
    }
  }

  double get total_price{
    double total = 0.0;
    _productId_to_cartItem.values.forEach((item) => total += item.price * item.number_of_same_products);
    return total;
  }

  void clear(){
    _productId_to_cartItem = {};
  }
}
