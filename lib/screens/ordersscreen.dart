import 'package:flutter/material.dart';
import 'package:homy/components/fryo_icons.dart';
import 'package:homy/components/styles.dart';

class Orderscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          child: Column(
        children: <Widget>[
          Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.receipt,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "orders",
                    style: h3,
                  ),
                ],
              ),
              width: double.infinity,
            ),
          )),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                  Ordercard(
                    date: "21/8/2020",
                    time: "22:10",
                    vendor: "dunkin",
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class Ordercard extends StatelessWidget {
  final String vendor, date, time;

  Ordercard({Key key, this.vendor, this.date, this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
          child: Card(
        elevation: 20,
        child: ListTile(
          title: Text(date),
          leading: Text(
            vendor,
            style: h4,
          ),
          subtitle: Text(time),
          trailing: Icon(Fryo.chevron_right),
          isThreeLine: true,
        ),
      )),
    );
  }
}
