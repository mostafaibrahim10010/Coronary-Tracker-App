import 'dart:async';
import 'package:coronarytracker/Utils/main_variables.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Authentication Screens/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                    "assets/Images/view-anatomic-heart-model-educational-purpose-with-stethoscope.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    HexColor(mainColor).withOpacity(0.9), BlendMode.darken)),
          ),
          child: Image.asset(
            "assets/Images/Capstone Logo - no back.png",
            height: 200,
            width: 200,
          )),
    );
  }
}
