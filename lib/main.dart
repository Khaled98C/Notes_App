import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/binding.dart';
import 'Model/midellware.dart';
import 'Server/server.dart';
import 'View/ChessTest.dart';
import 'View/botombar.dart';
import 'View/changetheme.dart';
import 'View/home.dart';
import 'View/login.dart';
import 'View/singup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(color: Color(0xffc385c7), centerTitle: true),
          fontFamily: "CrimsonText"),
      //ThemeData.light(),
      getPages: [
        //GetPage(name: "/", page: () => Test()),
       GetPage(name: "/", page: () => Main()),
      // GetPage(name: "/", page: () =>  ChessTest()),
        GetPage(
            name: "/ba",
            page: () => Bottomnav(),
            middlewares: [AuthMiddleware()]),
        GetPage(name: "/changetheme", page: () => Changetheme()),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/singup", page: () => Singup()),
      ],
    );
    //MaterialApp
  }
}
