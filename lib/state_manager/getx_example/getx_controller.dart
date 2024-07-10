import 'package:get/get.dart';

class ControllerGetX extends GetxController {
  var inputValue = 1.0.obs;
  increment() {
    inputValue.obs;
  }

  setProgressValue(double value) {
    inputValue.value = value;
    // print("HHHH${inputValue.value}");
  }
}
