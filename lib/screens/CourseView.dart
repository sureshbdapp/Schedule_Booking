import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Stack(
          children: [
            SizedBox(
              height: 60,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 85,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                  maxRadius: 60,
                ),
              ),
            ),
            Center(
                child:
                    SizedBox(height: 100, child: NotchedRectangleContainer())),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class NotchedRectangleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircularNotchedRectangleClipper(),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 300,
      ),
    );
  }
}

class CircularNotchedRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Rect host = Rect.fromLTWH(0, 0, size.width, size.height);
    final Rect guest = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 7),
      radius: 40,
    );

    return CircularNotchedRectangle().getOuterPath(host, guest);
  }

  @override
  bool shouldReclip(CircularNotchedRectangleClipper oldClipper) => false;
}

class CircularNotchedRectangle extends NotchedShape {
  const CircularNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final double notchRadius = guest.width / 1.2;

    const double s1 = 35.0;
    const double s2 = 35.0;

    final double r = notchRadius;
    final double a = -0.7 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset?> p = List<Offset?>.filled(6, null);

    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    p[3] = Offset(-1.0 * p[2]!.dx, p[2]!.dy);
    p[4] = Offset(-1.0 * p[1]!.dx, p[1]!.dy);
    p[5] = Offset(-1.0 * p[0]!.dx, p[0]!.dy);

    for (int i = 0; i < p.length; i += 1) {
      p[i] = p[i]! + guest.center;
    }

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0]!.dx, p[0]!.dy)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[2]!.dx, p[3]!.dy)
      ..arcToPoint(
        p[3]!,
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[5]!.dx, p[4]!.dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
