
import 'package:ecommerce/views/const.dart';
import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  final tagList = [
    'Quần áo nữ',
    'Áo sơ mi',
    'Đầm váy'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagList.map((e) => Container(
        margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          child: Text(e, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
        ),),
      )).toList(
      ),
    );
  }
}
