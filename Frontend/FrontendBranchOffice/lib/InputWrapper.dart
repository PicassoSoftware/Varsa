import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEAD7C7),
              borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),
          SizedBox(height: 40,),
          SizedBox(height: 40,),
          Button()
        ],
      ),
    );
  }
}