import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coronarytracker/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Authentication Screens/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    title: "CUCS",
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
