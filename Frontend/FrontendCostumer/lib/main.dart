import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/views/cart.dart';
import 'package:ui/views/location.dart';
import 'package:ui/views/store.dart';
import 'package:ui/widgets/filter_drawer.dart';
import 'assets/const.dart';
import 'models/productforcardmodel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Varsa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> selected_product_list = [];
  List<Map<String, dynamic>> product_list = [];
  List<Widget> _widgetOptions = <Widget>[Container(), Container(), Container()];
  int _selectedIndex = 0;
  String city = "istanbul", town = "ümraniye", district = "namık kemal";

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }

  Future<List<Product>> fetchProducts() async {
    dynamic response = [];
    response = await http
        .get(Uri.parse('http://10.0.2.2:5001/storage/$city/$town/$district'));
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  void initState() {
    city = "istanbul";
    town = "ümraniye";
    district = "namık kemal";
    _selectedIndex = 0;
    _widgetOptions = <Widget>[
      Location(_changeLocation, _onItemTapped),
      FutureBuilder<List<Product>>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? Store(city, town, district, _onItemTapped, snapshot.data!,
                    snapshot.data!)
                : Store(city, town, district, _onItemTapped, [], []);
          }),
      Cart(fetchProducts()),
    ];
  }

  Map<String, String> lokasyon = {
    "city": "Trabzon",
    "town": "Ortahisar",
    "district": "Konaklar"
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  void _changeLocation(String gCity, String gTown, String gDistrict) {
    setState(() {
      city = gCity;
      town = gTown;
      district = gDistrict;
    });
  }

  void _updateSelectedProduct(List<Map<String, dynamic>> updated_product_list) {
    setState(() {
      print("_updateSelectedProduct");
      selected_product_list = updated_product_list;
      print(selected_product_list);
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBody: true,
      endDrawer: FilterDrawer(_updateSelectedProduct, product_list),
      appBar: AppBar(
        actions: <Widget>[Container()],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogoPath,
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 3),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          child: BottomNavigationBar(
            backgroundColor: kBackgroundColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Konum',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Mağaza',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'Sepet',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kPrimaryColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
