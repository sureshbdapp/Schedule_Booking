import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/provider_examples/ProviderExampleScreen.dart';
import 'package:schedule/provider_examples/ProviderNotifier.dart';
import 'package:schedule/screens/Dashboard.dart';
import 'package:schedule/screens/GoogleLogin.dart';
import 'package:schedule/screens/HomeScreen.dart';
import 'package:schedule/screens/LoginScreen.dart';
import 'package:schedule/screens/ProfileScreen.dart';
import 'package:schedule/screens/SettingScreen.dart';
import 'package:schedule/screens/SplashScreen.dart';
import 'firebase_options.dart';

void main() /*async*/ {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderNotifier())],
      child: const MaterialApp(
          color: Colors.white,
          debugShowCheckedModeBanner: true,
          home: ProviderExampleScreen()),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
