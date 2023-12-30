import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lottewelcom.dart';


class Stackbackgroung extends StatelessWidget {
  const Stackbackgroung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: -40,
            width: width,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/one.png"), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            width: width + 30,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/two.png"), fit: BoxFit.fill)),
            ),
          ),
       const   Lottewelcom(),
        ],
      ),
    );
  }
}
