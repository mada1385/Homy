import 'package:homy/logic/Product.dart';

class Cart {
  Product product;
  int count;
  Cart({this.count, this.product});
  void plus() {
    count++;
  }

  void minus() {
    if (count > 1) count--;
  }
}
