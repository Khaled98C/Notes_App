import 'package:flutter/material.dart';
import 'package:get/get.dart';


class theme {
  final ThemeData dark = ThemeData.dark().copyWith(
    hintColor: Color(0xFF9E9E9E),
    
    appBarTheme: AppBarTheme(
      color: Color(0xffc385c7),
   //color: Color(0xff3e2b64),
    elevation: 0.0,
    centerTitle: true
    ),
    primaryColor: Color(0xFF31284F),
    scaffoldBackgroundColor: Color(0xFF31284F).withOpacity(0.4),
  );
  final ThemeData light = ThemeData.light().copyWith(
   
    primaryColor: Color(0xFF31284F),
    scaffoldBackgroundColor: Color.fromARGB(255, 248, 249, 249),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(headline1: TextStyle(fontFamily: "CrimsonText")),
  
     color: Color(0xffc385c7),
     elevation: 0.0,
     centerTitle: true
    ),
  );
}
