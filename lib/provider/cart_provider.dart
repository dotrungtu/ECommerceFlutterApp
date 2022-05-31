import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/views/screens/widget/products.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  Map<String, Cart> get getCartItem {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;

    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (extingCartItem) => Cart(
                id: extingCartItem.id,
                title: extingCartItem.title,
                price: extingCartItem.price,
                quantity: extingCartItem.quantity + 1,
                imageUrl: extingCartItem.imageUrl,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }
  void reductCartItem(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
              (extingCartItem) => Cart(
            id: extingCartItem.id,
            title: extingCartItem.title,
            price: extingCartItem.price,
            quantity: extingCartItem.quantity - 1,
            imageUrl: extingCartItem.imageUrl,
          ));
    } else {
      _cartItems.putIfAbsent(
          productId,
              () => Cart(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1,
            imageUrl: imageUrl,
          ));
    }
    notifyListeners();
  }
  void removeCartItem(productID){
    _cartItems.remove(productID);
    notifyListeners();
  }
  void clearCartData() {
    _cartItems.clear();
    notifyListeners();
  }
}
