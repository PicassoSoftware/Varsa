import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  final List<Map<int, dynamic>> product_list;

  Store({this.product_list = const []});

  @override
  Widget build(BuildContext context) {
    Widget products = Center(
      child: Text(
        "Can't find any item :(",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
    if (product_list.isEmpty) {
      products = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 300,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 500,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Center(child: Text('$index')),
              ),
            );
          });
    }

    return Container(
      child: products,
    );
  }
}
