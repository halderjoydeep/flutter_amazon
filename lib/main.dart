import 'package:flutter/material.dart';
import 'package:flutter_amazon/screens/home_screen.dart';
import 'package:flutter_amazon/screens/login_screen.dart';
import 'package:flutter_amazon/utils/routes.dart';
import 'package:flutter_amazon/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
      },
    );
  }
}
