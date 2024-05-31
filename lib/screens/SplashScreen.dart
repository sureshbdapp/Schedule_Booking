import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule/screens/Dashboard.dart';
import 'package:schedule/screens/HomeScreen.dart';
import 'package:schedule/screens/LoginScreen.dart';
import 'package:schedule/utils/Constant.dart';
import 'package:schedule/utils/PreferenceManager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/Pref.dart';
import 'CarouselScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var token;
  Pref pref = Pref();
  PreferenceManager preferenceManager = PreferenceManager();
  @override
  void initState() {
    super.initState();
    _token();
  }

  Future<void> _token() async {
    access_token = await preferenceManager.getAccessToken();
    Timer(const Duration(seconds: 3), () {
      if (access_token != "") {
        if (kDebugMode) {
          print("TOKENN  $access_token");
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        if (kDebugMode) {
          print("TOKEN${access_token}");
        }
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
