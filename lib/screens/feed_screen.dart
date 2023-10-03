import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/services/api_handler.dart';
import 'package:ecommerce_app/widgets/feeds_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ProductsModel> productList = [];
  @override
  void didChangeDependencies() {
    getProducts();

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
        title: const Text("All Products"),
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: productList[index], child: const FeedWidgets());
              }),
    );
  }
}
