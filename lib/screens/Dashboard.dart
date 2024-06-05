import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:schedule/api/ApiClient.dart';
import 'package:schedule/models/ApiResponse.dart';
import 'package:schedule/models/ResponseDashboard.dart';
import 'package:schedule/utils/ClassWidgets.dart';
import 'AppLists.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
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

  // dashboardApi() {
  //   return FutureBuilder<ApiResponse?>(
  //       future: ApiClient.dashboardApi(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('Error: ${snapshot.error}'));
  //         } else if (!snapshot.hasData || snapshot.data == null) {
  //           return Center(child: Text('No Data Available'));
  //         } else {
  //           final data = snapshot.data!;
  //           final List<ResponseDashboard> re = data.data[ResponseDashboard];
  //           return ListView(
  //             children: [
  //               ...data.notification.map((n) => ListTile(
  //                     title: Text(n.slug),
  //                     subtitle: Text(n.createdAt.toString()),
  //                   )),
  //               ...data.sessions.map((s) => ListTile(
  //                     title: Text(s.title),
  //                     subtitle: Text(s.sessionDate.toString()),
  //                   )),
  //               ...data.banners.map((b) => ListTile(
  //                     title: Text(b.title),
  //                     leading: Image.network(b.image),
  //                   )),
  //             ],
  //           );
  //         }
  //       });
  //
  //   // String response = data.data
  // }

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
            // Text()
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
