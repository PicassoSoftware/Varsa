import 'package:flutter/material.dart';
import 'package:ui/views/cart.dart';
import 'package:ui/views/location.dart';
import 'package:ui/views/store.dart';
import 'package:ui/widgets/filter_drawer.dart';
import 'assets/const.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  
  Map<String, String> lokasyon = {
    "city": "Trabzon",
    "town": "Ortahisar",
    "district": "Konaklar"
  };

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Location(),
    Store(),
    Cart(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBody: true,
      endDrawer: FilterDrawer(),
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
