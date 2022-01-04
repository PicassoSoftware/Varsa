import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/views/cart.dart';

class ProductDetails extends StatefulWidget {
  Function changePage;
  int id;

  ProductDetails(this.changePage, this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductDetailsState();
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor, title: const Text("Ürün detayları",),),
      body: Card(
          color: kBackgroundColor,
          child: ListView(
            children: [
              Container(
                width: 60,
                padding: const EdgeInsets.all(15),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "lib/assets/milk.jpg",
                        fit: BoxFit.fill,
                        width: 500.0,
                        height: 450.0,
                      ),
                      Row(
                        children: const <Widget>[
                          Text(
                            "Süt",
                            style: TextStyle(
                                color: Color(0xFF157575),
                                fontSize: 30,
                                fontFamily: "Lato"),
                          ),
                        ],
                      ),
                      Row(
                        children: const <Widget>[
                          SizedBox(
                            child: Text(
                              "Satıcı: Neziha Esra Bİlgili",
                              style: TextStyle(
                                  color: Color(0xFF157575),
                                  fontSize: 20,
                                  fontFamily: "RobotoCondensed Bold"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const <Widget>[
                          SizedBox(
                              width: 320,
                              child: Text(
                                "",
                                style: TextStyle(
                                    color: Color(0xFF157575),
                                    fontSize: 15,
                                    fontFamily: "Lato"),
                              )),
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
                                fontSize: 25,
                                color: kPrimaryColor,
                              ),
                              children: const <TextSpan>[
                                TextSpan(text: 'Son '),
                                TextSpan(
                                  text: '5 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                TextSpan(text: 'gün'),
                              ],
                            ),
                          ),
                          Text(
                            "10₺",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: minus,
                            child: const Icon(
                                IconData(0xee88, fontFamily: 'MaterialIcons'),
                                color: Colors.white),
                            backgroundColor: kPrimaryColor,
                          ),
                          Text('$_n', style: const TextStyle(fontSize: 35.0)),
                          FloatingActionButton(
                            onPressed: add,
                            child: const Icon(
                                IconData(0xe79f, fontFamily: 'MaterialIcons'),
                                color: Colors.white),
                            backgroundColor: kPrimaryColor,
                          ),
                        ],
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          widget.changePage(2);
                          Navigator.pop(context);
                        },
                        label: const Text('ADD'),
                        icon: const Icon(Icons.shopping_cart_outlined),
                        backgroundColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
