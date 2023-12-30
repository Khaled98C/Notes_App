// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Server/server.dart';
import '../View/Editnotes.dart';
import '../View/addnotes.dart';
import '../View/botombar.dart';
import '../View/home.dart';
import '../remot/Statusrequest.dart';
import '../remot/Testdataapi.dart';
import '../remot/handlingData.dart';

class Testcontroller extends GetxController {
Future <void> onRefres() async {
   getnewnotes() {
      return notesdata;
    }
  return await Future.delayed(Duration(milliseconds: 100));
  
}
  List<Notes> notesdata = [
    Notes(id: 1, content: "hello", name: "onenotes"),
    Notes(id: 2, name: "csv", content: "content")
  ];
  Testdata testdata = Testdata(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  late List data = [];
  late List notes = [];
  MyServices mServices = Get.find();
  // getdata() async {
  //   notes.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await testdata
  //       .getdata(myServices.sharedPref.getString("id").toString());
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       notes.addAll(response['notes']);
  //       update();
  //     } else {
  //       statusRequest = StatusRequest.Nodata;
  //     }
  //   }
  //   update();
  // }

  logout() {
    myServices.sharedPref.remove("id");
    myServices.sharedPref.remove("name");
    Get.to(() => Bottomnav());
    update();
  }

  gotoaddnotes(List notesdata) {
    Get.to(() => Addnotes(), arguments: {'notes': notesdata});
  }

  gotoeditnotes(idnotes) {
    Get.to(() => Editnotes(), arguments: {
      "idnotes": idnotes,
    });
  }

  String? username;
  getnewnotes() {
    return notesdata;
  }

  @override
  void onInit() {
    username = mServices.sharedPref.getString("name");
    
    if (username == null) {
      username = 'khaled';
    }
   

    //getdata();
    super.onInit();
  }

  deletnote(notes) {
    Get.to(() => Main(), arguments: {
      "noteslist": notes,
    });
  }
}

class Notes {
  int id;
  String name;
  String content;
  Notes({
    required this.id,
    required this.name,
    required this.content,
  });
}
