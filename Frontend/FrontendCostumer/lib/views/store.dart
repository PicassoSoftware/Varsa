import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/widgets/filter_drawer.dart';
import '../widgets/product_for_store.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StoreState();
  }
}

class _StoreState extends State<Store> {
  final searchThing = TextEditingController();
  List<Map<String, dynamic>> selected_product_list = [
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
  List<Map<String, dynamic>> product_list = [
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

  void _openSortModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kBackgroundColor,
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("En Düşük Fiyat"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort(
                                (a, b) => a["price"].compareTo(b["price"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("En Yüksek Fiyat"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort(
                                (a, b) => b["price"].compareTo(a["price"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("Stoğu Az Olan"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort(
                                (a, b) => a["stock"].compareTo(b["stock"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("Stoğu Bol Olan"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort(
                                (a, b) => b["stock"].compareTo(a["stock"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("SKT'si Yakın Olan"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort((a, b) =>
                                a["days_for_expiration"]
                                    .compareTo(b["days_for_expiration"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: const Text("SKT'si Uzak Olan"),
                        onPressed: () {
                          setState(() {
                            selected_product_list.sort((a, b) =>
                                b["days_for_expiration"]
                                    .compareTo(a["days_for_expiration"]));
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget products = Center(
      child: Text(
        "Can't find any item :(",
        style: TextStyle(
          color: kPrimaryColor,
        ),
      ),
    );
    if (selected_product_list.isNotEmpty) {
      products = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: selected_product_list.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                child: ProductForStore(selected_product_list[index]));
          });
    }

    Widget store = Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: TextField(
                    onChanged: (value) => {
                      setState(() {
                        print(value.isEmpty);
                        if (value.isEmpty) {
                          selected_product_list = product_list;
                        } else {
                          selected_product_list = selected_product_list
                              .where(
                                  (element) => element["name"].toLowerCase().contains(value))
                              .toList();
                        }
                      })
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      focusColor: kPrimaryColor,
                      labelText: 'Ara',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      suffixIcon: Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 20,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _openSortModal(context);
                    },
                    icon: Icon(
                      Icons.compare_arrows,
                      color: kPrimaryColor,
                    ),
                    label: Text(
                      "Sırala",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 20,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: kPrimaryColor,
                    ),
                    label: Text(
                      "Filtrele",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: products,
          ),
        ],
      ),
    );
    return store;
  }
}
