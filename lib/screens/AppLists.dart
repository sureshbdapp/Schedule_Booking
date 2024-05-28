import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/ClassWidgets.dart';
import 'CourseScreen.dart';

final List<Widget> svgList = [
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/orange_shape.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_orange.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_orange.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/orange_shape.svg"),
  ),
  Padding(
    padding: EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_orange.svg"),
  ),
  SvgPicture.asset("assets/images/half_orange.svg"),
  SvgPicture.asset("assets/images/orange_shape.svg"),
];
final List<Widget> svgPinkList = [
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/full_pink_dashboard_shape.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_pink_shape.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/full_pink_dashboard_shape.svg"),
  ),
  Padding(
    padding: const EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_pink_shape.svg"),
  ),
  Padding(
    padding: EdgeInsets.all(4.0),
    child: SvgPicture.asset("assets/images/half_pink_shape.svg"),
  ),
  SvgPicture.asset("assets/images/half_orange.svg"),
  SvgPicture.asset("assets/images/orange_shape.svg"),
];
final List<Widget> readBookList = [
  routineProgress(.3, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.9, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.5, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.8, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.2, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.5, Colors.green, Colors.greenAccent.shade100),
  routineProgress(.5, Colors.green, Colors.greenAccent.shade100),
];
final List<Widget> dogWalkList = [
  routineProgress(.7, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.2, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.8, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.3, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.5, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.2, Colors.indigo, Colors.indigo.shade50),
  routineProgress(.8, Colors.indigo, Colors.indigo.shade50),
];
final List<Widget> cardList = [
  courseCardView(),
  courseCardView(),
  courseCardView(),
  courseCardView(),
  courseCardView()
];
