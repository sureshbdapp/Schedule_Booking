import 'package:flutter/material.dart';

import '../utils/ClassWidgets.dart';
import 'AppLists.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  String dropdownValue = list.first;
  String dropdownValue2 = list2.first;
  bool isExpended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: etBackground,
      appBar: appBar(context, "Courses", false, false, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Image(
                image: AssetImage("assets/images/course_head_img.png"),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    // width: 80,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Sort By:",
                      style: TextStyle(fontSize: 18, color: appColor()),
                    )),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: appColor(),
                        ),
                        elevation: 16,
                        style: TextStyle(
                            color: appColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue2,
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: etTextColor,
                        ),
                        elevation: 16,
                        style: TextStyle(
                            color: etTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        borderRadius: BorderRadius.circular(10),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue2 = value!;
                          });
                        },
                        items:
                            list2.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: courseCardView(),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: courseCardView(),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: courseCardView(),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: courseCardView(),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['Popular', 'One', 'Two', 'Three', 'Four'];
const List<String> list2 = <String>['Filter', 'One', 'Two', 'Three', 'Four'];

courseCardView() {
  return Card(
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.symmetric(horizontal: 15),
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: 130,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/course_container.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                appCourseContainerText(
                    "30 Day Journal Challenge - Establish a Habit of Daily Journaling"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "2h 24m",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "24 lessons",
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon: Icon(Icons.satellite_rounded),
                        onPressed: () {},
                      ),
                    ),
                    // child: loadImage("save_icon.png")),
                  ],
                ),
              ],
            )),
      ],
    ),
  );
}
