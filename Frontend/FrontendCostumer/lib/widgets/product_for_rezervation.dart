import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/models/cart_data_model.dart';
import 'package:ui/models/rezerv_data_model.dart';

class ProductForRezerv extends StatelessWidget {
  RezervData productForCart;
  ProductForRezerv({required this.productForCart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            productForCart.photo,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Doğrulama Kodu: ${productForCart.code}",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 100,
                    height: 80,
                    child: Center(
                      child: Text(
                        "Kalan Süre: ${productForCart.lastdate} Dakika",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
