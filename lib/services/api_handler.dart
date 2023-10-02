import 'dart:convert';

import 'package:ecommerce_app/consts/api_url.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(baseUrl, "api/v1/products");
    var response = await http.get(uri);

    var data = jsonDecode(response.body);
    List tempList = [];
    for (var item in data) {
      tempList.add(item);
    }
    return ProductsModel.productFromJson(tempList);
  }
}
