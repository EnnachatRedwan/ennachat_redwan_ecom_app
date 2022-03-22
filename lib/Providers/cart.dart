import 'package:ennachat_redwan_ecom_app/Models/product.dart';
import 'package:flutter/cupertino.dart';

import '../Models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalPrice {
    double total = 0;
    _items.forEach(
      (key, value) {
        total += value.totalPrice;
      },
    );
    return total;
  }

  List<CartItem> get cartItems {
    return _items.values.toList();
  }

  void deleteItem(Product prd) {
    _items.remove(prd.id);
    notifyListeners();
  }

  void addProduct(Product prd) {
    _items.putIfAbsent(prd.id, () => CartItem(prd: prd));
    _items[prd.id]!.quantity++;
    notifyListeners();
  }
}
