import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/ProductsListScreen.dart';
import './screens/ProductDetailsScreen.dart';
import './screens/FavoriteProductsScreen.dart';
import './screens/ItemsInCartScreen.dart';
import './screens/OrdersScreen.dart';
import './providers/ProductsProvider.dart';
import './providers/CartProvider.dart';
import './providers/OrdersProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping Time',
        theme: ThemeData(
          primaryColor: Color(0xff9764c7),
          accentColor: Color(0xdd15cda8),
        ),
        routes: {
          ProductsListScreen.route_name: (ctx) => ProductsListScreen(),
          ProductDetailsScreen.route_name: (ctx) => ProductDetailsScreen(),
          FavoriteProductsScreen.route_name: (ctx) => FavoriteProductsScreen(),
          ItemsInCartScreen.route_name: (ctx) => ItemsInCartScreen(),
          OrdersScreen.route_name: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
