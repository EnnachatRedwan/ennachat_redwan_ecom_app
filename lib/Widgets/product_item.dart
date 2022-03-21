import 'package:flutter/material.dart';
import '../Models/product.dart';
import '../Style/style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.prd}) : super(key: key);

  final Product prd;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: Image.network(prd.image),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Text(
            '\$${prd.price}',
            style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          title: Text(
            prd.title,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
