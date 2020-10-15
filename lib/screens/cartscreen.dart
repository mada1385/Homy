import 'package:flutter/material.dart';
import 'package:homy/components/colors.dart';
import 'package:homy/components/deletesheet.dart';
import 'package:homy/components/roundbutton.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:homy/screens/checkoutscreen.dart';
import 'package:provider/provider.dart';
import 'package:homy/components/styles.dart';

class Cartscreen extends StatelessWidget {
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
          Expanded(
            child: Container(
              child: provider.cart.length == 0
                  ? Center(child: Text("no items in the cart"))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Center(
                              child: GestureDetector(
                            onLongPress: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Deletetask(
                                  index,
                                  () {
                                    Provider.of<Cartprovider>(context,
                                            listen: false)
                                        .deletecart(index);
                                    Navigator.pop(context);
                                  },
                                ),
                                isScrollControlled: true,
                              );
                            },
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
                                subtitle: Text(provider
                                    .cart[index].product.price
                                    .toString()),
                                trailing: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: IconButton(
                                          onPressed: () {
                                            provider.changestatecart(
                                                index, true);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 20, right: 20),
                                        child: Text(
                                          provider.cart[index].count.toString(),
                                          style: h4,
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(
                                          onPressed: () {
                                            provider.changestatecart(
                                                index, false);
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 20,
            child: Container(
              height: 75,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "grand total : ",
                    style: h4,
                  ),
                  Flexible(
                    child: Text(
                      provider.posttotal().toString(),
                      style: h4,
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Roundbutton(
                    label: "proceed to check out",
                    size: 20,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkoutscreen()));
                    },
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
