import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/state_manager/getx_example/getx_example_ui.dart';

void main() {
  runApp(GetXMainHome());
}

class GetXMainHome extends StatefulWidget {
  const GetXMainHome({super.key});

  @override
  State<GetXMainHome> createState() => _GetXMainHomeState();
}

class _GetXMainHomeState extends State<GetXMainHome> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetXExampleUi(),
    );
  }
}
