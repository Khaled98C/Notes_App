import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../Controller/Testcontrolles.dart';
import '../Controller/deletnotescontroller.dart';
import '../Controller/editnotescontroller.dart';
import '../Static/Textformfide.dart';
import '../Static/valid.dart';
import 'home/stackbackgroung.dart';

class Editnotes extends StatelessWidget {
  Editnotes({Key? key}) : super(key: key);
  Deletdatacontroller delet = Get.put(Deletdatacontroller());
  @override
  Widget build(BuildContext context) {
    Editnotescontroller controller = Get.put(Editnotescontroller());
    Testcontroller controlernotes=Get.put(Testcontroller());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Edit notes',style: TextStyle(fontFamily: "CrimsonText"),),
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(color: Colors.grey,
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                controller.getdata();
                              },
                            ),
                          ),
                        ),
                         Expanded(
                           child: Container(color: Colors.red,
                                                 //color: Colors.black,
                                                
                                                 width: Get.width - 150,
                                                 child: IconButton(
                            icon: Icon(
                              Icons.delete,
                             
                            ),
                            onPressed: () {
                              delet.getdata();
                            },
                                                 )),
                         ),
                      ],
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
