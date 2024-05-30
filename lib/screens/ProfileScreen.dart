import 'package:flutter/material.dart';
import 'package:schedule/utils/ClassWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Profile", false, false, true),
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 22,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10), // Border width
                        decoration: BoxDecoration(
                          color: Colors.white24, // Border color
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8), // Border width
                          decoration: BoxDecoration(
                            color: Colors.white24, // Border color
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                          ),
                        ),
                      ),
                      // Text(
                      //   "John Doe",
                      //   style: TextStyle(color: Colors.black, fontSize: 18),
                      // ),
                      // Text(
                      //   "John Doe",
                      //   style: TextStyle(color: Colors.black, fontSize: 18),
                      // )
                    ],
                  ),
                ),
                CustomPaint(
                  size: Size(double.infinity, 250),
                  painter: RPSCustomPainter(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('000-000-0000'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notification'),
                    trailing: Switch(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Reset Password'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add navigation to reset password page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add navigation to help page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Terms & Conditions'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add navigation to terms & conditions page
                    },
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Add logout functionality
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the profile tab as active
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.poll,
              color: Colors.black,
            ),
            label: 'Survey',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0020700, size.height * 0.3978400);
    path_0.quadraticBezierTo(size.width * 0.2169000, size.height * 0.3965800,
        size.width * 0.2491700, size.height * 0.3976800);
    path_0.cubicTo(
        size.width * 0.3380900,
        size.height * 0.4276900,
        size.width * 0.28729900,
        size.height * 0.7169900,
        size.width * 0.5104000,
        size.height * 0.7364800);
    path_0.cubicTo(
        size.width * 0.7087100,
        size.height * 0.7094000,
        size.width * 0.6487100,
        size.height * 0.4192000,
        size.width * 0.7798600,
        size.height * 0.3977400);
    path_0.quadraticBezierTo(size.width * 0.8004600, size.height * 0.3987600,
        size.width * 1.0039600, size.height * 0.4075400);
    path_0.lineTo(size.width * 2.0008600, size.height * 1.0045600);
    path_0.lineTo(size.width * -0.0014200, size.height * 5.0079400);
    path_0.lineTo(size.width * -0.0020700, size.height * 0.8978400);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
