import 'package:ecommerce/models/clothes.dart';
import 'package:ecommerce/provider/order_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/screens/widget/all_products.dart';
import 'package:ecommerce/views/screens/widget/category.dart';
import 'package:ecommerce/views/screens/widget/category_list.dart';
import 'package:ecommerce/views/screens/widget/customApp_bar.dart';
import 'package:ecommerce/views/screens/widget/products.dart';
import 'package:ecommerce/views/screens/widget/search_input.dart';
import 'package:ecommerce/views/screens/widget/tagList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatelessWidget {
  static const String routeName = 'homeScreens';

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductProvider>(context);
    _productsProvider.fetchProducts();
    final orderProvider = Provider.of<OrderProvider>(context);
    orderProvider.fetchOrders();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SearchInput(),
          TagList(),
          Categories(),
          CategoryList(),
          AllProducts(),
        ],
      ),
    ));
  }
}
