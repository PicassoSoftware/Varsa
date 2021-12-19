import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';

class ProductForStore extends StatelessWidget {
  final int index = 0;

  ProductForStore(index);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        color: Const.backgroundColor,
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
                        color: Const.primaryColor,
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
                      color: Theme.of(context).secondaryHeaderColor,
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
                        color: Const.primaryColor,
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
                      color: Const.primaryColor,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
