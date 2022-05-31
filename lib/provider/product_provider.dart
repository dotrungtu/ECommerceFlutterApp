import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/views/const.dart';
import 'package:flutter/cupertino.dart';

import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  Future<void> fetchProducts() async {
    await firebaseStore
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
       _products = [];
      productSnapshot.docs.forEach((element) {
        _products.insert(
            0,
            Product(
                id: element.get('id'),
                title: ('Fit Shirt'),
                description:  element.get('description'),
                price: 450000,
                imageUrl: element.get('imageUrl'),
                productCategoryname: element.get('productCategoryname'),
                quantity: 2)
        );
        _products.insert(
            1,
            Product(
                id: '1',
                title: element.get('title'),
                description:  element.get('description'),
                price: 490000,
                imageUrl: element.get('imageUrl'),
                productCategoryname: element.get('productCategoryname'),
                quantity: 2)
        );
        _products.insert(
            2,
            Product(
                id: '2',
                title: 'iPhones',
                description:  element.get('description'),
                price: 460000,
                imageUrl: element.get('imageUrl'),
                productCategoryname: element.get('productCategoryname'),
                quantity: 2)
        );
        _products.insert(
            3,
            Product(
                id: '3',
                title: 'Sneaker',
                description:  element.get('description'),
                price: 419000,
                imageUrl: element.get('imageUrl'),
                productCategoryname: element.get('productCategoryname'),
                quantity: 2)
        );
      });
    });
  }

  Product findById(String productId) {
    return _products.firstWhere(
      (element) => element.id == productId,
    );
  }

  List<Product> get products {
    return _products;
  }

  List<Product> findByCategory(String categoryName) {
    List _categoryList = _products
        .where((element) => element.productCategoryname
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();

    return [..._categoryList];
  }
}
