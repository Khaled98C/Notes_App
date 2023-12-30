import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Server/server.dart';
import '../remot/Statusrequest.dart';
import '../remot/editnotestest.dart';
import '../remot/handlingData.dart';

class Editnotescontroller extends GetxController {
  Editnotesdata addnote = Editnotesdata(Get.find());
  late TextEditingController notes_title;
  late TextEditingController notes_content;
  late StatusRequest statusRequest;

  var notesid = Get.arguments["idnotes"];
  late GlobalKey<FormState> formstate;
  MyServices myserives = Get.find();
  @override
  void onInit() {
    notes_content = TextEditingController();
    notes_title = TextEditingController();
    formstate = GlobalKey<FormState>();

    notesid = Get.arguments["idnotes"];

    getdata();
    super.onInit();
  }

  getdata() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addnote.getdata(
          notes_title.text, notes_content.text, notesid.toString());
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
                "You Edit notes successfully ",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ));
          await Future.delayed(Duration(seconds: 3));
          Get.back();
        }
      } else {
        StatusRequest.Nodata;
      }
      update();
    }
  }
}
