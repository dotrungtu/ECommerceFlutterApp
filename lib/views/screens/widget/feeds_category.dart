import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/screens/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';

class FeedsCategoryScreen extends StatelessWidget {
  static const String routeName = 'feedsCategoryScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    final productList = productsProvider.findByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Quản lý sản phẩm',
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
