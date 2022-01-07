import 'dart:convert';

import 'package:FrontendBranchOffice/assets/const.dart';
import 'package:FrontendBranchOffice/product_for_cart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../cart_data_model.dart';

class Rezervation extends StatefulWidget {
  const Rezervation({Key? key}) : super(key: key);

  @override
  _RezervationState createState() => _RezervationState();
}

class _RezervationState extends State<Rezervation> {
  String udid = "139194294948093891209";
  bool _onEditing = true;
  late String _code;
  List<CartData> parseCartProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CartData>((json) => CartData.fromMap(json)).toList();
  }

  Future<List<CartData>> fetchCartProducts() async {
    dynamic response;

    response = await http.delete(Uri.parse('http://10.0.2.2:5001/cart/$_code'));
    return parseCartProducts(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Enter your code',
                style: TextStyle(fontSize: 20.0, color: Color(0xFF157575)),
              ),
            ),
          ),
          VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: kPrimaryColor),
            keyboardType: TextInputType.number,
            // in case underline color is null it will use primaryColor: Colors.red from Theme
            underlineColor: Colors.amber,
            length: 5,
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor),
              ),
            ),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: _onEditing
                    ? const Text('Please enter full code')
                    : FutureBuilder<List<CartData>>(
                        future: fetchCartProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? Column(
                                  children: [
                                    ProductForCart(snapshot.data![0]),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 60,),
                                          Text(
                                            "Tamamlandı",
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 50),
                                          ),
                                          Icon(
                                            Icons.verified,
                                            color: kPrimaryColor,
                                            size: 60,
                                          ),
                                        ]),
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                );
                        }),
              ))
        ],
      ),
    );
  }
}
