import 'package:flutter/material.dart';
import 'package:homy/logic/Product.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/styles.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:provider/provider.dart';

class Fooditem extends StatelessWidget {
  final Product food;
  final bool isProductPage, isliked;
  final int index, type;
  final double imgWidth;
  final Function onLike, onTapped;
  final Provider provider;

  Fooditem(this.food,
      {Key key,
      this.provider,
      this.isliked,
      this.index,
      this.type,
      this.isProductPage = false,
      this.imgWidth,
      this.onLike,
      this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: <Widget>[
          Container(
              width: 180,
              height: 180,
              child: RaisedButton(
                  color: white,
                  elevation: (isProductPage) ? 20 : 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: onTapped,
                  child: Hero(
                      transitionOnUserGestures: true,
                      tag: food.name,
                      child: Image.asset(food.image,
                          width: (imgWidth != null) ? imgWidth : 100)))),
          Positioned(
            bottom: (isProductPage) ? 10 : 70,
            right: 0,
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: CircleBorder(),
              onPressed: onLike,
              child: Icon(
                food.userLiked ? Icons.favorite : Icons.favorite_border,
                color: (food.userLiked) ? primaryColor : darkText,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: (!isProductPage)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(food.name, style: foodNameText),
                      Text(food.price, style: priceText),
                    ],
                  )
                : Text(' '),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: (food.discount != null)
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('-' + food.discount.toString() + '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )
                  : SizedBox(width: 0))
        ],
      ),
    );
  }
}
