import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';

class Location extends StatefulWidget {
  Function changeLocation;
  Function changePage;
  Location(this.changeLocation, this.changePage, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LocationState();
  }
}

class _LocationState extends State<Location> {
  String city = "";
  String town = "";
  String district = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    city = "";
    town = "";
    district = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  cursorColor: kPrimaryColor,
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: 20, fontFamily: "Lato"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    hintText: 'Ilinizi giriniz...',
                    labelText: 'Il',
                  ),
                  onChanged: (value) => {
                    setState(
                      () {
                        city = value;
                      },
                    ),
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  cursorColor: kPrimaryColor,
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: 20, fontFamily: "Lato"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    hintText: 'Ilcenizi giriniz...',
                    labelText: 'Ilçe',
                  ),
                  onChanged: (value) => {
                    setState(
                      () {
                        town = value;
                      },
                    ),
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  cursorColor: kPrimaryColor,
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: 20, fontFamily: "Lato"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                    ),
                    hintText: 'Mahallenizi giriniz...',
                    labelText: 'Mahalle',
                  ),
                  onChanged: (value) => {
                    setState(
                      () {
                        district = value;
                      },
                    ),
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: () {
                        widget.changeLocation(city, town, district);
                        widget.changePage(1);
                      },
                      child: const Text("Ara"))),
            ],
          )
        ],
      ),
    );
  }
}
