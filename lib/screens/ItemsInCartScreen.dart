import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CartProvider.dart';
import '../providers/OrdersProvider.dart';

import '../screens/OrdersScreen.dart';

class ItemsInCartScreen extends StatefulWidget {
  static final route_name = 'items-in-cart-screen';

  @override
  _ItemsInCartScreenState createState() => _ItemsInCartScreenState();
}

class _ItemsInCartScreenState extends State<ItemsInCartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    var cart_items = cart.productId_to_cartItem.values.toList();
    var orders_data = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your shopping cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total amount : \$${cart.total_price}'),
                FlatButton(
                  onPressed: (){
                    orders_data.place_order(cart);
                  },
                  child: Text(
                    "place order",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Dismissible(
                  key: ValueKey(cart_items[index].id),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('\$${cart_items[index].price}'),
                          ),
                        ),
                      ),
                      title: Text('${cart_items[index].product_name}'),
                      trailing:
                          Text('x${cart_items[index].number_of_same_products}'),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) =>
                      cart.delete_cart_item(cart_items[index].product_id),
                  background: Container(
                    color: Colors.redAccent,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Icon(Icons.delete),
                    alignment: Alignment.centerRight,
                  ),

                );
              },
              itemCount: cart_items.length,
            ),
          ),
        ],
      ),
    );
  }
}
