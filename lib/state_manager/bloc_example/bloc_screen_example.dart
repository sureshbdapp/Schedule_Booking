import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BlockExampleScreen extends StatefulWidget {
  const BlockExampleScreen({super.key});

  @override
  State<BlockExampleScreen> createState() => _BlockExampleScreenState();
}

class _BlockExampleScreenState extends State<BlockExampleScreen> {
  @override
  Widget build(BuildContext context) {
    print("hello11");
    return Center(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Obx(() {
          //   return Slider(
          //       value: controllerGetX.inputValue.value,
          //       max: 1,
          //       min: 0,
          //       onChanged: (value) {
          //         controllerGetX.setProgressValue(value);
          //         print(value);
          //       });
          // }),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Obx(() {
              return Row(
                  // children: [
                  //   Expanded(
                  //       child: Container(
                  //     height: 100,
                  //     color: Colors.blue
                  //         .withOpacity(controllerGetX.inputValue.value),
                  //   )),
                  //   Expanded(
                  //       child: Container(
                  //     height: 100,
                  //     color: Colors.orange
                  //         .withOpacity(controllerGetX.inputValue.value),
                  //   ))
                  // ],
                  );
            }),
          )
        ],
      ),
    ));
  }
}
