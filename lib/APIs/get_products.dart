import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../Models/product.dart';

class ProductsProvider {
  Future<void> getProducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var respons = await http.get(url);
    var jsonResponse = convert.jsonDecode(respons.body);
    print(jsonResponse);
  }
}
