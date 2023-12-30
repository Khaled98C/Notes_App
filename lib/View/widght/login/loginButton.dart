import 'package:flutter/material.dart';

class Loginbutton extends StatelessWidget {
  const Loginbutton({this.onPressed, required this.name});
  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 55,
        width: 200,
        margin: EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [ Color.fromARGB(255, 146, 136, 179),
                Color.fromARGB(255, 95, 85, 128),
                
                Color.fromARGB(255, 63, 53, 95),

              //  Color.fromARGB(255, 146, 136, 179),
              ]),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(49, 40, 79, 1),
                blurStyle: BlurStyle.outer,
                blurRadius: 3.0,
                spreadRadius: 1.5)
          ],
          borderRadius: BorderRadius.all(Radius.circular(60)),

          // Color.fromRGBO(49, 40, 79, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Icon(
                Icons.account_circle_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
            VerticalDivider(color: Colors.white, thickness: 1),
            Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 17, color: Colors.white,fontFamily: "CrimsonText"),
                  textAlign: TextAlign.center,
                  
                )),
          ],
        ),
      ),
    );
  }
}
