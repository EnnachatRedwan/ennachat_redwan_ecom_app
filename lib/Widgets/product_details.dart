import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/product.dart';
import '../Style/style.dart';
import '../Providers/cart.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({Key? key, required this.prd, required this.index})
      : super(key: key);

  static const String routeName = '/productsDetails';

  final Product prd;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Style.primaryColor,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: index,
                  child: Image.network(
                    prd.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prd.title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        prd.category,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        '\$${prd.price}',
                        style:
                            const TextStyle(fontSize: 25, color: Colors.green),
                      ),
                      Text(prd.description),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Style.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
