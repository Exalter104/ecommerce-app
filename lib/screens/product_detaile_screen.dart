import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_app/consts/global_colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetaileScreen extends StatefulWidget {
  const ProductDetaileScreen({super.key});

  @override
  State<ProductDetaileScreen> createState() => _ProductDetaileScreenState();
}

class _ProductDetaileScreenState extends State<ProductDetaileScreen> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 3,
                          child: Text(
                            "Corn Plus",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      Flexible(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: "\$",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " 160.00",
                                    style: TextStyle(
                                        color: lightTextColor,
                                        fontWeight: FontWeight.w600))
                              ]),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Swiper(
                itemCount: 3,
                autoplay: true,
                curve: Curves.ease.flipped,
                itemBuilder: (context, index) {
                  return FancyShimmerImage(
                    height: size.height * 0.2,
                    width: double.infinity,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl:
                        "https://images.pexels.com/photos/54300/pexels-photo-54300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    boxFit: BoxFit.fill,
                  );
                },
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.redAccent,
                    )),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.start,
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
