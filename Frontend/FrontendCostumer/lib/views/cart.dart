import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: kBackgroundColor,
    body:Center(
      child: Column(
        children: const [
          Text("evev"),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: 'Search',
                suffixIcon: Icon(Icons.search)),
          )
        ],
      ),
    ),
    );
  }
}
