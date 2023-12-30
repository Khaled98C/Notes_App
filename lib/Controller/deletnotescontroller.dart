import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../remot/Statusrequest.dart';
import '../remot/deletnotestest.dart';
import '../remot/handlingData.dart';

class Deletdatacontroller extends GetxController {
  deletnotesdata deletnote = deletnotesdata(Get.find());
  late StatusRequest statusRequest;
  var notesid = Get.arguments["idnotes"];
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deletnote.getdata(notesid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
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
              "You Delet notes successfully ",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ));
        await Future.delayed(Duration(seconds: 3));
        Get.back();
      } else {
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
              "الملاحظة انحذفت اصلا ",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ));
        await Future.delayed(Duration(seconds: 3));
      }
    } else {
      StatusRequest.Nodata;
    }
    update();
  }

  @override
  void onInit() {}
}
