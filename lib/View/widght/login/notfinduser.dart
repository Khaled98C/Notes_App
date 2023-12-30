import 'package:flutter/material.dart';

import 'package:get/get.dart';
class Notfinduser extends StatelessWidget {
  const Notfinduser({Key? key, required this.title,required this.onTap}) : super(key: key);
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Text(
        title,
        style: TextStyle(
            fontFamily: "Amiri",
            color: Color.fromARGB(255, 131, 118, 175),
            fontWeight: FontWeight.w200,
            fontSize: 24),
      )),
    );
  }
}
