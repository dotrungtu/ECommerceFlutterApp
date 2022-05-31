import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/detail/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;

  const CartItem({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<Cart>(context);
    final _cartProvider = Provider.of<CartProvider>(context);

    double subtotal = _cart.price * _cart.quantity;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.id, arguments: productId);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.grey[100],
        ),
        child: Row(children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${_cart.imageUrl}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_cart.title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartProvider.removeCartItem(productId);
                        },
                        icon: Icon(
                          CupertinoIcons.delete_left,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Đơn giá:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${display.format(_cart.price)} ₫',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Tổng tiền:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${display.format(subtotal)} ₫',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Free Ship',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _cartProvider.reductCartItem(productId, _cart.price,
                            _cart.title, _cart.imageUrl);
                      },
                      icon: Icon(
                        CupertinoIcons.minus_rectangle,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                        ),
                        child: Center(
                          child: Text(
                            '${_cart.quantity}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _cartProvider.addProductToCart(productId, _cart.price,
                            _cart.title, _cart.imageUrl);
                      },
                      icon: Icon(
                        CupertinoIcons.add,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
