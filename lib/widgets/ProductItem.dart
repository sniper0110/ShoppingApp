import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/ProductDetailsScreen.dart';
import '../providers/Product.dart';
import '../providers/CartProvider.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final image_url;
//
//  ProductItem({
//    this.id,
//    this.title,
//    this.image_url,
//  });

  void go_to_product_details_screen(BuildContext context, id) {
    Navigator.of(context).pushNamed(
      ProductDetailsScreen.route_name,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(
      context,
      listen: false,
    );

    var cart = Provider.of<CartProvider>(context);

    return Container(
      child: GridTile(
        child: ClipRRect(
          child: GestureDetector(
            onTap: () => go_to_product_details_screen(context, product.id),
            child: Image.network(
              product.image_url,
              fit: BoxFit.cover,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        footer: Container(
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<Product>(
                builder: (ctx, product, child) => IconButton(
                  icon: Icon(
                    product.is_favorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => product.toggle_favorite(),
                ),
              ),
              Container(
                width: 80,
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: (){
                  cart.add_item(product.id, product.title, product.price);
                },
              ),
            ],
          ),
        ),
      ),
      padding: EdgeInsets.all(7),
    );
  }
}
