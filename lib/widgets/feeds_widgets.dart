import 'package:ecommerce_app/consts/global_colors.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/product_Detaile_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FeedWidgets extends StatelessWidget {
  const FeedWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductsModel productsModelProvider =
        Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: const ProductDetaileScreen()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: "\$",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${productsModelProvider.price}",
                                  style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.w600))
                            ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  imageUrl: productsModelProvider.image!,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(productsModelProvider.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
