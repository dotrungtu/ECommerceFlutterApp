import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/order_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/detail/detail_page.dart';
import 'package:ecommerce/views/screens/widget/cart_screens.dart';
import 'package:ecommerce/views/screens/widget/done_deal.dart';
import 'package:ecommerce/views/screens/widget/feeds_category.dart';
import 'package:ecommerce/views/screens/widget/home_screens.dart';
import 'package:ecommerce/views/screens/widget/order_screens.dart';
import 'package:ecommerce/views/screens/widget/upload_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'views/screens/widget/bottom_navbar.dart';
import 'views/screens/auth/login_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(create: (_) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cổng thương mại điện tử',
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapShot){
              if(userSnapShot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());// Hiển thị người dùng đang được tải
              }else if(userSnapShot.connectionState == ConnectionState.active){
                if(userSnapShot.hasData){
                  return BottomNavBar();
                }else{
                  return LoginScreens();
                }
              }else if(userSnapShot.hasError){
                return Center(child: Text('Đã có lỗi xảy ra, vui lòng thử lại sau'),
                );
              }
              return Container();
        }),
        routes: {
          BottomNavBar.routeName: (context) => BottomNavBar(),
          HomeScreens.routeName: (context) => HomeScreens(),
          DoneDeal.routeName: (context) => DoneDeal(),
          UploadScreen.routeName: (context) => UploadScreen(),
          OrderScreens.routeName: (context) => OrderScreens(),
          FeedsCategoryScreen.routeName: (context) => FeedsCategoryScreen(),
          CartSreens.routeName: (context) => CartSreens(),
          DetailPage.id:(context) => DetailPage(),
          },
        ),
    );
  }
}
