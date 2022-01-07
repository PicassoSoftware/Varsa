import 'package:FrontendBranchOffice/assets/const.dart';
import 'package:flutter/material.dart';

import 'cart_data_model.dart';

class ProductForCart extends StatelessWidget {
  CartData productForCart;
  ProductForCart(this.productForCart,{Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${productForCart.name}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        "${productForCart.price}₺",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
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
