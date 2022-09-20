import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/services/user/user_auth_service.dart';
import 'package:carmarket/view/functions/functions.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/dimensions.dart';
import '../signup/signup.dart';
import 'widgets/line_text.dart';

// ignore: must_be_immutable
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
                const Text(
                  "Login to Your Account",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
                kHeight30,

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        //
                        //<<<<<Email>>>>>//
                        TextFormField(
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = RegExp(pattern.toString());
                            if (value!.isEmpty) {
                              return "Required Field";
                            } else if (!regex.hasMatch(value)) {
                              return "This is not a valid email";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: kWhite),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle:
                                TextStyle(color: kWhite.withOpacity(.5)),
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
                            if (value!.isEmpty) {
                              return "Password required";
                            } else if (value.length < 6) {
                              return "Minimum length is 6 characters";
                            }
                            return null;
                          },
                          style: const TextStyle(color: kWhite),
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                TextStyle(color: kWhite.withOpacity(.5)),
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
                Obx(
                  () {
                    return ElevatedButton(
                      onPressed: () {
                        print("ontap");
                        if (_formKey.currentState!.validate()) {
                          UserAuthServices.loginUser(
                            email: emailController.text,
                            password: passController.text.trim(),
                          ).then(
                            (value) {
                              if (value == "success") {
                                Get.offAll(const BottomNavBar());
                                return;
                              } else if (value.isNotEmpty) {
                                getSnackBar(value);
                                return;
                              }
                              getSnackBar("is empty");
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kWhite,
                        shape: RoundedRectangleBorder(borderRadius: kRadius30),
                        fixedSize: Size(size.width * .9, 50),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 20,
                          color: kBlack,
                        ),
                      ),
                    );
                  }
                ),
                kHeight40,

                //<<<<<Forget>>>>>//
                const Text(
                  "Forget the Password?",
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
                kHeight30,

                const TextInLine(text: "or", size: 18),
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
                      onTap: () => Get.offAll(Signup()),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
