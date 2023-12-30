import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hp/View/home/stackbackgroung.dart';

import 'package:lottie/lottie.dart';

import '../Controller/Addnotescontroller.dart';
import '../Static/Textformfide.dart';
import '../Static/valid.dart';

class Addnotes extends StatelessWidget {
  const Addnotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Addnotescontroller controller = Get.put(Addnotescontroller());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add notes'),
      ),
      body: ListView(
        children: [
          Stackbackgroung(),
          SingleChildScrollView(
            child: Form(
              key: controller.formstate,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      //color: Colors.black,
                      height: Get.height - 650, width: Get.width - 150,
                      child: Lottie.asset(
                        "lot/addnote.json",
                        repeat: false,
                      ),
                    ),
                    Textformfid(
                        a: TextStyle(fontFamily: "CrimsonText"),
                        mycontroller: controller.notes_title,
                        pass: false,
                        valid: (val) {
                          return validInput(val!, 3, 20);
                        },
                        hint: "notes_title",
                        icon2: Icon(Icons.content_copy),
                        name: "notes_title",
                        type: TextInputType.text),
                    Textformfid(
                        a: TextStyle(fontFamily: "CrimsonText"),
                        mycontroller: controller.notes_content,
                        pass: false,
                        valid: (val) {
                          return validInput(val!, 3, 220);
                        },
                        hint: "notes_content",
                        icon2: Icon(Icons.content_copy),
                        name: "notes_content",
                        type: TextInputType.text),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        controller.addnots(3, controller.notes_title.text,
                            controller.notes_content.text);
                      },
                    ),
                  ],
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
