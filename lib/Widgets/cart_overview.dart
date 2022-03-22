import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';
import './cart_item.dart';
import './cart_bill.dart';

class CartOverview extends StatelessWidget {
  const CartOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Column(
      children: [
        const CartBill(),
        Expanded(
          child: ListView.separated(
            itemCount: cart.items.length,
            itemBuilder: (ctx, index) => CartItem(
              item: cart.cartItems[index],
            ),
            separatorBuilder: (_, i) => const Divider(),
          ),
        ),
      ],
    );
  }
}
