import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../Models/product.dart';

class ProductsProvider{
  static List<Product> products = [];

  Future<void> getProducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var respons = await http.get(url);
    List<dynamic> jsonResponse = [];
    jsonResponse = convert.jsonDecode(respons.body);
    if (jsonResponse.isNotEmpty) {
      for (int i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i] != null) {
          var prd = Product(
              id: jsonResponse[i]['id'].toString(),
              title: jsonResponse[i]['title'],
              description: jsonResponse[i]['description'],
              category: jsonResponse[i]['category'],
              price: double.parse(jsonResponse[i]['price'].toString()),
              image: jsonResponse[i]['image']);
          products.add(prd);
        }
      }
    }
  }
}
