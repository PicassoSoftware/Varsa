import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    ));
  }
}
