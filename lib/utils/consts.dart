import 'package:flutter/material.dart';

//String uri = "";  Globally defined Url for backend
class AppConstants {
//Colors
  static const Color bgColor = Color(0xff1C1F26);
  static const Color primaryColor = Colors.greenAccent;
  static const Color textColor = Color(0xff074883);

  static List<Color> tileColors = [
    Colors.greenAccent,
    Color(0xffffdc6c),
    Color(0xff20ccbc),
    Color(0xffff4c4c),
    Color(0xff688cfc)
  ];
  static List<Color> tileTextColors = [
    Colors.green,
    Colors.black,
    Colors.purple,
    Colors.orange,
    Colors.yellow
  ];
//Gradients

  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ]);
  //double height = MediaQuery.of(context).size.height;

  static TextStyle headerTextStyle =
      TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle smallTextStyle =
      TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold);
}
