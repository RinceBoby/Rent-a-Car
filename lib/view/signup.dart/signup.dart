import 'package:carmarket/controllers/signup_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/services/user_auth.dart';
import 'package:carmarket/view/functions/functions.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:carmarket/view/login/login_account.dart';
import 'package:carmarket/view/signup.dart/widget/signup_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/dimensions.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        //<<<<<Name>>>>>//
                        SignupTextFormField(
                          controller: nameController,
                          label: "Name",
                          prefixIcon: CupertinoIcons.person,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          validator: (value) =>
                              value!.isEmpty ? "Name is required" : null,
                        ),

                        kHeight15,

                        //<<<<<Email>>>>>//

                        SignupTextFormField(
                          controller: emailController,
                          label: "Email",
                          prefixIcon: CupertinoIcons.mail,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String? value) {
                            if (value!.isEmail) {
                              return "Not a valid email";
                            } else if (value.isEmpty) {
                              return "Email required";
                            }
                            return null;
                          },
                        ),
                        kHeight15,

                        //<<<<<Mobile>>>>>//
                        SignupTextFormField(
                          controller: phoneController,
                          label: "Mobile No",
                          prefixIcon: CupertinoIcons.device_phone_portrait,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          validator: (value) => value!.isEmpty
                              ? "Number is required"
                              : value.length < 10
                                  ? "Minimum 10 numbers"
                                  : null,
                        ),
                        kHeight15,

                        //<<<<<Address>>>>>//
                        SignupTextFormField(
                          controller: addressController,
                          label: "Address",
                          prefixIcon: CupertinoIcons.house,
                          keyboardType: TextInputType.streetAddress,
                          obscureText: false,
                          validator: (value) =>
                              value!.isEmpty ? "Address is required" : null,
                        ),
                        kHeight15,

                        //<<<<<Age_Gender_District>>>>>//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //<<<<<Age>>>>>//
                            GetBuilder<SignupController>(
                              init: SignupController(),
                              builder: (controller) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: fieldColor,
                                      borderRadius: kRadius05),
                                  width: size.width * .29,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      dropdownColor: fieldColor,
                                      menuMaxHeight: 200,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Age",
                                          style: GoogleFonts.philosopher(
                                            color: kGrey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      value: controller.ageSelectedValue,
                                      style: const TextStyle(color: kWhite),
                                      items: List.generate(
                                        controller.ageItems.length,
                                        (index) => DropdownMenuItem(
                                          value: controller.ageItems[index]
                                              .toString(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              controller.ageItems[index]
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        controller.dropdownValueChanging(
                                            newValue!, "age");
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),

                            //<<<<<Gender>>>>>//
                            GetBuilder<SignupController>(
                              init: SignupController(),
                              builder: (controller) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: fieldColor,
                                      borderRadius: kRadius05),
                                  width: size.width * .29,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      dropdownColor: fieldColor,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Gender",
                                          style: GoogleFonts.philosopher(
                                            color: kGrey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      value: controller.genderSelectedValue,
                                      style: GoogleFonts.philosopher(
                                          color: kBlack),
                                      items: List.generate(
                                        controller.genderItems.length,
                                        (index) => DropdownMenuItem(
                                          value: controller.genderItems[index],
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              controller.genderItems[index],
                                              style: GoogleFonts.philosopher(
                                                  color: kWhite),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        controller.dropdownValueChanging(
                                            newValue!, "gender");
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),

                            //<<<<<District>>>>>//
                            GetBuilder<SignupController>(
                              init: SignupController(),
                              builder: (controller) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: fieldColor,
                                      borderRadius: kRadius05),
                                  width: size.width * .29,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      menuMaxHeight: 200,
                                      value: controller.districtSelectedValue,
                                      // focusColor: fieldColor,
                                      dropdownColor: fieldColor,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text("District",
                                            style: GoogleFonts.philosopher(
                                                color: kGrey)),
                                      ),
                                      items: List.generate(
                                        controller.districtItems.length,
                                        (index) => DropdownMenuItem(
                                          value:
                                              controller.districtItems[index],
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              controller.districtItems[index],
                                              style: GoogleFonts.philosopher(
                                                  color: kWhite),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        controller.dropdownValueChanging(
                                            newValue!, "district");
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        kHeight15,

                        //<<<<<Password>>>>>//
                        SignupTextFormField(
                          controller: passController,
                          label: "Password",
                          prefixIcon: CupertinoIcons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) => value!.isEmpty
                              ? "Password required"
                              : value.length < 6
                                  ? "Minimum 6 characters"
                                  : null,
                        ),
                        kHeight15,

                        //<<<<<Confirm_Password>>>>>//
                        SignupTextFormField(
                          controller: cPassController,
                          label: "Confirm Password",
                          prefixIcon: CupertinoIcons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          // ignore: unrelated_type_equality_checks
                          validator: (value) =>
                              cPassController != passController
                                  ? "Password doesn't match"
                                  : value!.isEmpty
                                      ? "Confirm password required"
                                      : null,
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight30,

                //<<<<<Button>>>>>//
                ElevatedButton(
                  onPressed: () {
                    SignupController controller = Get.find<SignupController>();
                    print("ontap");
                    if (_formKey.currentState!.validate()) {
                      UserAuthServices.signupUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: int.parse(phoneController.text),
                        age: int.parse(controller.ageSelectedValue!),
                        gender: controller.genderSelectedValue!,
                        address: addressController.text,
                        district: controller.districtSelectedValue!,
                        password: passController.text,
                      ).then(
                        (value) {
                          if (value == "success") {
                            Get.offAll(BottomNavBar());
                            return;
                          } else if (value.isNotEmpty) {
                            getSnackBar(value);
                            return;
                          }
                          getSnackBar(value);
                        },
                      );
                    }
                  },
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
