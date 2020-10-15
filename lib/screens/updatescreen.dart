import 'package:flutter/material.dart';
import 'package:homy/components/primarytextfield.dart';
import 'package:homy/components/roundbutton.dart';

class Updatescreen extends StatefulWidget {
  final String hint;

  Updatescreen({Key key, this.hint}) : super(key: key);

  @override
  _UpdatescreenState createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  String eupdate = null;
  TextEditingController cupdate;
  bool vupdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Primarytextfield(
                  controller: cupdate,
                  validate: vupdate,
                  hint: widget.hint,
                  error: eupdate,
                ),
                SizedBox(
                  height: 20,
                ),
                Roundbutton(
                  label: "update",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
