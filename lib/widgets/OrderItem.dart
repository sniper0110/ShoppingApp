import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'dart:math';

class OrderItem extends StatefulWidget {
  final Map<String, int> products_with_their_count;
  final double total_price_for_order;
  final DateTime date;

  OrderItem(
      {this.products_with_their_count, this.total_price_for_order, this.date});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool order_details_open = false;

  @override
  Widget build(BuildContext context) {
    double container_h;
    if(!order_details_open)
      container_h = 70;
    else
      container_h = 150;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: container_h,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'total amount : ${widget.total_price_for_order}',
                          style: GoogleFonts.rubik(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          DateFormat.yMd().format(widget.date),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: order_details_open ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        order_details_open = !order_details_open;
                      });
                    },
                  )
                ],
              ),
            ),
            if(order_details_open)
              Divider(),
            if(order_details_open)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${widget.products_with_their_count.keys.toList()[i]}'),
                          Text(
                              'x${widget.products_with_their_count.values.toList()[i]}'),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.products_with_their_count.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
