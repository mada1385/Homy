import 'package:flutter/cupertino.dart';
import 'package:homy/logic/Product.dart';
import 'package:homy/logic/cart.dart';
import 'package:provider/provider.dart';

class Cartprovider extends ChangeNotifier {
  bool creditcardbox = false, cod = false;

  bool get credit {
    return creditcardbox;
  }

  bool get cash {
    return cod;
  }

  void changecreditstate() {
    creditcardbox = !creditcardbox;
    if (cod == true && creditcardbox == true) {
      cod = false;
    }
    notifyListeners();
  }

  void changecashstate() {
    cod = !cod;
    if (cod == true && creditcardbox == true) {
      creditcardbox = false;
    }
    notifyListeners();
  }

  double gettotal = 0;

  List<Product> favourite = [];
  void addfavourite(Product taskname) {
    favourite.add(taskname);
    print(taskname);
    notifyListeners();
    print(drinks);
  }

  void deletefavourite(int index) {
    favourite[index] = null;
    notifyListeners();
  }

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: false,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: false,
        discount: 3.4)
  ];
  void adddrinks(Product taskname) {
    print(taskname);
    notifyListeners();
    print(drinks);
  }

  void changestatedrink(
    int index,
  ) {
    drinks[index].isliked();
    notifyListeners();
  }

  void deletedrinks(int index) {
    drinks.removeAt(index);
    notifyListeners();
  }

  List<Product> foods = [
    Product(
        cost: 25.0,
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: false,
        discount: 10),
    Product(
        cost: 150.0,
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      cost: 10.99,
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        cost: 50.0,
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: false,
        discount: 14)
  ];

  void addfoods(Product taskname) {
    print(taskname);
    notifyListeners();
    print(drinks);
  }

  void changestatefoods(
    int index,
  ) {
    foods[index].isliked();
    notifyListeners();
  }

  void deletefoods(int index) {
    drinks.removeAt(index);
    notifyListeners();
  }

  List<Cart> cart = [];

  void addcart(Cart cartitem) {
    print(cartitem.product.name);
    cart.add(cartitem);
    notifyListeners();
    print(cart);
  }

  void changestatecart(int index, bool increment) {
    if (increment) {
      cart[index].plus();
      total();
    } else {
      cart[index].minus();
      total();
    }
    notifyListeners();
  }

  void deletecart(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  void total() {
    gettotal = 0;
    for (var item in cart) {
      gettotal = gettotal + item.product.cost * item.count;
    }
  }

  double posttotal() {
    total();
    return gettotal;
  }
}
