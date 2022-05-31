import 'package:ecommerce/views/const.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/emptycart.png',
                ),
              ),
            ),
          ),
          Text(
            'Bạn chưa đặt món nào cả',
            style: TextStyle(
              color: buttonColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 160,
            child: ElevatedButton(
              child: Center(
                child: Text(
                  'ĐẶT NGAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.redAccent[200]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
