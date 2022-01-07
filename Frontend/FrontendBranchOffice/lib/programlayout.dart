import 'package:flutter/material.dart';
import 'assets/const.dart';
import 'views/product_add.dart';
import 'views/rezervation.dart';
import 'views/seller_profile.dart';

class ProgramLayout extends StatefulWidget {
  const ProgramLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProgramLayoutState();
  }
}

class _ProgramLayoutState extends State<ProgramLayout> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    SelectPhoto(),
    Rezervation(),
    Grade(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("layout");
    return Scaffold(
      backgroundColor:kBackgroundColor,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        actions: <Widget>[Container()],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(kLogoPath,fit: BoxFit.contain,height: 32,
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
                icon: Icon(Icons.add),
                label: 'Ekle',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified),
                label: 'Referans Onayla',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
