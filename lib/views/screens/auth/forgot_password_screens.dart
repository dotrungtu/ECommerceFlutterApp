import 'package:ecommerce/controllers/auth_controllers.dart';
import 'package:ecommerce/views/const.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreens extends StatefulWidget {
  @override
  State<ForgotPasswordScreens> createState() => _ForgotPasswordScreensState();
}

class _ForgotPasswordScreensState extends State<ForgotPasswordScreens> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  forgotPassword() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().forgotPassword(_emailController.text
    );

    setState(() {
        _isLoading = false;
    });

    if (res == 'success') {
      return showSnackBar('Hệ thống đã gửi liên kết khôi phục', context);
    } else {
      return showSnackBar(res, context);  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Khôi phục mật khẩu',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Nhập vào Email của bạn',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
                child: GestureDetector(
                  onTap: forgotPassword,
                  child: _isLoading
                    ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white
                  ,)
                  ):Text(
                'Khôi phục',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )),
          )
        ],
      ),
    ));
  }
}
