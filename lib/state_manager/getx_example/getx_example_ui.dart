import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:schedule/state_manager/getx_example/getx_controller.dart';

class GetXExampleUi extends StatefulWidget {
  const GetXExampleUi({super.key});

  @override
  State<GetXExampleUi> createState() => _GetXExampleUiState();
}

class _GetXExampleUiState extends State<GetXExampleUi> {
  final ControllerGetX controllerGetX = Get.put(ControllerGetX());
  @override
  Widget build(BuildContext context) {
    print("hello11");
    return Center(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return Slider(
                value: controllerGetX.inputValue.value,
                max: 1,
                min: 0,
                onChanged: (value) {
                  controllerGetX.setProgressValue(value);
                  print(value);
                });
          }),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Obx(() {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.blue
                        .withOpacity(controllerGetX.inputValue.value),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.orange
                        .withOpacity(controllerGetX.inputValue.value),
                  ))
                ],
              );
            }),
          )
        ],
      ),
    ));
  }
}
