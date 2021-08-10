import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onbank/constant.dart';
import 'package:onbank/navigation.dart';
import 'package:onbank/screen/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  next() async {
    debugPrint('build');

    await Future.delayed(Duration(milliseconds: 550));
    scheduleMicrotask(() {
      navigate(context, IntroPage());
    });
  }

  @override
  void initState() {
    next();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Hero(
        tag: 'circular_pattern',
        child: Center(
          child: Image.asset(
            'assets/images/circular_pattern_4x.jpg',
            width: deviceSize.width * 0.85,
            height: deviceSize.width * 0.85,
          ),
        ),
      ),
    );
  }
}
