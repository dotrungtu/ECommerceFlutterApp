import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/views/const.dart';
import 'package:flutter/cupertino.dart';


class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  List<Order> get getOrders {
    return _orders;
  }

  Future<void> fetchOrders() async {
    await firebaseStore
        .collection('orders').where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot orderSnapshot) {
      _orders = [];
      orderSnapshot.docs.forEach((element) {
        _orders.insert(
            0,
            Order(
                orderId: element.get('orderId'),
                userId: element.get('userId'),
                title: element.get('titleId'),
                price: element.get('priceId').toString(),
                imageUrl: element.get('imageUrl'),
                quantity: element.get('quantity'),
                orderDate: element.get('orderDate'),
            ));
      });
      notifyListeners();
    });
  }

}
