import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserWidgets extends StatelessWidget {
  const UserWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: ListTile(
        leading: FancyShimmerImage(
          width: size.width * 0.15,
          height: size.width * 0.15,
          errorWidget: const Icon(
            IconlyBold.danger,
            color: Colors.red,
            size: 28,
          ),
          imageUrl: "https://placeimg.com/640/400/any",
          boxFit: BoxFit.fill,
        ),
        title: const Text(
          "Zarar",
        ),
        subtitle: const Text(
          "Zarar acha larka hai",
        ),
        trailing: const Text("User role"),
      ),
    );
  }
}
