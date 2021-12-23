import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/views/product_details.dart';

class ProductForStore extends StatelessWidget {
  final int index = 0;

  ProductForStore(index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetails()),
      ),
      child: Card(
          elevation: 5,
          color: kBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset("lib/assets/milk.jpg"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Süt ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontFamily: "Lato"),
                    ),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Stock: 15",
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
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
                          fontSize: 14.0,
                          color: kPrimaryColor,
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'Son '),
                          TextSpan(
                            text: '5 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          TextSpan(text: 'gün'),
                        ],
                      ),
                    ),
                    Text(
                      "10₺",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
