import 'package:flutter/material.dart';
import '../Style/style.dart';
import 'package:provider/provider.dart';
import '../Providers/products.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var prd = Provider.of<Products>(context);
    return GestureDetector(
      onTap: () {
        prd.setCategory(title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Style.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
