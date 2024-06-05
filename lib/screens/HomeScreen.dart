import 'package:flutter/material.dart';
import 'package:schedule/screens/CommunityScreen.dart';

import '../dailogs/StartButtonDailog.dart';
import 'CourseScreen.dart';
import 'Dashboard.dart';
import 'SettingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screenNavList = [
    Dashboard(),
    CourseScreen(),
    CommunityPage(),
    SettingsPage()
  ];
  int currentIndex = 0;
  // DatePickerController datePickerController = DatePickerController();
  bool isExpended = false;
  Image addImage = Image(
    image: AssetImage("assets/images/plus_button.png"),
    fit: BoxFit.fill,
  );
  Image closeImage = Image(
    image: AssetImage("assets/images/close_button.png"),
    fit: BoxFit.fill,
  );
  floatButtonAnimate() {
    setState(() {
      isExpended = !isExpended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screenNavList),
      floatingActionButton: Stack(children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: InkWell(
            onTap: () {
              floatButtonAnimate();
            },
            child: SizedBox(
              height: 65,
              width: 65,
              child: isExpended ? closeImage : addImage,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: showDashBoardDailog(),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        surfaceTintColor: Colors.white,
        notchMargin: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: SizedBox(
                height: 30,
                width: 60,
                child: Image(
                  image: AssetImage("assets/images/tent_icon.png"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                // navigationFuncPush(context, CourseScreen());
              },
              child: Container(
                height: 30,
                width: 60,
                margin: EdgeInsets.only(right: 35),
                child: Image(
                  image: AssetImage("assets/images/bottom_nav_clock.png"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                // navigationFuncPush(context, CommunityPage());
              },
              child: SizedBox(
                height: 30,
                width: 60,
                child: Image(
                  image: AssetImage("assets/images/bottom_nav_community.png"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                // navigationFuncPush(context, SettingsPage());
              },
              child: SizedBox(
                height: 30,
                width: 60,
                child: Image(
                  image: AssetImage("assets/images/setting_icon.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
