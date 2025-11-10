import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenViewModel {
  void startSplashScreenTimer(BuildContext context, String routeName) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, routeName);
      }
    });
  }
}
