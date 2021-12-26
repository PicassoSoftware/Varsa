import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilterDrawerState();
  }
}

class _FilterDrawerState extends State<FilterDrawer> {
  Widget katagoriDrawer = Container();
  Widget mainDrawer = Container();
  Widget sktDrawer = Container();
  Widget fiyatDrawer = Container();
  Widget magazaDrawer = Container();
  Widget markaDrawer = Container();
  Widget stokDrawer = Container();
  Widget insideOfDrawer = Container();
  List<String> selectedKatagoris = [];

  void _initInsideOfDrawer() {
    setState(() {
      insideOfDrawer = mainDrawer;
    });
  }

  ListTile _createListTileOfMain(String title, Widget w) {
    return ListTile(
      title: Text(title),
      onTap: () => setState(() {
        insideOfDrawer = w;
      }),
    );
  }

  void _initMainDrawer() {
    setState(() {
      mainDrawer = ListView(
        children: [
          _createListTileOfMain("Katagori", katagoriDrawer),
          _createListTileOfMain("SKT", sktDrawer),
          _createListTileOfMain("Fiyat", fiyatDrawer),
          _createListTileOfMain("Mağaza", magazaDrawer),
          _createListTileOfMain("Marka", markaDrawer),
          _createListTileOfMain("Stok", stokDrawer),
        ],
      );
    });
  }

  void _initFiyatDrawer() {
    setState(() {
      fiyatDrawer =
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 36,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Min',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Max',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kPrimaryColor)),
                  onPressed: () {
                    setState(() {
                      insideOfDrawer = mainDrawer;
                    });
                  },
                  child: const Text("Kaydet"),
                ),
              ),
            )
          ],
        )
      ]);
    });
  }

  void _initKatagoriDrawer() {
    katagoriDrawer = ListView(
      children: [
        ListTile(
          selected: selectedKatagoris.contains("sut"),
          title: const Text("Süt Ürünleri"),
          onTap: () => {
            setState(() {
              if (selectedKatagoris.contains("sut")) {
                selectedKatagoris.remove("sut");
              } else {
                selectedKatagoris.add("sut");
              }
            })
          },
        ),
        ListTile(
          selected: selectedKatagoris.contains("icecek"),
          title: const Text("İçecek"),
          onTap: () => {
            setState(() {
              if (selectedKatagoris.contains("icecek")) {
                selectedKatagoris.remove("icecek");
              } else {
                selectedKatagoris.add("icecek");
              }
            })
          },
        ),
        ListTile(
          selected: selectedKatagoris.contains("cikolata"),
          title: const Text("Çikolata"),
          onTap: () => {
            setState(() {
              if (selectedKatagoris.contains("cikolata")) {
                selectedKatagoris.remove("cikolata");
              } else {
                selectedKatagoris.add("cikolata");
              }
              print(selectedKatagoris.contains("cikolata"));
              print(selectedKatagoris);
            })
          },
        ),
        ListTile(
          selected: selectedKatagoris.contains("un"),
          title: const Text("Un mamülleri"),
          onTap: () => {
            setState(() {
              if (selectedKatagoris.contains("un")) {
                selectedKatagoris.remove("un");
              } else {
                selectedKatagoris.add("un");
              }
            })
          },
        ),
      ],
    );
  }

  void _initMagazaDrawer() {}

  void _initMarkaDrawer() {}

  void _initStokDrawer() {
    setState(() {
      stokDrawer = Column(children: [
        const SizedBox(
          height: 36,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Min',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Max',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kPrimaryColor)),
                  onPressed: () {
                    setState(() {
                      insideOfDrawer = mainDrawer;
                    });
                  },
                  child: const Text("Kaydet"),
                ),
              ),
            )
          ],
        )
      ]);
    });
  }

  void _initSktDrawer() {
    setState(() {
      sktDrawer = Column(children: [
        const SizedBox(
          height: 36,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Min',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Max',
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor)),
                    onPressed: () {
                      setState(() {
                        insideOfDrawer = mainDrawer;
                      });
                    },
                    child: const Text("Kaydet"),
                  )),
            )
          ],
        )
      ]);
    });
  }

  @override
  void initState() {
    super.initState();
    _initKatagoriDrawer();
    _initFiyatDrawer();
    _initMagazaDrawer();
    _initMarkaDrawer();
    _initStokDrawer();
    _initSktDrawer();
    _initMainDrawer();
    _initInsideOfDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: insideOfDrawer,
    );
  }
}
