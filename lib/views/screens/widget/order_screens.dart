import 'package:ecommerce/provider/order_provider.dart';
import 'package:ecommerce/views/screens/widget/order_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreens extends StatelessWidget {
  static const String routeName = 'orderScreen';
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: orderProvider.getOrders.length,
          itemBuilder: (BuildContext context, int index) {
            return ChangeNotifierProvider.value(
              value: orderProvider.getOrders[index],
              child: OrderItems());
          }),
    );
  }
}
