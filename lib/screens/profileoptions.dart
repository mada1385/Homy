import 'package:flutter/material.dart';
import 'package:homy/components/fryo_icons.dart';
import 'package:homy/components/styles.dart';
import 'package:homy/screens/paymentscreen.dart';
import 'package:homy/screens/profilescreen.dart';

class Profileoptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Profileoptioncard(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profilescreen()));
                },
                icon: Icon(Icons.person),
                title: "profile",
              ),
              Profileoptioncard(
                icon: Icon(Icons.payment),
                title: "payment method",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Paymentscreen()));
                },
              ),
              Profileoptioncard(
                icon: Icon(Icons.call),
                title: "contact us",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Profileoptioncard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function ontap;
  Profileoptioncard({Key key, this.title, this.icon, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
          onTap: ontap,
          child: Card(
            elevation: 20,
            child: ListTile(
              // title: Text(date),
              leading: icon,
              title: Text(
                title,
                style: h5,
              ),
              trailing: Icon(Fryo.chevron_right),
              // isThreeLine: true,
            ),
          )),
    );
  }
}
