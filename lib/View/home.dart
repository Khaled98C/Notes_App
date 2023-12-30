import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hp/View/widght/login/changemodelogin.dart';
import 'package:hp/remot/Statusrequest.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:custom_floating_action_button/custom_floating_action_button.dart';


import '../Controller/Testcontrolles.dart';
import '../Controller/themecontroller.dart';
import 'addnotes.dart';
import 'handilinddataview.dart';
import 'home/contentnotes.dart';
import 'home/stackbackgroung.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final width = Get.width;
  @override
  @override
  Widget build(BuildContext context) {
    changethemee contr = Get.put(changethemee());
    Testcontroller controller = Get.put(Testcontroller());

    return Scaffold(floatingActionButton: Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffc385c7).withOpacity(0.4),
          ),
          child: IconButton(
            alignment: Alignment.center,
            icon: Icon(
              Icons.add,
              size: 35,
              color: Color.fromARGB(255, 249, 247, 247),
            ),
            onPressed: () {
              controller.gotoaddnotes(controller.notesdata);
            },
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // controller.getdata();
              controller.onInit();
            },
          ),
          actions: [
            changethemelogin(),
          ],

          title: GetBuilder<changethemee>(
            builder: (controller) => Text(
              "Home Notes",
              style: TextStyle(fontFamily: "CrimsonText"),
            ),
          ),

          // backgroundColor: contr.isDark?Color(0xff3e2b64):Color(0xffc385c7),
          elevation: 0.0,
        ),
      body:  LiquidPullToRefresh(
        onRefresh:controller.onRefres,
        height: 150,
        animSpeedFactor: 2,
        backgroundColor: Colors.deepPurple,
        color: Colors.pink,
        borderWidth: 2,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 1500,
        child: ListView(
         children: [ 
          HandilingdataView(
                statusRequest: StatusRequest.success,
                widget: Container(
                  width: width,
                  child: ListView(shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Stackbackgroung(),
                      Center(
                          child: Text(
                        "All Notes to ${controller.username}",
                        style:
                            TextStyle(fontFamily: "CrimsonText", fontSize: 20),
                      )),
                      Contentnotes(),
                    ],
                  ),
                )),
         ],
        ),
      ),);}}
       