import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/state_manager/provider_examples/ProviderExampleScreen.dart';
import 'package:schedule/state_manager/provider_examples/ProviderNotifier.dart';

void main() /*async*/ {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const ProviderMyApp());
}

class ProviderMyApp extends StatelessWidget {
  const ProviderMyApp({super.key});

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
