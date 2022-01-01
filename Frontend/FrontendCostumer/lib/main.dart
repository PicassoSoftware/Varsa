import 'package:flutter/material.dart';
import 'package:ui/views/cart.dart';
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
  List<Map<String, dynamic>> selected_product_list = [];
  List<Map<String, dynamic>> product_list = [];
  List<Widget> _widgetOptions = <Widget>[Container(), Container(), Container()];
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    _selectedIndex = 0;
    selected_product_list = [
      {
        "id": 0,
        "name": "süt",
        "stock": 15,
        "photo": "lib/assets/milk.jpg",
        "price": 10,
        "days_for_expiration": 5
      },
      {
        "id": 1,
        "name": "Kola",
        "stock": 5,
        "photo": "lib/assets/kola.jpg",
        "price": 4,
        "days_for_expiration": 2
      },
      {
        "id": 2,
        "name": "Yoğurt",
        "stock": 25,
        "photo": "lib/assets/yogurt.jpg",
        "price": 12,
        "days_for_expiration": 12
      },
      {
        "id": 3,
        "name": "Ekmek",
        "stock": 20,
        "photo": "lib/assets/ekmek.jpg",
        "price": 3,
        "days_for_expiration": 1
      },
      {
        "id": 4,
        "name": "Nutella",
        "stock": 5,
        "photo": "lib/assets/nutella.jpg",
        "price": 18,
        "days_for_expiration": 7
      },
    ];
    product_list = [
      {
        "id": 0,
        "name": "süt",
        "stock": 15,
        "photo": "lib/assets/milk.jpg",
        "price": 10,
        "days_for_expiration": 5
      },
      {
        "id": 1,
        "name": "Kola",
        "stock": 5,
        "photo": "lib/assets/kola.jpg",
        "price": 4,
        "days_for_expiration": 5
      },
      {
        "id": 2,
        "name": "Yoğurt",
        "stock": 25,
        "photo": "lib/assets/yogurt.jpg",
        "price": 12,
        "days_for_expiration": 12
      },
      {
        "id": 3,
        "name": "Ekmek",
        "stock": 20,
        "photo": "lib/assets/ekmek.jpg",
        "price": 3,
        "days_for_expiration": 1
      },
      {
        "id": 4,
        "name": "Nutella",
        "stock": 5,
        "photo": "lib/assets/nutella.jpg",
        "price": 18,
        "days_for_expiration": 7
      },
    ];
    _widgetOptions = <Widget>[
      const Text(
        'Konum',
        style: optionStyle,
      ),
      Store(_onItemTapped, selected_product_list, product_list),
      const Cart(),
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
