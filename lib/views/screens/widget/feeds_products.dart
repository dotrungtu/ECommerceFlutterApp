import 'package:badges/badges.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsProducts extends StatefulWidget {
  @override
  State<FeedsProducts> createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductProvider>(context);
    final products = Provider.of<Product>(context);
    List<Product> _productList = _productsProvider.products;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(DetailPage.id, arguments: products.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(products.imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 15,
                      child: Badge(
                        toAnimate: true,
                        shape: BadgeShape.square,
                        badgeColor: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                        badgeContent:
                            Text('MỚI', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Text(
                  products.title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                Text(
                  '${display.format(products.price)} ₫',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
