import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/style.dart';
import '../Widgets/categories_slide.dart';
import '../Providers/products.dart';
import './product_item.dart';

class ProductsOverview extends StatelessWidget {
  const ProductsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prd = Provider.of<Products>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Ennachat",
              style: TextStyle(
                  color: Style.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "Products",
            style: TextStyle(
              color: Style.textColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const CategoriesSlide()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) =>
                    ProductItem(prd: prd.itemsByCategory()[i], index: i),
                itemCount: prd.itemsByCategory().length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
