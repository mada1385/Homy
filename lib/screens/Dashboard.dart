import 'package:flutter/material.dart';
import 'package:homy/logic/Product.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/fryo_icons.dart';
import 'package:homy/components/partials.dart';
import 'package:homy/components/styles.dart';
import 'package:homy/logic/cart.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:homy/logic/user.dart';
import 'package:homy/screens/ordersscreen.dart';
import 'package:provider/provider.dart';
import './ProductPage.dart';
import 'package:bubble/bubble.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          iconSize: 21,
          icon: Icon(Fryo.funnel),
        ),
        backgroundColor: primaryColor,
        title: Text('Homy', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.magnifier),
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.alarm),
          )
        ],
      ),
      body: storeTab(context),
    );
  }
}

Widget storeTab(BuildContext context) {
  final provider = Provider.of<Cartprovider>(context);

  return ListView(children: <Widget>[
    headerTopCategories(),
    deals(
      'Hot Deals',
      category: 1,
      onViewMore: () {},
      builder: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return (provider.foods != null)
              ? Fooditem(provider.foods[index], index: index, onLike: () {
                  if (!provider.foods[index].userLiked) {
                    Provider.of<Cartprovider>(context, listen: false)
                        .addfavourite(provider.foods[index]);
                    Provider.of<Cartprovider>(context, listen: false)
                        .changestatefoods(index);
                  } else {
                    Provider.of<Cartprovider>(context, listen: false)
                        .deletefavourite(index);
                    Provider.of<Cartprovider>(context, listen: false)
                        .changestatefoods(index);
                  }
                }, onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                productData: provider.foods[index],
                              )));
                },
                  isliked:
                      Provider.of<Cartprovider>(context).foods[index].userLiked)
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text('No provider.foods available at this moment.',
                        style: taglineText),
                  )
                ];
        },
        itemCount: provider.foods.length,
      ),
    ),
    deals('Drinks Parol',
        category: 2,
        onViewMore: () {},
        builder: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return (provider.drinks != null)
                ? Fooditem(provider.drinks[index], index: index, onLike: () {
                    if (!provider.drinks[index].userLiked) {
                      provider.changestatedrink(index);
                      Provider.of<Cartprovider>(context, listen: false)
                          .addfavourite(provider.drinks[index]);
                    } else {
                      Provider.of<Cartprovider>(context, listen: false)
                          .deletefavourite(index);
                      Provider.of<Cartprovider>(context, listen: false)
                          .changestatedrink(index);
                    }
                  }, onTapped: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  productData: provider.drinks[index],
                                )));
                  },
                    isliked: Provider.of<Cartprovider>(context)
                        .drinks[index]
                        .userLiked)
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No provider.foods available at this moment.',
                          style: taglineText),
                    )
                  ];
          },
          itemCount: provider.drinks.length,
        ))
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
            headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
            headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(
  String dealTitle, {
  onViewMore,
  int category,
  Widget builder,
  int count,
}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(height: 250, child: builder)
      ],
    ),
  );
}
