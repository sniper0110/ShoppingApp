import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/FavoriteProductsScreen.dart';
import '../screens/ItemsInCartScreen.dart';
import '../screens/OrdersScreen.dart';

import '../widgets/ProductItem.dart';
import '../widgets/badge.dart';

import '../providers/ProductsProvider.dart';
import '../providers/CartProvider.dart';

class ProductsListScreen extends StatelessWidget {
  static String route_name = '/';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.products_list;
    //final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Time"),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(ItemsInCartScreen.route_name);
            },
            child: Consumer<CartProvider>(
              builder: (ctx, cart, child){
                return Badge(
                  child: Icon(Icons.shopping_cart),
                  value: cart.number_of_items_in_cart.toString(),
                  color: Colors.orange,
                );
              },
            )
          ),
          PopupMenuButton(
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text("Favorites"),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text("All"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Orders'),
                  value: 2,
                ),
              ];
            },
            onSelected: (value){
              if(value == 0){
                Navigator.of(context).pushNamed(FavoriteProductsScreen.route_name);
              }
              else if(value == 2){
                Navigator.of(context).pushNamed(OrdersScreen.route_name);
              }
            },
          ),
        ],
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
