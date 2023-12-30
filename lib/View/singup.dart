import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cr_calendar/cr_calendar.dart';
import 'package:hp/View/widght/login/loginButton.dart';
import 'package:http/http.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lottie/lottie.dart';

import '../Controller/Singupcontroller.dart';
import '../Controller/themecontroller.dart';
import '../Static/Textformfide.dart';
import '../Static/valid.dart';

class Singup extends StatefulWidget {
  Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  final width = Get.width;
  Singupcontroller controller2 = Get.put(Singupcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          height: 300,
          child: Stack(
            children: [
              Positioned(
                top: -40,
                width: width,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/one.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                width: width + 30,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/two.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                  child: Center(
                      child: Container(
                child: Lottie.asset("lot/new2.json"),
                height: Get.height,
                width: Get.width - 150,
              )))
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        // Lottie.asset("lot/new2.json"),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller2.formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<changethemee>(
                  builder: (controller) => Textformfid(
                      a: TextStyle(fontFamily: "CrimsonText"),
                      valid: (val) {
                        return validInput(val!, 6, 40);
                      },
                      type: TextInputType.name,
                      hint: "username",
                      icon2: Icon(
                        Icons.person,
                        color: controller.isDark ? Colors.white : Colors.black,
                      ),
                      name: "Username",
                      pass: false,
                      mycontroller: controller2.name_user),
                ),
                GetBuilder<changethemee>(
                  builder: (controller) => Textformfid(
                    a: TextStyle(fontFamily: "CrimsonText"),
                    valid: (val) {
                      return validInput(val!, 6, 40);
                    },
                    type: TextInputType.visiblePassword,
                    mycontroller: controller2.password_user,
                    hint: "password",
                    icon2: Icon(
                      Icons.lock_outlined,
                      color: controller.isDark ? Colors.white : Colors.black,
                    ),
                    name: "pass",
                    pass: true,
                  ),
                ),
                GetBuilder<changethemee>(
                  builder: (controller) => Textformfid(
                      a: TextStyle(fontFamily: "CrimsonText"),
                      valid: (val) {
                        return validemail(val!, 12, 40);
                      },
                      type: TextInputType.emailAddress,
                      pass: false,
                      mycontroller: controller2.email_user,
                      hint: "email",
                      icon2: Icon(
                        Icons.email,
                        color: controller.isDark ? Colors.white : Colors.black,
                      ),
                      name: 'email'),
                ),
                InkWell(
                    child: Container(
                      height: 30,
                      width: Get.width - 200,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "Choose Your Birthday",
                        style: TextStyle(
                            fontFamily: "CrimsonText",
                            fontSize: 20,
                            color: Color(0xff6a448d),
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          initialDatePickerMode: DatePickerMode.year,
                          confirmText: "Save",
                          cancelText: "Cancel",
                          builder: (context, child) => Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Color(0xff6a448d), // <-- SEE HERE
                                    onPrimary: Colors.white, // <-- SEE HERE
                                    onSurface: Colors.black, // <-- SEE HERE
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Color(
                                          0xff6a448d), // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              ),
                          context: context,
                          initialDate: controller2.dateTime,
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));

                      if (newDate == null) return;
                      controller2.dateTime = newDate;
                    }),
                Loginbutton(
                  onPressed: () {
                    controller2.getdatasingup();
                  },
                  name: "Singup",
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
