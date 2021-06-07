import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: creameColor,
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
      );

  static ThemeData darkTheme() => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
      );

  static Color creameColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color(0xFF6366F1);
}
