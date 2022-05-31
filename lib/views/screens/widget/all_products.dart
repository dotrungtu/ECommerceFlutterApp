
import 'package:ecommerce/models/clothes.dart';
import 'package:ecommerce/views/screens/widget/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';
import '../../../provider/product_provider.dart';

class AllProducts extends StatelessWidget {
  final clothesList = Clothes.generateClothes();
  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductProvider>(context);

    List<Product> _productList = _productsProvider.products;
    return Container(
      child: Column(
        children: [
          Container(
            height: 290,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: _productList[index],
                  child: ProductItem(
                    index: index,)),
                separatorBuilder: (_, index) => SizedBox(width: 15,),
                itemCount: _productList.length,
            ),
          )
        ],
      ),
    );
  }
}