import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/themecontroller.dart';
import '../Server/server.dart';

class Changetheme extends StatefulWidget {
  Changetheme() : super();

  changethemee controller = Get.put(changethemee(), permanent: true);

  @override
  _ChangethemeState createState() => _ChangethemeState();
}

class _ChangethemeState extends State<Changetheme> {
  final primarycolorligth = const Color(0xffd8e0ed);
  final primarycolordark = const Color(0xff2e3243);

  // final positionShadow =.isDark ? -40.0 : -210.0;
  MyServices myserver = Get.find();
  Widget dayNight() {
    return GetBuilder<changethemee>(
        builder: ((controller) => Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: controller.isDark
                            ? [
                                Color(0XFF30218f),
                                Color(0XFF8d81dd),
                              ]
                            : [
                                Color(0XFFFFCC81),
                                Color(0XFFFF6E30),
                                Colors.yellow,
                              ]),
                  ),
                ),
                AnimatedPositioned(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isDark
                            ? primarycolordark
                            : primarycolorligth,
                      ),
                    ),
                    top: controller.isDark ? -40 : -210,
                    right: controller.isDark ? -40 : -210,
                    duration: Duration(milliseconds: 200))
              ],
            )));
  }

  Widget centertext() {
    return GetBuilder<changethemee>(
        builder: ((controller) => Text(
            controller.isDark ? "Good\nNight" : "Good\nMorining",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "CrimsonText",
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: controller.isDark
                    ? primarycolorligth
                    : primarycolordark))));
  }

  Widget powerButoon() {
    return GetBuilder<changethemee>(
        builder: ((controller) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.isDark ? primarycolordark : primarycolorligth,
              boxShadow: [
                BoxShadow(
                    offset: Offset(-10, 10),
                    blurRadius: 10,
                    color: controller.isDark ? Color(0xff121625) : Colors.white,
                    inset: false),
              ],
            ),
            child: IconButton(
              onPressed: () {
                setState(
                  () {
                    if (Get.isDarkMode) {
                      controller.ligthmode();
                      
                myserver.sharedPref.setString("mode1", "Get.isligtMode ");
                    } else {
                      controller.darkmode();
                      
                myserver.sharedPref.setString("mode2", "Get.isDarkMode ");
                    }
                  },
                );
              },
              icon: Icon(
                Icons.power_settings_new,
                size: 40,
                color: controller.isDark ? primarycolorligth : primarycolordark,
              ),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<changethemee>(
        builder: ((controller) => Scaffold(
              backgroundColor:
                  controller.isDark ? primarycolordark : primarycolorligth,
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        dayNight(),
                        SizedBox(
                          height: 30,
                        ),
                        centertext(),
                        SizedBox(
                          height: 10,
                        ),
                        powerButoon(),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
