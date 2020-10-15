// import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/fryo_icons.dart';
import 'package:homy/components/styles.dart';
import 'package:homy/constatns/colors.dart';
import 'package:homy/screens/Dashboard.dart';
import 'package:homy/screens/cartscreen.dart';
import 'package:homy/screens/favourite.dart';
import 'package:homy/screens/ordersscreen.dart';
import 'package:homy/screens/profileoptions.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> x = [
      Favouritescreen(),
      Orderscreen(),
      Homewidget(),
      Text("chat"),
      Profileoptions(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          backgroundColor: primaryColor,
          title:
              Text('Homy', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartscreen()));
              },
              iconSize: 21,
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.favorite,
              size: 30,
              color: k_primarycolor,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: k_primarycolor,
            ),
            Icon(
              Icons.home,
              size: 30,
              color: k_primarycolor,
            ),
            Icon(
              Icons.chat,
              size: 30,
              color: k_primarycolor,
            ),
            Icon(
              Icons.perm_identity,
              size: 30,
              color: k_primarycolor,
            ),
          ],
          color: k_backgroundcolor,
          buttonBackgroundColor: k_backgroundcolor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: x[_page],
      ),
    );
  }
}

class Homewidget extends StatelessWidget {
  const Homewidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: k_primarycolor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Optioncard(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Fryo.food, size: 70, color: Colors.black87),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "food",
                            style: h3,
                          )
                        ],
                      ),
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      }),
                  SizedBox(
                    height: 100,
                  ),
                  Optioncard(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Fryo.heart, size: 70, color: Colors.black87),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "medicene",
                            style: h3,
                          )
                        ],
                      ),
                      function: () {}),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Optioncard(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Fryo.dinner, size: 70, color: Colors.black87),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "package",
                            style: h3,
                          )
                        ],
                      ),
                      function: () {}),
                  SizedBox(
                    height: 100,
                  ),
                  Optioncard(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Fryo.briefcase, size: 70, color: Colors.black87),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "package",
                            style: h3,
                          )
                        ],
                      ),
                      function: () {}),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Optioncard extends StatelessWidget {
  final Widget child;
  final Function function;
  const Optioncard({
    @required this.child,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 50,
        color: k_primarycolor,
        child: Container(
          height: 150,
          width: 150,
          child: child,
        ),
      ),
    );
  }
}
