import 'package:flutter/foundation.dart';

class Product {
  String name, price, image;
  bool userLiked;
  double discount, cost;
  int category;

  Product(
      {this.cost,
      this.name,
      this.price,
      this.discount,
      this.image,
      this.userLiked,
      this.category});

  void isliked() {
    userLiked = !userLiked;
    print(userLiked);
  }
}
