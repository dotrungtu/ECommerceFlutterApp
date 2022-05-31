
import 'package:ecommerce/views/screens/widget/feeds_category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int index;

  CategoryItem({Key? key, required this.index}) : super(key: key);

  List<Map<String, String>> categories = [
    {
      'categoryName':'Điện thoại',
      'categoryImage':'assets/images/CatPhones.jpg'
    },
    {
      'categoryName':'Máy tính',
      'categoryImage':'assets/images/CatLaptops.jpg'
    },
    {
      'categoryName':'Thời trang',
      'categoryImage':'assets/images/CatClothes.jpeg'
    },
    {
      'categoryName':'Đồng hồ',
      'categoryImage':'assets/images/CatWatches.jpg'
    },
    {
      'categoryName':'Giày Sneaker',
      'categoryImage':'assets/images/CatShoes.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, FeedsCategoryScreen.routeName, arguments: '${categories[index]['categoryName']}');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                  image: AssetImage(
                    '${categories[index]['categoryImage']}',
              ))
            ),
          ),
        ),
        Positioned(
            left: 50,
            top: 155,
              child: Container(
                child: Text('${categories[index]['categoryName']}',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,),
          ),
        ))
      ],
    );
  }
}
