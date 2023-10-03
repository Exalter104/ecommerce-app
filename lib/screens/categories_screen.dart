// ignore_for_file: file_names

import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/services/api_handler.dart';
import 'package:ecommerce_app/widgets/feeds_grid.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ProductsModel> productList = [];
  @override
  void didChangeDependencies() {
    getProducts();
    ApiHandler.getAllProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await ApiHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            return FeedGrid(productList: productList);
          }),
    );
  }
}
