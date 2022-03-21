import 'package:flutter/cupertino.dart';

import '../APIs/get_products.dart';
import '../Models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  Products() {
    _products = ProductsProvider.products;
  }

  List<Product> get items {
    return [..._products];
  }

  List<String> get categories {
    Set<String> cats = {};
    cats.add('All');
    for (var v in _products) {
      cats.add(v.category);
    }
    return cats.toList();
  }

  String category = 'All';

  void setCategory(String category) {
    this.category = category;
    notifyListeners();
  }

  List<Product> itemsByCategory() {
    if (category == 'All') {
      return items;
    } else {
      return items.where((element) => element.category == category).toList();
    }
  }
}
