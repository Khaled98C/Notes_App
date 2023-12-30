import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hp/View/singup.dart';


import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Controller/themecontroller.dart';
import 'login.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({
    Key? key,
  }) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  changethemee controller = Get.put(changethemee());
  List<Widget> A = [
    login(),
    Singup(),
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: A.elementAt(currentindex),
        bottomNavigationBar: GetBuilder<changethemee>(
            builder: (controller) => Container(
                  color: Color.fromARGB(255, 246, 244, 250),
                  child: SalomonBottomBar(
                    selectedColorOpacity: 0.2,
                    items: [
                      /// Home
                      SalomonBottomBarItem(
                        icon: Icon(Icons.person),
                        title: Text(
                          "Login",
                          style: TextStyle(fontFamily: "CrimsonText"),
                        ),
                      ),

                      /// Likes
                      SalomonBottomBarItem(
                        icon: Icon(Icons.person_add),
                        title: Text(
                          "SingUp",
                          style: TextStyle(fontFamily: "CrimsonText"),
                        ),
                      ),
                    ],
                    currentIndex: currentindex,
                    onTap: (i) => setState(() => currentindex = i),
                    selectedItemColor: Color(0xffa53ff9),
                    curve: Curves.decelerate,
                    unselectedItemColor: Colors.black,
                  ),
                )));
  }
}
