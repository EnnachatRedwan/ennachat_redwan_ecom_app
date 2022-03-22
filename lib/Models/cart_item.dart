import './product.dart';

class CartItem {
  final Product prd;
  int quantity = 0;

  CartItem({required this.prd});

  double get totalPrice {
    return prd.price * quantity;
  }

  @override
  String toString() {
    return prd.toString() + '\n\n' + quantity.toString();
  }
}
