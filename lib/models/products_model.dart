import 'package:flutter/foundation.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  num? price; // Change to num
  String? description;
  String? category;
  String? image;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;

    return data;
  }

  static List<ProductsModel> productFromJson(List productJson) {
    if (kDebugMode) {
      print("data ${productJson[0]}");
    }
    return productJson.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
