import 'dart:math';
import 'package:flutter/material.dart';
import 'package:schedule/api/ApiBaseService.dart';
import 'package:schedule/screens/LoginScreen.dart';
import 'package:schedule/utils/ClassWidgets.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Widget> _pages = [
    const OnboardingPage(
        title: "WELCOME TO Monumental habits",
        text1: 'We can ',
        text2: 'help you ',
        text3: 'to be a better version of ',
        text4: 'yourself.',
        image: AssetImage('assets/images/carousel1.png')),
    const OnboardingPage(
        title: " CREATE NEW HABIT EASILY",
        text1: 'We can ',
        text2: 'help you ',
        text3: 'to be a better version of ',
        text4: 'yourself.',
        image: AssetImage('assets/images/carousel2.png')),
    const OnboardingPage(
        title: " KEEP TRACK OF YOUR PROGRESS",
        text1: 'We can ',
        text2: 'help you ',
        text3: 'to be a better version of ',
        text4: 'yourself.',
        image: AssetImage('assets/images/carousel3.png')),
    const OnboardingPage(
        title: "JOIN A SUPPORTIVE COMMUNITY",
        text1: 'We can ',
        text2: 'help you ',
        text3: 'to be a better version of ',
        text4: 'yourself.',
        image: AssetImage('assets/images/carousel4.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          if (_currentPage == _pages.length - 1)
            Container(
              height: 50,
              margin: EdgeInsets.all(20),
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
                onPressed: () {
                  navigationFunc(context, LoginScreen());
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          else
            Expanded(
              flex: 1,
              child: bottomNav(
                context,
                pageController: _pageController,
                numPages: _pages.length,
              ),
            ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final AssetImage image;
  final String text1, text2, text3, text4;
  final String title;

  const OnboardingPage(
      {super.key,
      this.title = '',
      required this.image,
      this.text1 = '',
      this.text2 = '',
      this.text3 = '',
      this.text4 = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: carouselScreenTopTitle(title)),
          SizedBox(
            height: 400,
            child: Image(image: image),
          ),
          if (text1.isNotEmpty &&
              text2.isNotEmpty &&
              text3.isNotEmpty &&
              text4.isNotEmpty)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: carouselScreenBottomText(text1, text2, text3, text4)),
        ],
      ),
    );
  }
}

Widget bottomNav(BuildContext context,
    {required PageController pageController, required int numPages}) {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            pageController.animateToPage(numPages - 1,
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          },
          child: const Text('Skip',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  color: Color.fromRGBO(87, 51, 83, 1))),
        ),
        DotsIndicator(
          controller: pageController,
          itemCount: numPages,
          onPageSelected: (int page) {
            pageController.animateToPage(page,
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          },
        ),
        TextButton(
          onPressed: () {
            if (pageController.page!.toInt() < numPages - 1) {
              pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            }
          },
          child: const Text(
            'Next',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17,
                color: Color.fromRGBO(87, 51, 83, 1)),
          ),
        ),
      ],
    ),
  );
}

class DotsIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final ValueChanged<int>? onPageSelected;

  const DotsIndicator(
      {super.key,
      required this.controller,
      required this.itemCount,
      this.onPageSelected})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = max(
      0.0,
      0.6 - ((controller.page ?? controller.initialPage) - index).abs(),
    );
    double size = 10.0 + (15.0 * selectedness);
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (controller.page == index)
              ? Color.fromRGBO(87, 51, 83, 1)
              : Color.fromRGBO(249, 181, 102, 1)),
    );
  }
}
