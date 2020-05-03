import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String image_url;
  bool is_favorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image_url,
    this.is_favorite = false,
  });

  void toggle_favorite(){
    is_favorite = !is_favorite;
    notifyListeners();
  }
}
