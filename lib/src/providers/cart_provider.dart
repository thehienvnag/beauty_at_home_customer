import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';

class CartProvider extends ChangeNotifier {
  CartModel _cart = CartModel();
  CartModel get cart => _cart;
  bool _isBookingProgressing = false;
  int _progressIndex = 0;
  int get progressIndex => _progressIndex;
  bool get isBookingProgressing => _isBookingProgressing;

  void setProgressIndex(int index) {
    _progressIndex = index;
    log(_progressIndex.toString());
    notifyListeners();
  }

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
      total = key.price * value.toDouble();
    });
    return total;
  }

  void pushCart(String providerName, String providerImage,
      String customerAccountId, String beautyArtistAccountId) {
    _cart.providerName = providerImage;
    _cart.providerImage = providerImage;
    _cart.customerAccountId = customerAccountId;
    _cart.beautyArtistAccountId = beautyArtistAccountId;
    notifyListeners();
  }
}
