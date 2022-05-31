
import 'package:ecommerce/views/const.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hàng mới về',
            style: TextStyle(
              color: buttonColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              ),
            ),
          Row(
            children: [
              Text(
                'Xem tất cả',
                style:
                TextStyle(
                    color: buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5,),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(10,),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
