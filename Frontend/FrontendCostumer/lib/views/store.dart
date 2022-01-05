import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/models/productforcardmodel.dart';
import 'package:ui/widgets/filter_drawer.dart';
import '../widgets/product_for_store.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Store extends StatefulWidget {
  List<Product> selected_product_list;
  List<Product> product_list;
  Function changePage;
  String city, town, district;

  Store(this.city, this.town, this.district, this.changePage,
      this.selected_product_list, this.product_list,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StoreState();
  }
}

class _StoreState extends State<Store> {
  _StoreState();

  final searchThing = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                         widget.selected_product_list.sort(
                             (a, b) => a.price.compareTo(b.price));
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
                         widget.selected_product_list.sort(
                             (a, b) => b.price.compareTo(a.price));
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
                         widget.selected_product_list.sort(
                             (a, b) => a.stock.compareTo(b.stock));
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
                         widget.selected_product_list.sort(
                             (a, b) => b.stock.compareTo(a.stock));
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
                         widget.selected_product_list.sort((a, b) =>
                             a.daysForExpiration
                                 .compareTo(b.daysForExpiration));
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
                         widget.selected_product_list.sort((a, b) =>
                             b.daysForExpiration
                                 .compareTo(a.daysForExpiration));
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
    if (widget.selected_product_list.isNotEmpty) {
      products = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: widget.selected_product_list.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                child: ProductForStore(widget.changePage,widget.selected_product_list[index]));
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
                          widget.selected_product_list = widget.product_list;
                        } else {
                          widget.selected_product_list =
                              widget.selected_product_list.where((element) => element.name
                                      .toLowerCase()
                                      .contains(value))
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
