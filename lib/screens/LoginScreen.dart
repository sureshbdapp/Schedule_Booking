import 'package:flutter/material.dart';
import 'package:schedule/api/ApiClient.dart';
import 'package:schedule/models/ResultModel.dart';
import 'package:schedule/screens/Dashboard.dart';
import 'package:schedule/utils/AlertDailog.dart';
import 'package:schedule/utils/ClassWidgets.dart';

import 'SignUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibleOTP = false;
  String? otp;
  Future<void> login() async {
    Map<String, String> map = {"mobile": "919829568999"};
    final result = await ApiClient.loginApi(map);
    if (result != null && result.success == true) {
      otp = result.data?.otp.toString();
      if (!visibleOTP && passTextEditController.text.isEmpty) {
        myAlertDialog(context, "$otp");
      }
      setState(() {
        visibleOTP = true;
      });
    } else {
      setState(() {
        visibleOTP = !visibleOTP;
        visibleOTP = false;
      });
    }
  }

  // final api = await ApiClient.loginApi(map);
  final TextEditingController textEditingController =
      TextEditingController(text: "919829568999");
  final TextEditingController passTextEditController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 448,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 220, left: 70, right: 70),
                        child: carouselScreenTopTitle(
                            "WELCOME TO Monumental habits"),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: FilledButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(1),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //navigationFunc(context, LoginScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 9),
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/fb_icon.png")),
                              ),
                              Text(
                                "Continue with Facebook",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: appColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: FilledButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(1),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //navigationFunc(context, LoginScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 12, bottom: 8, right: 12),
                                child: Image(
                                    image:
                                        AssetImage("assets/images/g_icon.png")),
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: appColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              border: Border.all(
                                width: 3,
                                color: Colors.transparent,
                                style: BorderStyle.solid,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Text(
                              "Log in with email",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: appColor(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  ),
                  // You can add other widgets here if needed
                ),
              ),
              loginEmailEt(etBackground, Icons.mobile_friendly, "000000000",
                  textEditingController),
              Visibility(
                  visible: visibleOTP,
                  child: passwordEt(etBackground, passTextEditController)),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(253, 167, 88, 1)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (passTextEditController.text.isEmpty &&
                        visibleOTP == true) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Enter OTP")));
                    } else {
                      if (textEditingController.text.isNotEmpty &&
                          passTextEditController.text.isNotEmpty) {
                        if (otp == passTextEditController.text) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Success")));
                          navigationFunc(context, Dashboard());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid OTP")));
                        }
                      } else {
                        login();
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: appColor(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  navigationFuncPush(context, SignUp());
                },
                child: Text(
                  "Don’t have an account? Sign up",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: appColor(),
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
