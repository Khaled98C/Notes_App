import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../Controller/Testcontrolles.dart';
import '../../Model/Notes model.dart';
import 'cardnotes.dart';

class Contentnotes extends GetView<Testcontroller> {
  Contentnotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Testcontroller>(
      builder: (controller) => ClipPath(
        clipper: OvalTopBorderClipper(),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffc385c7),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          height: Get.height - 400,
          child: Padding(
            padding: const EdgeInsets.only(top: 55, left: 10),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: controller.notesdata.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      controller.gotoeditnotes(
                          controller.notes[index]['notes_id'].toString());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      // width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: ListTile(
                        isThreeLine: true,
                        leading: const Icon(Icons.note_sharp),
                        title: Text(
                          controller.notesdata[index].content,
                          style: const TextStyle(fontFamily: "CrimsonText"),
                        ),
                        subtitle: Container(
                            child: Text(
                          controller.notesdata[index].name,
                          style: const TextStyle(fontFamily: "CrimsonText"),
                        )),
                        // trailing: IconButton(icon: Icon(Icons.delete),onPressed: onPresseddelet),
                      ),
                      /* Container(
              alignment: Alignment.center,
              child: Text(" ${notemodel.notesContent}",
                  style: TextStyle(fontFamily: "CrimsonText"),
                  textAlign: TextAlign.center)),*/
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
