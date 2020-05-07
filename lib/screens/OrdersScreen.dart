import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/OrderItem.dart';
import '../providers/CartProvider.dart';
import '../providers/OrdersProvider.dart';

class OrdersScreen extends StatelessWidget {
  static String route_name = 'orders-screen';

  @override
  Widget build(BuildContext context) {
    var orders_data = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Consumer<CartProvider>(
                  builder: (_, cart, _n) {
                    return OrderItem(
                      products_with_their_count:
                          orders_data.orders[i].product_name_to_nbr_of_products,
                      total_price_for_order: orders_data.orders[i].total_price,
                      date: orders_data.orders[i].date_of_order,
                    );
                  },
                ),
              ],
            ),
          );
        },
        itemCount: orders_data.orders.length,
      ),
    );
  }
}
