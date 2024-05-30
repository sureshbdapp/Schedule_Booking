import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule/screens/Dashboard.dart';
import 'package:schedule/screens/HomeScreen.dart';
import 'package:schedule/screens/LoginScreen.dart';
import 'package:schedule/utils/PreferenceManager.dart';
import 'CarouselScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(const Duration(seconds: 3), () {
      if (PreferenceManager.getAccessToken().toString().isEmpty &&
          PreferenceManager.getAccessToken().toString().contains("")) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CarouselScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.png'),
                fit: BoxFit.fill)));
  }
}
