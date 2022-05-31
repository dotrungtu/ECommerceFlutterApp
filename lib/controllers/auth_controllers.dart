import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/views/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //hàm thêm hình ảnh vào storage
  _upLoadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePictures')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //hàm cho phép người dùng đăng ảnh
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('Không có hình ảnh nào được chọn!');
    }
  }

  //hàm đăng ký người dùng
  Future<String> signUpUser(String full_name, String username, String phoneNumber, String addressUser, String email,
      String password, Uint8List? image) async {
    String res = 'Đã có lỗi xảy ra, vui lòng thử lại sau!';
    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          addressUser.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await _upLoadImageToStorage(image);

        firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userName': username,
          'phoneNumber': phoneNumber,
          'addressUser': addressUser,
          'email': email,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'success';
        print('Đăng ký thành công');
      } else {
        res = 'Thông tin không được để trống';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Hàm đăng nhập người dùng
  Future<String> loginUsers(String email, String password) async {
    String res = 'Đã có lỗi xảy ra, vui lòng thử lại sau';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('Đăng nhập thành công');
      } else {
        res = 'Trường thông tin không được để trống';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Hàm quên mật khẩu
  forgotPassword(String email) async {
    String res = 'Đã có lỗi xảy ra, vui lòng thử lại sau';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
        print('Hệ thống đã gửi liên kết khôi phục mật khẩu');
      } else {
        res = 'Email không hợp lệ, vui lòng kiểm tra lại';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
