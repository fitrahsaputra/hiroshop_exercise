import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, Cart> _cartItem = {};
  Map<int, Cart> get cartItem => _cartItem;

  int get length => _cartItem.length;

  int get calculateTotalPurchase {
    int purchase = 0;
    _cartItem.forEach((key, value) {
      purchase += value.qty * value.price;
    });

    return purchase;
  }

  void addToCart(int productId, String name, int price) {
    if (_cartItem.containsKey(productId)) {
      _cartItem.update(
          productId,
          (value) => Cart(
              id: value.id,
              name: value.name,
              price: value.price,
              qty: value.qty + 1));
    } else {
      _cartItem.putIfAbsent(productId,
          () => Cart(id: productId, name: name, price: price, qty: 1));
    }
    notifyListeners();
  }

  void deleteItemCart(int cartId) {
    _cartItem.removeWhere((key, value) => value.id == cartId);
    notifyListeners();
  }

  void addQty(Cart cart) {
    cart.qty++;
    notifyListeners();
  }

  void removeQty(Cart cart) {
    if (cart.qty > 1) {
      cart.qty--;
    }
    notifyListeners();
  }
}
