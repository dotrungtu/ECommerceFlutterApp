
import 'package:ecommerce/views/const.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Flexible(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Tìm kiếm trên Flutter",
                hintStyle: TextStyle(
                  color: textColor,
                ),
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/icons/search.png',
                    width: 15,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15,)
            ),
            child: Image.asset('assets/icons/filter.png',
              width: 35,
            ),
          )
      ]),
    );
  }
}