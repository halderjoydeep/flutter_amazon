import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: creameColor,
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          textTheme: Theme.of(context).textTheme,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        canvasColor: Colors.black,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
      );

  static Color creameColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color(0xFF6366F1);
}
