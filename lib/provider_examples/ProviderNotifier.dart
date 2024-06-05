import 'package:flutter/cupertino.dart';

class ProviderNotifier with ChangeNotifier {
  double progressValue = 1.0;
  double get controlValue => progressValue;
  void setProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }
}
