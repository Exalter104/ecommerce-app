// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SaleWidgets extends StatelessWidget {
  const SaleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: [Color(0xFF7A60A5), Color(0xFF82C3DF)],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(
                        0xFF9689CE,
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get the special  discount",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 18),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                "40 %\nOFF",
                                // style: TextStyle(fontSize: 38),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          const Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Image(
                image: AssetImage(
                  "assets/images/sales.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
