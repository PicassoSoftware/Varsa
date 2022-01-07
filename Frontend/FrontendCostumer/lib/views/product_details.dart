import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/models/product_details_model.dart';
import 'package:ui/views/cart.dart';
import 'package:http/http.dart' as http;

class ProductDetails extends StatefulWidget {
  ProductDetail product;
  Function changePage;

  ProductDetails(this.changePage, this.product, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductDetailsState();
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  String udid = "139194294948093891209";
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future addProductToCart(String udId, int id, int count) async {
      Map data = {'udid': udId, 'productid': id, 'productcount': count};

     http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:5001/cart'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create album.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Ürün detayları",
        ),
      ),
      body: Card(
        color: kBackgroundColor,
        child: ListView(
          children: [
            Container(
              width: 60,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(widget.product.photo,
                    fit: BoxFit.fill,
                    width: 500.0,
                    height: 450.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        widget.product.productName,
                        style: const TextStyle(
                            color: Color(0xFF157575),
                            fontSize: 30,
                            fontFamily: "Lato"),
                      ),
                    ],
                  ),
                  Row(
                    children:  <Widget>[
                      SizedBox(
                        child: Text(
                          "Satıcı: BIM ",
                          style: const TextStyle(
                              color: Color(0xFF157575),
                              fontSize: 20,
                              fontFamily: "RobotoCondensed Bold"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(
                          width: 320,
                          child: Text(
                            "",
                            style: const TextStyle(
                                color: Color(0xFF157575),
                                fontSize: 15,
                                fontFamily: "Lato"),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Son '),
                            TextSpan(
                              text: '${widget.product.daysForExpiration} ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const TextSpan(text: 'gün'),
                          ],
                        ),
                      ),
                      Text(
                        "${widget.product.price}₺",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "minus",
                        onPressed: minus,
                        child: const Icon(
                            IconData(0xee88, fontFamily: 'MaterialIcons'),
                            color: Colors.white),
                        backgroundColor: kPrimaryColor,
                      ),
                      Text('$_n', style: const TextStyle(fontSize: 35.0)),
                      FloatingActionButton(
                        heroTag: "add",
                        onPressed: add,
                        child: const Icon(
                            IconData(0xe79f, fontFamily: 'MaterialIcons'),
                            color: Colors.white),
                        backgroundColor: kPrimaryColor,
                      ),
                    ],
                  ),
                  FloatingActionButton.extended(
                    heroTag: "addtocart",
                    onPressed: () {
                      addProductToCart(udid, widget.product.id, _n);
                      widget.changePage(2);
                      Navigator.pop(context);
                    },
                    label: const Text('ADD'),
                    icon: const Icon(Icons.shopping_cart_outlined),
                    backgroundColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
