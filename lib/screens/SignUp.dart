import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/utils/ClassWidgets.dart';

import 'Dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: etBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/signing_up.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              carouselScreenTopTitle("Create your account"),
              SizedBox(
                height: 5,
              ),
              emailEt(Colors.white, CupertinoIcons.person, "Username"),
              emailEt(Colors.white, Icons.email_outlined, "Email"),
              passwordEt(Colors.white),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Checkbox(
                        side: BorderSide(color: Colors.transparent),
                        checkColor: appColor(),
                        fillColor:
                            MaterialStateProperty.all<Color>(etTextColor),
                        value: isChecked,
                        onChanged: (nValue) => {
                              setState(() {
                                isChecked = nValue!;
                              })
                            }),
                  ),
                  appNormalText("Keep me signed in"),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Checkbox(
                        side: BorderSide(color: Colors.transparent),
                        checkColor: appColor(),
                        fillColor:
                            MaterialStateProperty.all<Color>(etTextColor),
                        value: isChecked,
                        onChanged: (nValue) => {
                              setState(() {
                                isChecked = nValue!;
                              })
                            }),
                  ),
                  appNormalText("Email me about special pricing and more"),
                ],
              ),
              appButton(context, "Create Account", Dashboard()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or sign in with',
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey, wordSpacing: 1),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 155,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 5),
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
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Image(
                                image: AssetImage("assets/images/fb_icon.png")),
                          ),
                          Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: appColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // // ),
                  Container(
                    width: 140,
                    height: 45,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                                image: AssetImage("assets/images/g_icon.png")),
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: appColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Already have an account? Sign In",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: appColor(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
