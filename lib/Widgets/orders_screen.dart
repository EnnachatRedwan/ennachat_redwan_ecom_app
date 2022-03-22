import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/orders.dart';

import './order_item.dart';

class OrdersSceen extends StatelessWidget {
  const OrdersSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<Orders>(context);
    return ListView.separated(
      itemBuilder: (ctx, index) => OrderItem(
        order: orders.orders[index],
      ),
      itemCount: orders.orders.length,
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
