import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:schedule/dailogs/StartButtonDailog.dart';
import 'package:schedule/screens/CommunityScreen.dart';
import 'package:schedule/screens/CourseScreen.dart';
import 'package:schedule/screens/LoginScreen.dart';
import 'package:schedule/screens/SettingScreen.dart';
import 'package:schedule/utils/ClassWidgets.dart';
import 'AppLists.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  DatePickerController datePickerController = DatePickerController();
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
      backgroundColor: etBackground,
      appBar: appBar(context, "Homepage", false, true, true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: const Image(
                image: AssetImage("assets/images/dashboard_top.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: appNormalText("HABITES"),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 90,
                    width: 300,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.white,
                      selectedTextColor: Colors.black,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          // _selectedValue = date;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            habitsShapes(readBookList, "Read a Book"),
            SizedBox(
              height: 5,
            ),
            habitsShapes(svgPinkList, "Exercise"),
            SizedBox(
              height: 5,
            ),
            habitsShapes(svgList, "Wake Up Early"),
            SizedBox(
              height: 5,
            ),
            habitsShapes(dogWalkList, "Walk Dog"),
            SizedBox(
              height: 5,
            ),
            // showDashBoardDailog(),
          ],
        ),
      ),
    );
  }
}

buildDay(String day) {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Text(
      day,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

buildDate(int date) {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Text(
      style: TextStyle(fontSize: 20),
      date.toString(),
      textAlign: TextAlign.center,
    ),
  );
}
