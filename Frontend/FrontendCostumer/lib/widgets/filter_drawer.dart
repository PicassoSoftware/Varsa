import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/views/store.dart';

class FilterDrawer extends StatefulWidget {
  Function update_product_list;
  List<Map<String, dynamic>> product_list = [];
  List<Map<String, dynamic>> selected_product_list = [];

  FilterDrawer(this.update_product_list, this.product_list, {Key? key})
      : super(key: key);

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
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              onPressed: () {
                setState(() {
                  widget.update_product_list(widget.update_product_list);
                  Navigator.pop(context);
                });
              },
              child: const Text("Kaydet"),
            ),
          ),
        ],
      );
    });
  }

  void _initFiyatDrawer() {
    TextEditingController max_price = TextEditingController();
    TextEditingController min_price = TextEditingController();

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
                  controller: min_price,
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
                  controller: max_price,
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
                      print("eben");
                      List<Map<String, dynamic>> updated = widget.product_list
                          .where((element) =>
                              element["price"] < int.parse(max_price.text) &&
                              element["price"] > int.parse(min_price.text))
                          .toList();
                      widget.update_product_list(updated);
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
