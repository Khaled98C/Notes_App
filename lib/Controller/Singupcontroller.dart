import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../Server/server.dart';
import '../View/home.dart';
import '../remot/Statusrequest.dart';
import '../remot/handlingData.dart';
import '../remot/singuptest.dart';

class Singupcontroller extends GetxController {
  SingupData singup = SingupData(Get.find());
  MyServices myServices = Get.find();
  late List id = [];
  late StatusRequest statusRequest;
  late GlobalKey<FormState> formstate;
  late TextEditingController name_user;
  late TextEditingController email_user;
  late TextEditingController password_user;
  late DateTime dateTime;
  getdatasingup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await singup.getdata(
          name_user.text, password_user.text, email_user.text, dateTime);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "failed") {
          faildsingup();
        } else if (response['status'] == "success") {
           myServices.sharedPref
              .setString("id", response['user']['id_user'].toString());
          myServices.sharedPref
              .setString("name", response['user']['name_user']);
          // myServices.sharedPref.setString("iduser",);
          successsingup();
          await Future.delayed(Duration(seconds: 3));
          Get.offAll(() => Main());
        } else {
          print("singupfail");
        }
      }
      update();
    }
  }

  successsingup() {
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
          "Account successfully created ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  faildsingup() {
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
          "This Account exist ",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    name_user = TextEditingController();
    email_user = TextEditingController();
    password_user = TextEditingController();
    dateTime = DateTime.now();
    getdatasingup();
    super.onInit();
  }
}
