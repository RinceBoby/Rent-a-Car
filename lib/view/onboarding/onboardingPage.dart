import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:carmarket/view/login/lets_you_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: size.height / 1.4,
              width: size.width,
            ),
          ),
          Positioned(
            top: 100,
            right: 5,
            left: 5,
            child: Lottie.asset(
              tabs[_currentIndex].lottieFile,
              key: Key(_currentIndex.toString()),
              width: 600,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        OnBoardingModel tab = tabs[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(tab.title,
                                style: GoogleFonts.kaushanScript(
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                  fontSize: 30,
                                  fontStyle: FontStyle.italic,
                                )),
                            kHeight30,
                            Text(
                              tab.subTitle,
                              style: GoogleFonts.marckScript(
                                fontSize: 25,
                                color: kGrey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        _currentIndex = value;
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    children: [
                      kWidth20,

                      //<<<<<Backward>>>>>//
                      _currentIndex == 0
                          ? const SizedBox(
                              width: 55,
                            )
                          : FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              },
                              backgroundColor: kWhite,
                              child: const Icon(CupertinoIcons.chevron_left,
                                  color: kBlack),
                            ),
                      const Spacer(),

                      //<<<<<Loop>>>>>//
                      for (int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentIndex),
                      const Spacer(),

                      //<<<<<Forward>>>>>//
                      FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () {
                          if (_currentIndex == 4) {
                            Get.off(const LetsInPage());
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          }
                        },
                        backgroundColor: kWhite,
                        child: const Icon(CupertinoIcons.chevron_right,
                            color: kBlack),
                      ),
                      kWidth20,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(const LetsInPage()),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight40,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//<<<<<Custom_Paint>>>>>//
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.orange);

    Path whiteArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 185)
      ..quadraticBezierTo(
          size.width / 2, size.height - 70, size.width, size.height - 185)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = kWhite);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//<<<<<Dot_Indicator>>>>>//
class _DotIndicator extends StatelessWidget {
  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6,
        width: 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected! ? kWhite : Colors.amber,
        ),
      ),
    );
  }
}

//<<<<<Model_Class>>>>>//
class OnBoardingModel {
  final String lottieFile;
  final String title;
  final String subTitle;

  OnBoardingModel(
    this.lottieFile,
    this.title,
    this.subTitle,
  );
}

List<OnBoardingModel> tabs = [
  OnBoardingModel(
    "assets/red-car.json",
    "Premium Cars",
    "All types of premium cars are available.",
  ),
  OnBoardingModel(
    "assets/car-in-movement.json",
    "Easy Booking",
    "One clicking booking from anywhere.",
  ),
  OnBoardingModel(
    "assets/driving-car.json",
    "Quick door delivery",
    "Get preferred vehicle at your door step.",
  ),
  OnBoardingModel(
    "assets/technical-assistance.json",
    "Road Assistance Service",
    "Arrange rapid road service mechanics \n in emergency.",
  ),
  OnBoardingModel(
    "assets/call-center-support.json",
    "Support",
    "24 x 7 customer service support.",
  ),
];
