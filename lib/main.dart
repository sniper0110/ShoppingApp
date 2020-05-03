import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/ProductsListScreen.dart';
import './screens/ProductDetailsScreen.dart';
import './providers/ProductsProvider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'Shopping Time',
        theme: ThemeData(
          primaryColor: Color(0xff9764c7),
          accentColor: Color(0xdd15cda8),
        ),
        routes: {
          ProductsListScreen.route_name : (ctx) => ProductsListScreen(),
          ProductDetailsScreen.route_name : (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}

