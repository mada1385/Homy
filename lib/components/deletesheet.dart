import 'package:flutter/material.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:provider/provider.dart';

class Deletetask extends StatelessWidget {
  final int index;
  final Function onpressed;
  Deletetask(this.index, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Center(
          child: FlatButton(
            onPressed: onpressed,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 50,
            ),
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ));
  }
}
