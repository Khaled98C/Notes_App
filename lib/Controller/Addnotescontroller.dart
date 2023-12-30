import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hp/Controller/Testcontrolles.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Server/server.dart';
import '../remot/Statusrequest.dart';
import '../remot/addnotestest.dart';
import '../remot/handlingData.dart';

class Addnotescontroller extends GetxController {
  Addnotedata addnote = Addnotedata(Get.find());
  late TextEditingController notes_title;
  late TextEditingController notes_content;
  late StatusRequest statusRequest;
  late var notes_user;
  late GlobalKey<FormState> formstate;
  MyServices myserives = Get.find();
  getdata() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addnote.getdata(notes_title.text, notes_content.text,
          myserives.sharedPref.getString("id").toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar(" ", " ",
              forwardAnimationCurve: Curves.easeInOutExpo,
              margin: EdgeInsets.all(20),
              borderRadius: 20,
              backgroundColor: Colors.amber,
              backgroundGradient: const LinearGradient(
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
                    offset: const Offset(10, 10))
              ],
              icon: Lottie.asset("lot/t.json"),
              duration: const Duration(seconds: 3),
              messageText: const Text(
                "You Add notes successfully ",
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

  late List<Notes> notesdata;
  addnots(int id, String name, String content) {
    notesdata.add(Notes(id: id, name: name, content: content));
    print("the add ok${notesdata.length}");
    Get.back();
  }

  @override
  void onInit() {
    notesdata = Get.arguments['notes'];
    notes_content = TextEditingController();
    notes_title = TextEditingController();
    formstate = GlobalKey<FormState>();

    getdata();
    super.onInit();
  }
}
