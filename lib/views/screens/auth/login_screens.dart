import 'package:ecommerce/controllers/auth_controllers.dart';
import 'package:ecommerce/views/const.dart';
import '../widget/bottom_navbar.dart';
import 'package:ecommerce/views/screens/auth/forgot_password_screens.dart';
import 'package:ecommerce/views/screens/auth/signup_screens.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatefulWidget {
  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  loginUsers() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController()
        .loginUsers(_emailController.text, _passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (contex) => BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
              'Fʅυƚƚҽɾ',
              style: TextStyle(
                color: buttonColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60,
            ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Nhập vào Email',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Nhập vào mật khẩu',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  loginUsers();
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text('Đăng nhập',
                        style: TextStyle(
                          color: textButtonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bạn chưa có tài khoản?',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreens()));
                },
                child: Text('Đăng ký',
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreens()));
            },
            child: Text(
              'Quên mật khẩu?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                ),
                ),
                ),
        ],
      ),
    ));
  }
}
