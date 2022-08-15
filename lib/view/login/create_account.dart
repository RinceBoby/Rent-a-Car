import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:carmarket/view/login/login_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/dimensions.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String ageDrop = "Age";
  String genderDrop = "Gender";
  String districtDrop = "District";

  var ageItems = ['18', '19', '20', '21', '22', '23', '24', '25'];
  var genderItems = ['Male', 'Female'];
  var districtItems = ['Idukki', 'Cochin', 'Kottayam', 'Kollam', 'TVM'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child:
                // AccountForm(
                //   title: "Create your Account",
                //   btnTxt: "Sign Up",
                //   forgetTxt: "",
                //   acStatus: "Already have an account?",
                //   signInorUp: "Sign In",
                //   page: () {
                //     Get.offAll(BottomNavBar());
                //   },
                //   logPage: () => Get.to(const LoginAccount()),
                //   btnColor: fieldColor,
                //   btnTextColor: kWhite,
                // ),
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<<<<<Image>>>>>//
                SizedBox(
                  width: size.width * 08,
                  child: const Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    size: 90,
                    color: kWhite,
                  ),
                ),
                // kHeight40,

                //<<<<<Title>>>>>//
                const Text(
                  "Create your Account",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
                kHeight20,

                //<<<<<Text_Form_Field>>>>>//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //<<<<<Name>>>>>//
                        TextFormField(
                          style: const TextStyle(color: kWhite),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle:
                                TextStyle(color: kWhite.withOpacity(.5)),
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(CupertinoIcons.person,
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

                        //<<<<<Email>>>>>//
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

                        //<<<<<Mobile>>>>>//
                        TextFormField(
                          style: const TextStyle(color: kWhite),
                          controller: emailController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            labelStyle:
                                TextStyle(color: kWhite.withOpacity(.5)),
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(
                                CupertinoIcons.device_phone_portrait,
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

                        //<<<<<Address>>>>>//
                        TextFormField(
                          style: const TextStyle(color: kWhite),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle:
                                TextStyle(color: kWhite.withOpacity(.5)),
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(CupertinoIcons.house,
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

                        //<<<<<Age_Gender_District>>>>>//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //<<<<<Age>>>>>//
                            SizedBox(
                              width: size.width * .29,
                              child: DropdownButton(
                                hint:const Text(
                                  "Age",
                                  style: TextStyle(color: kGrey),
                                ),
                                style: TextStyle(color: fieldColor),
                                items: ageItems.map((String ageItems) {
                                  return DropdownMenuItem(
                                    value: ageItems,
                                    child: Text(ageItems),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      ageDrop = newValue!;
                                    },
                                  );
                                },
                              ),
                              // TextFormField(
                              //   style: const TextStyle(color: kWhite),
                              //   controller: emailController,
                              //   decoration: InputDecoration(
                              //     labelText: "Age",
                              //     labelStyle:
                              //         TextStyle(color: kWhite.withOpacity(.5)),
                              //     border: const OutlineInputBorder(),
                              //     // prefixIcon: Icon(CupertinoIcons.mail,
                              //     //     color: kWhite.withOpacity(.5)),
                              //     filled: true,
                              //     fillColor: fieldColor,
                              //     focusedBorder: const OutlineInputBorder(
                              //       borderSide: BorderSide(color: kWhite),
                              //     ),
                              //     errorBorder: const OutlineInputBorder(
                              //       borderSide: BorderSide(color: kRed),
                              //     ),
                              //   ),
                              // ),
                            ),

                            //<<<<<Gender>>>>>//
                            SizedBox(
                              width: size.width * .29,
                              child: TextFormField(
                                style: const TextStyle(color: kWhite),
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Gender",
                                  labelStyle:
                                      TextStyle(color: kWhite.withOpacity(.5)),
                                  border: const OutlineInputBorder(),
                                  // prefixIcon: Icon(CupertinoIcons.mail,
                                  //     color: kWhite.withOpacity(.5)),
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
                            ),

                            //<<<<<District>>>>>//
                            SizedBox(
                              width: size.width * .29,
                              child: TextFormField(
                                style: const TextStyle(color: kWhite),
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "District",
                                  labelStyle:
                                      TextStyle(color: kWhite.withOpacity(.5)),
                                  border: const OutlineInputBorder(),
                                  // prefixIcon: Icon(CupertinoIcons.mail,
                                  //     color: kWhite.withOpacity(.5)),
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
                            ),
                          ],
                        ),
                        kHeight15,

                        //<<<<<Password>>>>>//
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
                        kHeight15,

                        //<<<<<Confirm_Password>>>>>//
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
                          obscureText: true,
                          controller: passController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
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

                //<<<<<Button>>>>>//
                ElevatedButton(
                  onPressed: () => Get.offAll(BottomNavBar()),
                  style: ElevatedButton.styleFrom(
                    primary: fieldColor,
                    shape: RoundedRectangleBorder(borderRadius: kRadius30),
                    fixedSize: Size(size.width * .9, 50),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhite,
                    ),
                  ),
                ),
                kHeight15,

                //<<<<<Forget>>>>>//
                const Text(
                  "",
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
                kHeight15,

                //<<<<<Already>>>>>//
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      "Already have an account?",
                      style: const TextStyle(
                        color: kGrey,
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      ),
                    ),
                    kWidth10,

                    GestureDetector(
                      onTap: () => Get.to(LoginAccount()),
                      child: const Text(
                        "Sign In",
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
