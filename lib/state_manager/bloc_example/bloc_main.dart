import 'package:flutter/material.dart';
import 'package:schedule/state_manager/bloc_example/bloc_screen_example.dart';

void main() {
  runApp(BlocHome());
}

class BlocHome extends StatefulWidget {
  const BlocHome({super.key});

  @override
  State<BlocHome> createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlockExampleScreen(),
    );
  }
}
