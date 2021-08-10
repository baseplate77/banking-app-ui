import 'package:flutter/material.dart';
import 'package:onbank/screen/home_page.dart';
import 'package:onbank/screen/intro_page.dart';
import 'package:onbank/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
