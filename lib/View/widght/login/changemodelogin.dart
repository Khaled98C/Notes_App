import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/themecontroller.dart';
import '../../changetheme.dart';

class changethemelogin extends StatelessWidget {
  changethemelogin();

  changethemee controller = Get.put(changethemee());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => Changetheme()),
      child: Container(
        height: 50,
        width: 70,
        margin: EdgeInsets.only(bottom: 10, top: 10),
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<changethemee>(builder:(controller) => 
               Icon(
                controller.isDark?Icons.mode_night_rounded:Icons.sunny,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
