import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/assets/const.dart';
import 'package:ui/models/product_details_model.dart';
import 'package:ui/models/productforcardmodel.dart';
import 'package:ui/views/product_details.dart';
import 'package:http/http.dart' as http;

class ProductForStore extends StatelessWidget {
  Product product;
  Function changePage;

  ProductForStore(this.changePage, this.product, {Key? key}) : super(key: key);

  Future<ProductDetail> fetchProductDetail(int id) async {
    dynamic response;

    response = await http.get(Uri.parse('http://10.0.2.2:5001/product/$id'));
    if (response.statusCode == 200) {
      return ProductDetail.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FutureBuilder<ProductDetail>(
              future: fetchProductDetail(product.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ProductDetails(changePage, snapshot.data!)
                    : Container(
                      color: kBackgroundColor,
                      child: Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        )),
                    );
              }),
        ),
      ),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Card(
          elevation: 5,
          color: kBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.8,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(product.photo),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    //textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontFamily: "Lato"),
                      ),
                    ],
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    //textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Stock:${product.stock}",
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Son '),
                            TextSpan(
                              text: product.daysForExpiration.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const TextSpan(text: ' gün'),
                          ],
                        ),
                      ),
                      Text(
                        "${product.price}₺",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
