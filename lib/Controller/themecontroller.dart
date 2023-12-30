import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Theme.dart';


class changethemee extends GetxController {
  var isDark = false;
  final Color black = Colors.black;
 final Color primaryColordark = Color(0xFF31284F).withOpacity(0.9);
  final Color primaryColorligth = Color(0xFF31284F).withOpacity(0.7);
  final Color primaryColorbaclig = Color(0xFFFFFFFF);

  void ligthmode() {
    isDark = false;
    Get.changeTheme(theme().light);
    update();
  }

  void darkmode() {
    isDark = true;
    Get.changeTheme(theme().dark);
    update();
  }
}
