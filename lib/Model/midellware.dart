import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Server/server.dart';


class AuthMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString('id') != null)
      return RouteSettings(name: "/main");
         if (myServices.sharedPref.getString('name') != null)
      return RouteSettings(name: "/main");
  }
  
}
