import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui/assets/const.dart';
import 'package:ui/models/cart_data_model.dart';
import 'package:ui/models/productforcardmodel.dart';
import 'package:ui/models/rezerv_data_model.dart';
import 'package:ui/views/cart_tab.dart';
import 'package:ui/views/rezervation_tab.dart';

class Cart extends StatefulWidget {
  Function itemTapped;
  Cart(this.itemTapped, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  String udid = "139194294948093891209";

  @override
  Widget build(BuildContext context) {
    List<CartData> parseCartProducts(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<CartData>((json) => CartData.fromMap(json)).toList();
    }

    Future<List<CartData>> fetchCartProducts() async {
      dynamic response = [];

      response = await http.get(Uri.parse('http://10.0.2.2:5001/cart/$udid/0'));
      if (response.statusCode == 200) {
        return parseCartProducts(response.body);
      } else {
        return [];
      }
    }

    List<RezervData> parseReservProducts(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed
          .map<RezervData>((json) => RezervData.fromMap(json))
          .toList();
    }

    Future<List<RezervData>> fetchReservProducts() async {
      dynamic response = [];

      response = await http.get(Uri.parse('http://10.0.2.2:5001/cart/$udid/1'));
      if (response.statusCode == 200) {
        return parseReservProducts(response.body);
      } else {
        return [];
      }
    }

    void refresh() {
      setState(() {});
    }

    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                overlayColor: MaterialStateProperty.all(kPrimaryColor),
                indicatorColor: kPrimaryColor,
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.shopping_basket,
                    color: kPrimaryColor,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.timer,
                    color: kPrimaryColor,
                  )),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<CartData>>(
                future: fetchCartProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? CartTab(snapshot.data!, refresh)
                      : Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                }),
            FutureBuilder<List<RezervData>>(
                future: fetchReservProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? RezervationTab(snapshot.data!)
                      : Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
