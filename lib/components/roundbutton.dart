import 'package:flutter/material.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/constatns/colors.dart';
// import 'package:homy/constants/colors.dart';

class Roundbutton extends StatelessWidget {
  final String label;
  final Function func;
  final double size;
  Roundbutton({this.size, this.label, this.func});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size == null ? 130 : size),
      child: FlatButton(
        onPressed: func == null ? () {} : func,
        child: Text(
          label,
          style: TextStyle(color: k_primarycolor),
        ),
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
