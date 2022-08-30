import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/view/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTrans,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
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

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  kHeight10,
                  Stack(
                    children: const [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: kWhite,
                        child: CircleAvatar(
                          backgroundColor: kBlack,
                          radius: 75,
                        ),
                      ),
                      Positioned(
                        top: 115,
                        left: 107,
                        child: CircleAvatar(
                          backgroundColor: kWhite,
                          child: Icon(
                            CupertinoIcons.camera_circle_fill,
                            color: kText,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight50,

                  profileDetailBox(
                      size, "Name", userData.name!.capitalize!, 0.6935),

                  kHeight10,
                  profileDetailBox(size, "Email", userData.email!, 0.6935),
                  kHeight10,
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .4,
                        child: profileDetailBox(
                            size, "Age", userData.age.toString(), 0.1),
                      ),
                      kWidth10,
                      SizedBox(
                        width: size.width * .523,
                        child: profileDetailBox(
                            size, "Gender", userData.gender!, 0.25),
                      ),
                    ],
                  ),
                  kHeight10,
                  profileDetailBox(
                      size, "Phone", "+91${userData.phone}", 0.6935),
                  kHeight10,
                  profileDetailBox(
                      size, "District", userData.district!, 0.6935),
                  kHeight10,
                  profileDetailBox(
                      size, "Address", userData.address!.capitalize!, 0.6935),

                  kHeight20,

                  //<<<<<Edit_Button>>>>>//E
                  ElevatedButton(
                    onPressed: () {
                      Get.to(EditUserProfile());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: kRadius05),
                      fixedSize: Size(size.width * .9, 50),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                  ),
                  kHeight10,

                  //<<<<<Reset_Password>>>>>//
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: kRadius05),
                      fixedSize: Size(size.width * .9, 50),
                    ),
                    child: const Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                  ),
                ],
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
    double sized,
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
                color: kWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
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
            width: size.width * sized,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: kWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
