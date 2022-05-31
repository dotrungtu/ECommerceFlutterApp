import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/screens/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';

class DoneDeal extends StatelessWidget {
  static const String routeName = 'DoneDeal';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 90),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/checkout.png',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Thanh toán thành công',
            style: TextStyle(
              color: buttonColor,
              fontSize: 22,
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
                  'TRỞ VỀ TRANG CHỦ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(BottomNavBar.routeName);
              },
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

