import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ProductsProvider.dart';
import '../widgets/ProductItem.dart';

class FavoriteProductsScreen extends StatelessWidget {
  static final route_name = 'favorite-products-screen';

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<ProductsProvider>(context);
    var products_list = productsData.products_list;
    var favorite_products = productsData.favorite_products_list;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            return ChangeNotifierProvider.value(
              value: favorite_products[index],
              child: ProductItem(),
            );
          },
          itemCount: favorite_products.length,
        ),
      ),
    );
  }
}
