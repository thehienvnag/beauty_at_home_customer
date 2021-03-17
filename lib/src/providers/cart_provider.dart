import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';

class CartProvider extends ChangeNotifier {
  CartModel _cart;
  CartModel get cart => _cart;
  bool _isBookingProgressing;
  bool get isBookingProgressing => _isBookingProgressing;

  void setCurrentCart(CartModel cart) {
    _cart = cart;
    notifyListeners();
  }

  void setEnableProgressing() {
    _isBookingProgressing = true;
  }

  double totalPrice() {
    double total = 0;
    _cart.services.forEach((key, value) {
      total = double.parse(key.price) * value.toDouble();
    });
    return total;
  }
}
