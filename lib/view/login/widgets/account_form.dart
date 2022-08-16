import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import 'line_text.dart';

// ignore: must_be_immutable
class AccountForm extends StatelessWidget {
  AccountForm({
    Key? key,
    required this.title,
    required this.btnTxt,
    required this.acStatus,
    required this.signInorUp,
    required this.btnColor,
    required this.btnTextColor,
    required this.page,
    required this.logPage,
    this.forgetTxt,
  }) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final String title;
  final String btnTxt;
  final String acStatus;
  final String signInorUp;
  final Color btnColor;
  final Color btnTextColor;
  final String? forgetTxt;
  VoidCallback page;
  VoidCallback logPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
          title,
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
                  style:const TextStyle(color: kWhite),
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
                  style:const TextStyle(color: kWhite),
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
                    suffixIcon:
                        Icon(CupertinoIcons.eye, color: kWhite.withOpacity(.5)),
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
          onPressed: page,
          style: ElevatedButton.styleFrom(
            primary: btnColor,
            shape: RoundedRectangleBorder(borderRadius: kRadius30),
            fixedSize: Size(size.width * .9, 50),
          ),
          child: Text(
            btnTxt,
            style: TextStyle(
              fontSize: 20,
              color: btnTextColor,
            ),
          ),
        ),
        kHeight40,

        //<<<<<Forget>>>>>//
        Text(
          forgetTxt!,
          style: const TextStyle(
            color: kWhite,
            fontSize: 16,
          ),
        ),
        kHeight30,

        const TextInLine(text: "or continue with",size: 18),
        kHeight50,

        //<<<<<Google>>>>>//
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 85,
            decoration: BoxDecoration(
              color: kGrey.withOpacity(.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kGrey.withOpacity(.3)),
            ),
            child: Center(
              child: Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/google_icon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        kHeight40,

        //<<<<<Already>>>>>//
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Text(
              acStatus,
              style: const TextStyle(
                color: kGrey,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            kWidth10,

            GestureDetector(
              onTap: logPage,
              child: Text(
                signInorUp,
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
    );
  }
}
