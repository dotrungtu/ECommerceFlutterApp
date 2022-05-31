import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/detail/detail_page.dart';
import 'package:ecommerce/views/screens/widget/cart_empty.dart';
import 'package:ecommerce/views/screens/widget/cart_item.dart';
import 'package:ecommerce/views/screens/widget/done_deal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartSreens extends StatelessWidget {
  static const String routeName = 'cartScreens';

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    final _cartProvider = Provider.of<CartProvider>(context);
    return _cartProvider.getCartItem.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: buttonColor,
              title: Text(
                'GIỎ HÀNG (${_cartProvider.getCartItem.length})',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _cartProvider.clearCartData();
                  },
                  icon: Icon(
                    CupertinoIcons.trash,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: _cartProvider.getCartItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                    value: _cartProvider.getCartItem.values.toList()[index],
                    child: CartItem(
                      productId: _cartProvider.getCartItem.keys.toList()[index],
                    ),
                  );
                }),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      primary: buttonColor,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushNamed(DoneDeal.routeName);
                      _cartProvider.getCartItem
                          .forEach((key, orderValue) async {
                        final orderId = uuid.v4();
                        await firebaseStore
                            .collection('orders')
                            .doc(orderId)
                            .set({
                          'orderId': orderId,
                          'userId': firebaseAuth.currentUser!.uid,
                          'title': orderValue.title,
                          'price': orderValue.price,
                          'imageUrl': orderValue.imageUrl,
                          'quantity': orderValue.quantity,
                          'orderData': Timestamp.now(),
                        });
                      });
                    },
                    child: Text(
                      'Thanh toán',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Tổng tiền:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${display.format(_cartProvider.totalAmount)} ₫',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: buttonColor,
                  ),
                ),
              ]),
            ),
          )
        : Scaffold(
            body: CartEmpty(),
          );
  }
}
