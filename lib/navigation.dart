import 'package:flutter/material.dart';

void navigate(BuildContext context, Widget screen) {
  Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Opacity(opacity: animation.value, child: child);
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return screen;
        },
      ));
}
