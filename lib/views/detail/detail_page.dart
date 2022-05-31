import 'dart:ui';

import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/screens/widget/cart_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';
import '../../provider/cart_provider.dart';

class DetailPage extends StatelessWidget {
  static const String id = 'detailPage';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final productAttr = productData.findById(productID);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 490,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${productAttr.imageUrl}'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
              Positioned(
                  left: 15,
                  top: 40,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: buttonColor,
                      ),
                    ),
                  ),
              ),
              Positioned(
                right: 15,
                top: 38,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(CartSreens.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: buttonColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${productAttr.title}',
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Text(
              '${display.format(productAttr.price)} ₫',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 0.8,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('${productAttr.description}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          height: 1.7,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 170,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Colors.blueAccent[200],
                          ),
                          onPressed: () {
                            _cartProvider.addProductToCart(
                                productID,
                                productAttr.price,
                                productAttr.title,
                                productAttr.imageUrl);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'THÊM VÀO GIỎ HÀNG',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 230,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: buttonColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MUA NGAY',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
