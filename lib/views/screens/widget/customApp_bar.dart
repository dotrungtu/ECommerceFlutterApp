import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/screens/widget/cart_screens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 35,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Mua sắm trực tuyến tại ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: 'Fʅυƚƚҽɾ\n',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: 'Uy tín, giá rẻ, giao hàng nhanh ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    )),
                TextSpan(
                    text: '🤩',
                    style: TextStyle(
                      fontSize: 24,
                    )),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartSreens.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
