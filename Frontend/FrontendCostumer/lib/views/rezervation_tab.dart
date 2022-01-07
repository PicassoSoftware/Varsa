import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui/assets/const.dart';
import 'package:ui/models/rezerv_data_model.dart';
import 'package:ui/widgets/product_for_cart.dart';
import 'package:ui/widgets/product_for_rezervation.dart';

class RezervationTab extends StatefulWidget {
  List<RezervData> data;
  RezervationTab(this.data, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RezervationTabState();
  }
}

class _RezervationTabState extends State<RezervationTab> {
  @override
  Widget build(BuildContext context) {
    Widget cartContent = const Center(child: Text("Hiç bir şey ayırtılmamış."));

    double toplam = 0;

    if (widget.data.isNotEmpty) {
      cartContent = ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductForRezerv(productForCart: widget.data[index]);
          });
    }
    // TODO: implement build
    return Container(color: kBackgroundColor,child: cartContent);
  }
}
