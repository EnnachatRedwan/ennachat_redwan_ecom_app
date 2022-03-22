import './cart_item.dart';

class Order {
  final List<CartItem> items;
  final double totalPrice;
  final DateTime date;

  Order({required this.items, required this.totalPrice,required this.date});
}
