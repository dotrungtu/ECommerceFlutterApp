import 'dart:typed_data';

import 'package:ecommerce/controllers/auth_controllers.dart';
import 'package:ecommerce/views/const.dart';
import 'login_screens.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreens extends StatefulWidget {
  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _addressUserController = TextEditingController();

  //Biến toàn cục lưu trữ ảnh được xem
  Uint8List? _image;
  bool _isLoading = false;

  selectImage() async {
    Uint8List im = await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  signupUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthController().signUpUser(
        _fullNameController.text,
        _userNameController.text,
        _phoneNumberController.text,
        _addressUserController.text,
        _emailController.text,
        _passwordController.text,
        _image);

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar('Đăng ký thành công', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundColor: buttonColor,
                        backgroundImage: MemoryImage(_image!))
                    : CircleAvatar(
                        radius: 64,
                        backgroundColor: buttonColor,
                        backgroundImage: NetworkImage(
                            'https://www.seekpng.com/png/detail/245-2454602_tanni-chand-default-user-image-png.png'),
                      ),
                Positioned(
                  right: 5,
                  bottom: 10,
                  child: InkWell(
                    onTap: selectImage,
                    child: Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Tên',
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
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Tên đăng nhập',
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
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Số điện thoại',
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
            TextField(
              controller: _addressUserController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Địa chỉ',
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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Email',
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
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Mật khẩu',
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
                    signupUser();
                    _passwordController.clear();
                  },
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: textButtonColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
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
                  'Bạn đã có tài khoản?',
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreens()));
                  },
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
