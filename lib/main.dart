import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:carmarket/view/onboarding/onboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? token = GetLocalStorage.getUserIdAndToken("token");

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        // textTheme: GoogleFonts.robotoFlexTextTheme(Theme.of(context).textTheme),
      ),
      home: token == null ? const OnBoardingPage() : const BottomNavBar(),
    );
  }
}
