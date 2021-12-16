import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.teal.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Login",style: TextStyle(
          color: Color(0xFF157575),
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}