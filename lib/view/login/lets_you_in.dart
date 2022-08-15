import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/login/create_account.dart';
import 'package:carmarket/view/login/login_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/field_text.dart';
import 'widgets/line_text.dart';

class LetsInPage extends StatelessWidget {
  const LetsInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<<<<<Car_Image>>>>>//
                SizedBox(
                  width: size.width * 08,
                  child: const Icon(
                    CupertinoIcons.car_detailed,
                    size: 200,
                    color: kWhite,
                  ),
                ),
                kHeight40,

                //<<<<<Text>>>>>//
                const Text(
                  "Let's you in",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
                kHeight100,

                //<<<<<Google>>>>>//
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: size.width * .9,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: kRadius10,
                      border: Border.all(color: kGrey.withOpacity(.2)),
                      color: fieldColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/google_icon.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        kWidth10,
                        const FieldText(
                          text: "Continue with Google",
                          textColor: kWhite,
                        )
                      ],
                    ),
                  ),
                ),
                kHeight40,

                //<<<<<Text_Line>>>>>//
                const TextInLine(text: "or"),
                kHeight40,

                //<<<<<Sign_In_With_Pass>>>>>//
                ElevatedButton(
                  onPressed: () {
                    Get.to(LoginAccount());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: kRadius30),
                      fixedSize: Size(size.width * .9, 50)),
                  child: const Text(
                    "Sign in with password",
                    style: TextStyle(
                      fontSize: 20,
                      color: kBlack,
                    ),
                  ),
                ),
                kHeight100,

                //<<<<<No_Account>>>>>//
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    FieldText(
                      text: "Dont have and account?",
                      textColor: kGrey,
                      fw: FontWeight.w100,
                    ),
                    kWidth10,
                    GestureDetector(
                      onTap: () {
                        Get.to(CreateAccount());
                      },
                      child:
                          const FieldText(text: "Sign up", textColor: kWhite),
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
