import 'package:flutter/cupertino.dart';

import '../Models/order.dart';
import './cart.dart';

class Orders with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders.reversed];
  }

  void addOrder(Cart cart) {
    _orders.add(Order(
        items: cart.cartItems,
        totalPrice: cart.totalPrice,
        date: DateTime.now()));
    notifyListeners();
  }

  void deleteItem(Order order) {
    _orders.remove(order);
    notifyListeners();
  }
}
