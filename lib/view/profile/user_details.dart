// ignore_for_file: avoid_print

import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:carmarket/view/constants/spaces/dimensions.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/profile/profile_model.dart';
import 'package:carmarket/services/user/user_profile_service.dart';
import 'package:carmarket/view/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signup/widget/signup_textfield.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nPassController = TextEditingController();
    TextEditingController cnPassController = TextEditingController();
    ProfileController profileController = Get.put(ProfileController());
    ProfileModel? userData = profileController.profileModel.value;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTrans,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: kText,
            fontSize: 26,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              CupertinoIcons.ellipsis_circle,
              color: kText,
              size: 30,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 0) {
                print("Edit profile clicked"); //<<<<<Edit_Profile>>>>>//
                //
                Get.to(EditUserProfile(fieldDetail: userData!));
                //
              } else if (value == 1) {
                print("Reset Password clicked"); //<<<<<Password>>>>>//
                //
                Get.defaultDialog(
                  barrierDismissible: false,
                  backgroundColor: kGrey,
                  title: "",
                  // titleStyle: const
                  content: Form(
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: kBlack,
                            borderRadius: kRadius10,
                          ),
                          child: const Center(
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kWhite,
                              ),
                            ),
                          ),
                        ),
                        kHeight25,
                        //<<<<<Password>>>>>//
                        SignupTextFormField(
                          controller: nPassController,
                          label: "New Password",
                          prefixIcon: CupertinoIcons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password required";
                            } else if (value.length < 6) {
                              return "Minimum 6 characters required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        kHeight15,
                        SignupTextFormField(
                          controller: cnPassController,
                          label: " Confirm Password",
                          prefixIcon: CupertinoIcons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password required";
                            } else if (nPassController.text !=
                                cnPassController.text) {
                              return "Passwords doesn't match";
                            } else {
                              return null;
                            }
                          },
                        ),
                        kHeight15,
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white60,
                            shape: RoundedRectangleBorder(
                              borderRadius: kRadius10,
                              side: const BorderSide(
                                color: kRed,
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: kRed,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white60,
                            shape: RoundedRectangleBorder(
                              borderRadius: kRadius10,
                              side: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: () {
                            String? userId =
                                GetLocalStorage.getUserIdAndToken("uId");
                            ProfileModel profileModel =
                                ProfileModel(password: nPassController.text);
                            print(profileModel.password);
                            UserProfileService.resetPassword(
                                profileModel, nPassController.text);

                            Get.back();
                          },
                          child: const Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
      //
      body: Obx(
        () {
          ProfileModel? userData = profileController.profileModel.value;
          if (userData!.name == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: kRadius10,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      kHeight20,
                      const CircleAvatar(
                        radius: 80,
                        backgroundColor: kWhite,
                        child: CircleAvatar(
                          backgroundColor: kBlack,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/564x/20/5a/c8/205ac833d83d23c76ccb74f591cb6000.jpg"),
                          radius: 75,
                        ),
                      ),
                      kHeight30,
                      profileDetailBox(
                        size,
                        "Name",
                        userData.name!.capitalize!,
                      ),
                      kHeight15,
                      profileDetailBox(
                        size,
                        "Email",
                        userData.email!,
                      ),
                      kHeight15,
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * .4,
                            child: profileDetailBox(
                              size,
                              "Age",
                              userData.age.toString(),
                            ),
                          ),
                          kWidth10,
                          SizedBox(
                            width: size.width * .47,
                            child: profileDetailBox(
                              size,
                              "Gender",
                              userData.gender!,
                            ),
                          ),
                        ],
                      ),
                      kHeight15,
                      profileDetailBox(
                        size,
                        "Phone",
                        "+91${userData.phone}",
                      ),
                      kHeight15,
                      profileDetailBox(
                        size,
                        "District",
                        userData.district!,
                      ),
                      kHeight15,
                      profileDetailBox(
                          size, "Address", userData.address!.capitalize!),
                      kHeight30,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //
  //
  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  //
  //
  profileDetailBox(
    Size size,
    String title,
    String subtitle,
    // double sized,
  ) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: kRadius05,
      ),
      child: Row(
        children: [
          kWidth10,
          SizedBox(
            width: size.width * .2,
            child: Text(
              title,
              style: const TextStyle(
                color: kGrey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            width: size.width * .03,
            child: const Text(
              ":",
              style: TextStyle(
                color: kWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              subtitle,
              style: const TextStyle(
                color: kWhite,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
