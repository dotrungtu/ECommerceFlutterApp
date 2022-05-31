import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'screens/widget/cart_screens.dart';
import 'screens/widget/feed_screens.dart';
import 'screens/widget/home_screens.dart';
import 'screens/widget/profile_screens.dart';
import 'screens/widget/search_screens.dart';
import 'screens/widget/upload_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

//page

List pages = [
  HomeScreens(),
  FeedSreens(),
  SearchScreens(),
  UploadScreen(),
  ProfileScreens(),
];

var backgroundColor = Colors.black;

final display = new NumberFormat("#,##0", "en_US");

var textColor = Colors.deepPurpleAccent;

var buttonColor = Colors.deepPurpleAccent[400];

var textButtonColor = Colors.white;

var loregisButtonColor = Colors.grey[600];

//define firebase
var firebaseAuth = FirebaseAuth.instance;

var firebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;
