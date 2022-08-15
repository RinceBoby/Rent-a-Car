import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:carmarket/view/login/create_account.dart';
import 'package:carmarket/view/login/widgets/account_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/dimensions.dart';
import 'widgets/line_text.dart';

class LoginAccount extends StatelessWidget {
  LoginAccount({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //<<<<<Image>>>>>//
              SizedBox(
                width: size.width * 08,
                child: const Icon(
                  CupertinoIcons.car_detailed,
                  size: 150,
                  color: kWhite,
                ),
              ),
              kHeight40,

              //<<<<<Title>>>>>//
              Text(
                "Login to Your Account",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                ),
              ),
              kHeight30,

              //<<<<<Text_Form_Field>>>>>//
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (value!.isEmpty) {
                            return "Required Field";
                          } else if (!regex.hasMatch(value)) {
                            return "Enter a valid email";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: kWhite),
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: kWhite.withOpacity(.5)),
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(CupertinoIcons.mail,
                              color: kWhite.withOpacity(.5)),
                          filled: true,
                          fillColor: fieldColor,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kWhite),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kRed),
                          ),
                        ),
                      ),
                      kHeight15,
                      TextFormField(
                        validator: (value) {
                          Pattern pattern =
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
                          RegExp regex = RegExp(pattern.toString());
                          if (value!.isEmpty) {
                            return "Required Field";
                          } else if (!regex.hasMatch(value)) {
                            return "Enter a valid password";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: kWhite),
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: kWhite.withOpacity(.5)),
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(CupertinoIcons.lock,
                              color: kWhite.withOpacity(.5)),
                          filled: true,
                          fillColor: fieldColor,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kWhite),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kRed),
                          ),
                          suffixIcon: Icon(CupertinoIcons.eye,
                              color: kWhite.withOpacity(.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kHeight30,
              Container(),

              //<<<<<Button>>>>>//
              ElevatedButton(
                onPressed: () => Get.off(BottomNavBar()),
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                  shape: RoundedRectangleBorder(borderRadius: kRadius30),
                  fixedSize: Size(size.width * .9, 50),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlack,
                  ),
                ),
              ),
              kHeight40,

              //<<<<<Forget>>>>>//
              Text(
                "Forget the Password?",
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 16,
                ),
              ),
              kHeight30,

              const TextInLine(text: "or"),
              kHeight30,

              //<<<<<OTP>>>>>//
              RichText(
                text: TextSpan(
                  text: "Login with ",
                  style: GoogleFonts.philosopher(
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: "OTP",
                      style: GoogleFonts.philosopher(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              kHeight40,

              //<<<<<Already>>>>>//
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    "Don't have an account?",
                    style: const TextStyle(
                      color: kGrey,
                      fontWeight: FontWeight.w100,
                      fontSize: 18,
                    ),
                  ),
                  kWidth10,

                  GestureDetector(
                    onTap: () => Get.offAll(CreateAccount()),
                    child: Text(
                      "Sign In",
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // AccountForm(
          //   title: "Login to Your Account",
          //   btnTxt: "Sign In",
          //   forgetTxt: "Forget the Password?",
          //   acStatus: "Don't have an account?",
          //   signInorUp: "Sign Up",
          //   logPage: () => Get.offAll(CreateAccount()),
          //   page: () {
          //     Get.off(BottomNavBar());
          //   },
          //   btnColor: kWhite,
          //   btnTextColor: kBlack,
          // ),
        ),
      )),
    );
  }
}
