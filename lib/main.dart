import 'package:carmarket/view/onboarding/onboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme:
            GoogleFonts.philosopherTextTheme(Theme.of(context).textTheme),
      ),
      home: const OnBoardingPage(),
      //BottomNavBar(),
      //LetsInPage(),
      //BottomNavBar(),
    );
  }
}
