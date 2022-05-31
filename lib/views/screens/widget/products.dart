import 'package:badges/badges.dart';
import 'package:ecommerce/models/clothes.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductProvider>(context);
    final products = Provider.of<Product>(context);
    List<Product> _productList = _productsProvider.products;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailPage.id, arguments: products.id);
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
                    height: 230,
                    width: 185,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(products.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 8,
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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              Text(
                '${display.format(products.price)} ₫',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17,
                  height: 1.0,
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
