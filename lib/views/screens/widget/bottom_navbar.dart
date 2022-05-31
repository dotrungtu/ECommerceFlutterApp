import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/views/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/product_provider.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = 'bottomNavBar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductProvider>(context);
    _productsProvider.fetchProducts();
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        activeColor: textButtonColor,
        inactiveColor: Colors.grey,
        backgroundColor: buttonColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              size: 30,
            ),
            label: 'Sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.upload,
              size: 30,
            ),
            label: 'Tải sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Tài khoản',
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
