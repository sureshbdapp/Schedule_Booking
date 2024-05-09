import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // var controller =
    //     AnimationController(duration: Duration(milliseconds: 0), vsync: this);

    // animation = Tween(begin: 1.0, end: 0.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       _progress = animation.value;
    //     });
    //   });

    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LinePainter(_progress));
  }
}

class LinePainter extends CustomPainter {
  Paint _paint;
  double _progress;
  LinePainter(this._progress) : _paint = Paint() {
    _paint
      ..color = Colors.green
      ..strokeWidth = 60.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, 0.0),
        Offset(
            size.width - size.width * _progress, size.height - 50 * _progress),
        _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}
