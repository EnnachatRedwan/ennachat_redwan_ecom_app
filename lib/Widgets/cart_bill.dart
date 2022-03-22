import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';
import '../Style/style.dart';
import '../Providers/orders.dart';

class CartBill extends StatelessWidget {
  const CartBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var orders = Provider.of<Orders>(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Style.primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total : \$${cart.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              cart.items.length <= 1
                  ? Text(
                      '${cart.items.length} Item',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      '${cart.items.length} Items',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              if (cart.items.isNotEmpty) {
                orders.addOrder(cart);
                cart.clearCart();
              }
            },
            icon: const Icon(
              Icons.credit_card,
              color: Colors.white,
              size: 30,
            ),
            label: const Text(
              'Make order',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
