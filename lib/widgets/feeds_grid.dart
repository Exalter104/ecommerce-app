import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height: size.width * 0.45,
                width: size.width * 0.45,
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                  size: 28,
                ),
                imageUrl:
                    "https://images.pexels.com/photos/54300/pexels-photo-54300.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                // boxFit: BoxFit.fill,
              )),
          Align(
            alignment: Alignment.center,
            child: Text("Categories",
                style: TextStyle(
                  backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 116, 27, 27),
                )),
          )
        ],
      ),
    );
  }
}
