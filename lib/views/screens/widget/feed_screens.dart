import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/screens/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';

class FeedSreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    List<Product> productList = productsProvider.products;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Gian hàng',
          style: TextStyle(
            color: Colors.deepPurpleAccent[400],
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 170 / 235,
        children: List.generate(
          productList.length,
          (index) => ChangeNotifierProvider.value(
            value: productList[index],
            child: FeedsProducts(),
          ),
        ),
      ),
    );
  }
}
