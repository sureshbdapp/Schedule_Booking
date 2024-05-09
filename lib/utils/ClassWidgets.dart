import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

Color appColor() {
  return Color.fromRGBO(87, 51, 83, 1);
}

Color etBackground = Color.fromRGBO(255, 233, 211, 1.0);
Color etTextColor = Color.fromRGBO(253, 167, 88, 1);
Color transparentOrange = Color.fromRGBO(255, 233, 211, 40);

bottomNavigationBar(BuildContext context, Widget move) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/carousel1.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 60,
            child: Image(
              image: AssetImage("assets/images/tent_icon.png"),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 60,
            child: Image(
              image: AssetImage("assets/images/bottom_nav_clock.png"),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 60,
            child: Image(
              image: AssetImage("assets/images/bottom_nav_community.png"),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 60,
            child: Image(
              image: AssetImage("assets/images/setting_icon.png"),
            ),
          ),
          label: '',
        ),
      ],
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      unselectedItemColor: Colors.grey,
      fixedColor: Colors.red,
      onTap: (index) {
        //   setState(() {
        //     if (index == 0) {
        //       navigationFuncPush(context, move);
        //     }
        //     if (index == 1) {
        //       navigationFuncPush(context, move);
        //     }
        //   });
      },
    ),
  );
}

Widget carouselScreenTopTitle(String title) {
  return Text(
    title.toUpperCase(),
    style: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(87, 51, 83, 1),
        fontSize: 18),
    textAlign: TextAlign.center,
  );
}

carouselScreenBottomText(
    String title1, String title2, String title3, String title4) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: title1.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(87, 51, 83, 1),
              fontSize: 18),
        ),
        TextSpan(
          text: title2.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(249, 181, 102, 1),
              fontSize: 18),
        ),
        TextSpan(
          text: title3.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(87, 51, 83, 1),
              fontSize: 18),
        ),
        TextSpan(
          text: title4.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(249, 181, 102, 1),
              fontSize: 18),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

navigationFunc(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (builder) => widget));
}

navigationFuncPush(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (builder) => widget));
}

Widget emailEt(Color background, IconData icon, String hint) {
  return Container(
    height: 42,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: background, // Set background color
    ),
    margin: EdgeInsets.only(left: 15, right: 15, top: 8),
    child: TextFormField(
      cursorColor: etTextColor,
      maxLines: 1,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: etTextColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent, // Set transparent fill color
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.grey,
      ),
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

Widget passwordEt(Color color) {
  return Container(
    height: 42,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color, // Set background color
    ),
    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
    child: TextFormField(
      cursorColor: etTextColor,
      maxLines: 1,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: etTextColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        // Set transparent fill color
        border: InputBorder.none,
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        // prefixIconColor: Color.fromRGBO(253, 167, 88, .7),
        prefixIconColor: Colors.grey,
        prefixIcon: Icon(Icons.lock_open),
        suffixText: "Show",
        // suffixStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.visiblePassword,
    ),
  );
}

appNormalText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: appColor(),
    ),
    textAlign: TextAlign.center,
  );
}

appNormalCapitalText(String text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: appColor(),
    ),
    textAlign: TextAlign.center,
  );
}

appNormalDescText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: appColor(),
    ),
    textAlign: TextAlign.center,
  );
}

appButton(BuildContext context, String btnName, Widget navigation) {
  return Container(
    height: 45,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: FilledButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromRGBO(253, 167, 88, 1)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        navigationFunc(context, navigation);
      },
      child: Text(
        btnName,
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    ),
  );
}

progressBox(double progress, Color progressColor) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 60,
      width: 60,
      child: Transform.rotate(
        angle: 45 * (pi / 180),
        child: Transform.translate(
          offset: Offset(-50.0, 50.0),
          child: LiquidLinearProgressIndicator(
            value: progress,
            valueColor: AlwaysStoppedAnimation(
                progressColor), // Defaults to the current Theme's accentColor.
            backgroundColor: Colors
                .white, // Defaults to the current Theme's backgroundColor.
            borderColor: Colors.red,
            borderWidth: 0,
            borderRadius: 12.0,
            direction: Axis
                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
            // center: Text("Loading..."),
          ),
        ),
      ),
    ),
  );
}

habitsShapes(List<Widget> list, String title) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 120),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: list,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 15,
          child: appNormalText(title),
        ),
      ],
    ),
  );
}

routineProgress(double progress, Color color, secondColor) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          stops: [progress, .2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            color,
            secondColor
            //Colors.greenAccent.shade100 // top Right part
          ],
        ),
      ),
    ),
  );
}
