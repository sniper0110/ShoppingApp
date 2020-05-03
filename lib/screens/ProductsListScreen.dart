import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/ProductItem.dart';
import '../providers/ProductsProvider.dart';
import '../providers/Product.dart';

class ProductsListScreen extends StatelessWidget {
  static String route_name = '/';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.products_list;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Time"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
