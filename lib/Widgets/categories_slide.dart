import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/products.dart';
import '../Widgets/category_item.dart';

class CategoriesSlide extends StatelessWidget {
  const CategoriesSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prd = Provider.of<Products>(context);
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: prd.categories.length,
        itemBuilder: (ctx, i) => CategoryItem(title: prd.categories[i]),
      ),
    );
  }
}
