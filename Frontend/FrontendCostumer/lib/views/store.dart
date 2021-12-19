import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import '../widgets/product_for_store.dart';

class Store extends StatelessWidget {
  final List<Map<int, dynamic>> product_list;

  Store({this.product_list = const []});

  @override
  Widget build(BuildContext context) {
    Widget products = Center(
      child: Text(
        "Can't find any item :(",
        style: TextStyle(
          color: Const.primaryColor,
        ),
      ),
    );
    if (product_list.isEmpty) {
      products = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: 300,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(child: ProductForStore(index));
          });
    }

    return Container(
      child: products,
    );
  }
}
