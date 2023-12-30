import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/themecontroller.dart';

class Textformfid extends StatelessWidget {
  final String? hint;
  final Widget? icon2;
  final String? name;
  final TextInputType? type;
  final TextEditingController mycontroller;
  final bool pass;
  final TextStyle a;
  final String? Function(String?) valid;
  const Textformfid(
      {Key? key,
      this.hint,
      this.icon2,
      this.name,
      required this.mycontroller,
      this.type,
      required this.pass,
      required this.valid,
      required this.a})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<changethemee>(builder: (controller) => 
       Container(
        margin: EdgeInsets.all(5),
        child: TextFormField
        (
          toolbarOptions:ToolbarOptions(copy: true,paste: true) ,autovalidateMode:AutovalidateMode.onUserInteraction ,
          validator: valid,
          obscureText: pass,
          keyboardType: type,
          controller: mycontroller,
   textAlign: TextAlign.center,
   cursorColor: Color.fromRGBO(49, 40, 79, 1), 
   cursorRadius: Radius.circular(10),
   cursorWidth: 4,
          decoration: InputDecoration( 
             filled: true, //<-- SEE HERE
             
             
      fillColor:controller.isDark?Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1):Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
       //Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
              hintText: hint,
              labelText: name,
              prefixIcon: icon2,
              border: OutlineInputBorder(
              
                  borderRadius: BorderRadius.only(
                    
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
