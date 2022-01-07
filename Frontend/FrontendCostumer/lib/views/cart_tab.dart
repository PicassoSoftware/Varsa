import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/models/cart_data_model.dart';
import 'package:ui/models/product_details_model.dart';
import 'package:ui/widgets/product_for_cart.dart';
import 'package:http/http.dart' as http;

class CartTab extends StatefulWidget {
  List<CartData> data;
  Function refresh;
  CartTab(this.data, this.refresh, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartTabState();
  }
}

class _CartTabState extends State<CartTab> {
  String udid = "139194294948093891209";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget cartContent = const Center(child: Text("Sepet boş :("));

    double toplam = 0;

    for (int i = 0; i < widget.data.length; i++) {
      toplam += widget.data[i].price;
    }
    if (widget.data.isNotEmpty) {
      cartContent = ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductForCart(productForCart: widget.data[index]);
          });
    }

    Future rezerv() async {
      dynamic response;

      response = await http.get(Uri.parse('http://10.0.2.2:5001/cart/$udid'));
    }

    return Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            Expanded(flex: 7, child: cartContent),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "$toplam",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontFamily: "Lato"),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    )),
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor)),
                      onPressed: () {
                        rezerv();
                        widget.refresh();
                        DefaultTabController.of(context)!.animateTo(1);
                      },
                      child: const Text("Ayırt")),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    )),
              ],
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                ))
          ],
        ));
  }
}
