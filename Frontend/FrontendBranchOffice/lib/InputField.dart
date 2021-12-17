import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFF157575)))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your VKN number",
                  hintStyle: TextStyle(color: Color(0xFF157575)),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFF157575)))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Color(0xFF157575)),
                  border: InputBorder.none),
            ),
          ),
        ],
      );
}
