import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onbank/constant.dart';
import 'package:onbank/screen/home_page.dart';

import '../navigation.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SizedBox(
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "circular_pattern",
                child: Image.asset(
                  "assets/images/circular_pattern_4x.jpg",
                  // fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              Text(
                "Banking App That",
                style: kText32,
              ),
              Text(
                "Help You Every Day",
                style: kText32.copyWith(
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  navigate(context, HomePage());
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: secondaryColor,
                  onPrimary: mainColor,
                ),
                child: Icon(Icons.arrow_forward_rounded),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
