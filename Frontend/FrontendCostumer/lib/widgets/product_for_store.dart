import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/views/product_details.dart';

class ProductForStore extends StatelessWidget {
  Map<String, dynamic> product = {};

  ProductForStore(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Counter()),
      ),
      child: Card(
          elevation: 5,
          color: kBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.8 ,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child:FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(product["photo"]),
                  ) ,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      product["name"],
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
                      "Stock:${product['stock']}",
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
                        children: <TextSpan>[
                          const TextSpan(text: 'Son '),
                          TextSpan(
                            text: product["days_for_expiration"].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          const TextSpan(text: ' gün'),
                        ],
                      ),
                    ),
                    Text(
                      "${product['price']}₺",
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
