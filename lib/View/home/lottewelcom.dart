import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Lottewelcom extends StatelessWidget {
  const Lottewelcom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Lottie.asset("lot/welcome.json"),
      height: Get.height - 190,
      width: Get.width - 100,
    ));
  }
}
