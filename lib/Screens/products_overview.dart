import 'package:flutter/material.dart';

import '../APIs/get_products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const routeName = '/Products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.separated(
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            radius: 50,
            backgroundColor:Colors.transparent,
            child: Image.network(
              ProductsProvider.products[index].image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            ProductsProvider.products[index].title,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            ProductsProvider.products[index].category,
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          ),
          trailing: Text(
            '\$${ProductsProvider.products[index].price}',
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
        ),
        itemCount: ProductsProvider.products.length,
        separatorBuilder: (_,__)=> const Divider(),
      ),
    );
  }
}
