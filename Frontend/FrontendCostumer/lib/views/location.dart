import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: 
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    cursorColor: Color(0xFF157575),
                    style: TextStyle(
                        color: Color(0xFF157575),
                        fontSize: 20,
                        fontFamily: "Lato"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      hintText: 'Ilinizi giriniz...',
                      labelText: 'Il',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    cursorColor: Color(0xFF157575),
                    style: TextStyle(
                        color: Color(0xFF157575),
                        fontSize: 20,
                        fontFamily: "Lato"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      hintText: 'Ilcenizi giriniz...',
                      labelText: 'Ilçe',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    cursorColor: Color(0xFF157575),
                    style: TextStyle(
                        color: Color(0xFF157575),
                        fontSize: 20,
                        fontFamily: "Lato"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF157575), width: 2.0),
                      ),
                      hintText: 'Mahallenizi giriniz...',
                      labelText: 'Mahalle',
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
