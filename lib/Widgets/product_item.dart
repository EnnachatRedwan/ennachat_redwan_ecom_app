import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart.dart';
import '../Models/product.dart';
import './product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.prd, required this.index})
      : super(key: key);

  final Product prd;
  final int index;

  Future<void> pushDetails(BuildContext ctx, Cart cart) async {
    await Navigator.of(ctx)
        .push(
      MaterialPageRoute(
        builder: (_) => ProductsDetails(prd: prd, index: index),
      ),
    )
        .then((value) {
      if (value == true) {
        cart.addProduct(prd);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        pushDetails(context, cart);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: Hero(
            tag: index,
            child: Image.network(prd.image),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Text(
              '\$${prd.price}',
              style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addProduct(prd);
              },
            ),
            title: Text(
              prd.title,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
