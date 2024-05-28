import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _start = 60;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$_start',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
