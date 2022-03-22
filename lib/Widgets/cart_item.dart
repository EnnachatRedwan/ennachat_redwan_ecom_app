import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';
import '../Models/cart_item.dart' as cart;
import '../Style/style.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.item}) : super(key: key);

  final cart.CartItem item;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Dismissible(
      background: Container(
        color: Style.primaryColor,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(item),
      onDismissed: (direction) {
        cart.deleteItem(item.prd);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Style.backgroundColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(item.prd.image)),
          ),
        ),
        title: Text(
          item.prd.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: item.quantity == 1
            ? Text(
                '${item.quantity} item',
              )
            : Text(
                '${item.quantity} items',
              ),
        trailing: Text(
          '\$${item.totalPrice}',
          style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
