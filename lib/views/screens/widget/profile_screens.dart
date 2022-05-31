import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/views/const.dart';
import 'package:ecommerce/views/screens/widget/cart_screens.dart';
import 'package:ecommerce/views/screens/widget/order_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreens extends StatefulWidget {
  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  String? _name;
  String? _email;
  String? _imageUrl;
  String? _phone;
  String? _address;
  ScrollController? _scrollController;
  var top = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
    getUserData();
  }

  void getUserData() async {
    DocumentSnapshot userData = await firebaseStore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    setState(() {
      _name = userData.get('userName');
      _email = userData.get('email');
      _phone = userData.get('phoneNumber');
      _address = userData.get('addressUser');
      _imageUrl = userData.get('image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Theme.of(context).buttonColor,
                              Theme.of(context).primaryColor,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedOpacity(
                                opacity: top <= 110.0 ? 1.0 : 0,
                                duration: Duration(milliseconds: 300),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      height: kToolbarHeight / 1.8,
                                      width: kToolbarHeight / 1.8,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 1.0,
                                            ),
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(''))),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '${_name}',
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          background: Image(
                              image: NetworkImage('${_imageUrl}'),
                              fit: BoxFit.fill)),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('Dịch vụ mua sắm')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(CartSreens.routeName);
                          },
                          title: Text(
                            'Giỏ hàng',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          trailing: Icon(Icons.chevron_right_rounded,
                              color: buttonColor),
                          leading: Icon(
                            CupertinoIcons.cart,
                            color: buttonColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('Thông tin người dùng')),
                    Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    userListTitle('Email', '${_email}' '', 0, context),
                    userListTitle('Tên tài khoản', '${_name}' '', 1, context),
                    userListTitle('Số điện thoại', '${_phone}' '', 2, context),
                    userListTitle('Địa chỉ giao hàng', '${_address}' '', 3, context),
                    userListTitle('Ngày tạo', '5pm' '', 4, context),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).backgroundColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, OrderScreens.routeName);
                          },
                          title: Text(
                            'Đơn hàng',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          leading: Icon(
                            Icons.shop,
                            color: buttonColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle('Cài đặt'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).backgroundColor,
                        child: ListTile(
                          onTap: () async {
                            await firebaseAuth.signOut();
                          },
                          title: Text(
                            'Đăng xuất',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          leading: Icon(
                            Icons.exit_to_app_rounded,
                            color: buttonColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    final double defaultTopMargin = 200.0 - 4.0;
    final double scaleStart = 160.0;
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController!.hasClients) {
      double offset = _scrollController!.offset;
      top += offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: buttonColor,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  List<IconData> _userTitleIcons = [
    Icons.email,
    Icons.account_circle,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
  ];

  Widget userListTitle(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
          subtitle: Text(subTitle),
          leading: Icon(
            _userTitleIcons[index],
            color: buttonColor,
          ),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: buttonColor,
        ),
      ),
    );
  }
}
