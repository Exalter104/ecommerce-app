import 'package:flutter/foundation.dart';

class CategoryModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  CategoryModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
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

  static List<CategoryModel> productFromJson(List productJson) {
    if (kDebugMode) {
      print("data ${productJson[0]}");
    }
    return productJson.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
