
import 'package:hp/View/widght/login/loginButton.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/logincontroller.dart';
import '../Controller/themecontroller.dart';
import '../Static/Textformfide.dart';
import '../Static/valid.dart';




class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  changethemee controller = Get.put(changethemee());
  final width = Get.width;
  @override
  Widget build(BuildContext context) {
    LoginControlle con = Get.put(LoginControlle());
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
                Center(
                    child: Container(
                  child: Lottie.asset("lot/new1.json",repeat: false),
                  height: Get.height - 190,
                  width: Get.width - 100,
                ))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(100, 80),
                  bottomRight: Radius.elliptical(100, 80)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: con.formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<changethemee>(
                      builder: (controller) => Textformfid(
                        mycontroller: con.name_user,
                        pass: false,
                        valid: (val) {
                          return validInput(val!, 3, 20);
                        },
                        a: TextStyle(fontFamily: "CrimsonText"),
                        hint: "Username",
                        icon2: Icon(
                          Icons.person,
                          color:
                              controller.isDark ? Colors.white : Colors.black,
                        ),
                        name: "Username",
                        type: TextInputType.text,
                      ),
                    ),
                    GetBuilder<changethemee>(
                      builder: (controller) => Textformfid(
                        a: TextStyle(fontFamily: "CrimsonText"),
                        valid: (val) {
                          return validInput(val!, 3, 20);
                        },
                        mycontroller: con.password_user,
                        hint: "password",
                        pass: true,
                        icon2: Icon(
                          Icons.lock_outlined,
                          color:
                              controller.isDark ? Colors.white : Colors.black,
                        ),
                        name: "pass",
                        type: TextInputType.visiblePassword,
                      ),
                    ),
                    Loginbutton(
                        onPressed: () {
                          con.getdatalogin();
                        },
                        name: "Login"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
