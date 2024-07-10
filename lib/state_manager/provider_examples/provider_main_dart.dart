import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/state_manager/provider_examples/ProviderExampleScreen.dart';
import 'package:schedule/state_manager/provider_examples/ProviderNotifier.dart';

void main() {
  runApp(ProviderHome());
}

class ProviderHome extends StatefulWidget {
  const ProviderHome({super.key});

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderNotifier())],
      child: MaterialApp(
        home: ProviderExampleScreen(),
      ),
    );
  }
}
