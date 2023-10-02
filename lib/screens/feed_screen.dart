import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/widgets/feeds_widgets.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key, required this.productList});
  final List<ProductsModel> productList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 0,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return FeedWidgets(
              imageUrl: productList[index].images![0],
              title: productList[index].title![0],
            );
          }),
    );
  }
}
