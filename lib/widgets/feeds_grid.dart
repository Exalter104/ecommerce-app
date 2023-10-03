import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/widgets/feeds_widgets.dart';
import 'package:flutter/material.dart';

class FeedGrid extends StatelessWidget {
  const FeedGrid({Key? key, required this.productList}) : super(key: key);
  final List<ProductsModel> productList;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return productList.isEmpty
              ? Container()
              : FeedWidgets(
                  imageUrl: productList[index].image.toString(),
                  title: productList[index].title!,
                );
        });
  }
}
