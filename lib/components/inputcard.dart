import 'package:flutter/material.dart';
import 'package:homy/components/primarytextfield.dart';

class Textfieldcard extends StatelessWidget {
  final String hint, errortext;
  final bool validate;
  final TextEditingController controller;

  Textfieldcard(
      {Key key, this.hint, this.errortext, this.validate, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Primarytextfield(
            hint: hint,
            controller: controller,
            validate: validate,
            error: errortext,
            // color: Colors.lightBlue,
            // onchange: onchange,
          ),
        ),
      ),
    );
  }
}
