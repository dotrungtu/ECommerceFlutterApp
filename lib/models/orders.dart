import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Order with ChangeNotifier {
  final String orderId;
  final String userId;
  final String? productId;
  final String title;
  final String price;
  final String imageUrl;
  final String quantity;
  final Timestamp orderDate;

  Order({
    required this.orderId,
    required this.userId,
    required this.title,
    this.productId,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.orderDate,
  });
}
