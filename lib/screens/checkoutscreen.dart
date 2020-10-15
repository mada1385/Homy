import 'package:flutter/material.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/deletesheet.dart';
import 'package:homy/components/roundbutton.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:homy/logic/credit_card.dart';
import 'package:provider/provider.dart';
import 'package:homy/components/styles.dart';

class Checkoutscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Cartprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("cart"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: provider.cart.length == 0
                  ? Center(child: Text("no items orderd "))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Center(
                              child: Card(
                            elevation: 20,
                            child: ListTile(
                              leading: Image.asset(
                                provider.cart[index].product.image,
                                width: 50,
                                height: 50,
                              ),
                              isThreeLine: true,
                              title: Text(provider.cart[index].product.name),
                              subtitle: Text(provider.cart[index].product.price
                                  .toString()),
                              trailing: Container(
                                // margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  provider.cart[index].count.toString(),
                                  style: h4,
                                ),
                              ),
                            ),
                          )),
                        );
                      },
                      itemCount: provider.cart.length,
                    ),
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "payment method",
                    style: contrastText,
                    textAlign: TextAlign.start,
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      title: Text(
                        "credit card",
                        style: h4,
                      ),
                      trailing: Checkbox(
                          activeColor: primaryColor,
                          value: provider.credit,
                          onChanged: (val) {
                            Provider.of<Cartprovider>(context, listen: false)
                                .changecreditstate();
                          }),
                    ),
                  ),
                  Card(
                    elevation: 20,
                    child: ListTile(
                      title: Text(
                        "COD",
                        style: h4,
                      ),
                      trailing: Checkbox(
                          activeColor: primaryColor,
                          value: provider.cod,
                          onChanged: (val) {
                            Provider.of<Cartprovider>(context, listen: false)
                                .changecashstate();
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "tax : ",
                  style: h4,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  provider.posttotal().toString(),
                  style: h4,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "grand total : ",
                  style: h4,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  provider.posttotal().toString(),
                  style: h4,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 20,
            child: Container(
              height: 75,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Roundbutton(
                    label: "place order",
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
