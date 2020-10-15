import 'package:flutter/material.dart';
import 'package:homy/components/deletesheet.dart';
import 'package:homy/components/fryo_icons.dart';
import 'package:homy/components/styles.dart';
import 'package:homy/logic/Product.dart';
import 'package:homy/logic/cartprovider.dart';
import 'package:homy/screens/ProductPage.dart';
import 'package:provider/provider.dart';

class Favouritescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  size: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "favourites",
                  style: h3,
                ),
              ],
            ),
            width: double.infinity,
          ),
        )),
        Expanded(
          child: Container(
            child: Provider.of<Cartprovider>(context).favourite.length == 0
                ? Center(child: Text("no favourites yet !!"))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        productData:
                                            Provider.of<Cartprovider>(context)
                                                .favourite[index],
                                      )));
                        },
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Deletetask(
                              index,
                              () {
                                Provider.of<Cartprovider>(context,
                                        listen: false)
                                    .changestatefoods(index);
                                Provider.of<Cartprovider>(context,
                                        listen: false)
                                    .deletefavourite(index);
                                Navigator.pop(context);
                              },
                            ),
                            isScrollControlled: true,
                          );
                        },
                        child: Favouritecard(
                            item: Provider.of<Cartprovider>(context)
                                .favourite[index]),
                      );
                    },
                    itemCount:
                        Provider.of<Cartprovider>(context).favourite.length,
                  ),
          ),
        ),
      ],
    ));
  }
}

class Favouritecard extends StatelessWidget {
  final Product item;

  Favouritecard({this.item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
          child: Card(
        elevation: 20,
        child: ListTile(
          leading: Image.asset(
            item.image,
            width: 50,
            height: 50,
          ),
          // title: Text(date),
          title: Text(
            item.name,
            style: h4,
          ),
          subtitle: Text(
            item.price,
            style: h5,
          ),
          trailing: Icon(Fryo.chevron_right),
          isThreeLine: true,
        ),
      )),
    );
  }
}
