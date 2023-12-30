import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';

import 'package:lottie/lottie.dart';

import '../Server/server.dart';
import '../View/home.dart';
import '../remot/Statusrequest.dart';
import '../remot/handlingData.dart';
import '../remot/logintest.dart';

class LoginControlle extends GetxController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late GlobalKey<FormState> formstate;
  late TextEditingController name_user;

  late TextEditingController password_user;

  getdatalogin() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.getdata(name_user.text, password_user.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPref
              .setString("id", response['user']['id_user'].toString());
          myServices.sharedPref
              .setString("name", response['user']['name_user']);
          successlogin();
          await Future.delayed(Duration(seconds: 3));
          Get.offAll(() => Main());
        } else if (response['status'] == "fail") {
          faildlogin();
        }
      }
      update();
    }
  }

  faildlogin() {
    Get.snackbar(" ", " ",
        forwardAnimationCurve: Curves.easeInOutExpo,
        margin: EdgeInsets.all(20),
        borderRadius: 20,
        backgroundColor: Colors.amber,
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(0, 236, 220, 237),
            Color(0xFFC385C7),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadows: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(10, 10))
        ],
        icon: Lottie.asset("lot/false.json"),
        duration: Duration(seconds: 5),
        messageText: Text(
          "This Account does not exist or the password is incorrect",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  successlogin() {
    Get.snackbar(" ", " ",
        forwardAnimationCurve: Curves.easeInOutExpo,
        margin: EdgeInsets.all(20),
        borderRadius: 20,
        backgroundColor: Colors.amber,
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(0, 236, 220, 237),
            Color(0xFFC385C7),
            //  Colors.white54
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadows: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(10, 10))
        ],
        icon: Lottie.asset("lot/t.json"),
        duration: Duration(seconds: 3),
        messageText: Text(
          "You are logged in successfully ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  @override
  void onInit() {
    name_user = TextEditingController();
    password_user = TextEditingController();
    formstate = GlobalKey<FormState>();
    getdatalogin();
    super.onInit();
  }
}
