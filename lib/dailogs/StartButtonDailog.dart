import 'package:flutter/material.dart';
import '../utils/ClassWidgets.dart';

showDashBoardDailog() {
  return Padding(
    padding: EdgeInsets.all(30.0),
    child: Stack(children: [
      Container(
        width: double.infinity,
        height: 175,
        child: Card(
            surfaceTintColor: Colors.white,
            margin: EdgeInsets.only(top: 35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: appNormalCapitalText("Start this habit"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: appNormalDescText(
                      "ullamco laboris nisi ut aliquip ex ea commodo consequat dolore."),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset("assets/images/down_arrow.png")),
              ],
            )),
      ),
      Center(
        child: CircleAvatar(
          radius: 30,
          child: Image.asset("assets/images/user_icon.png"),
        ),
      ),
    ]),
  );
}
