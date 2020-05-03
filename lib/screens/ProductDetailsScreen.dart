import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ProductsProvider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String route_name = 'product-details-screen';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    var product = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).find_product_by_id(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
