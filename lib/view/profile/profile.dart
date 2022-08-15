import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/address/address.dart';
import 'package:carmarket/view/profile/profile_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBlack,
        leading: const Icon(
          CupertinoIcons.profile_circled,
          color: kText,
          size: 30,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            CupertinoIcons.ellipsis_circle,
            color: kText,
            size: 30,
          ),
          kWidth10,
        ],
      ),

      //<<<<<Profile>>>>>//
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              Center(
                child: Column(
                  children: [
                    //<<<<<Profile_Image>>>>>//
                    const CircleAvatar(
                      radius: 90,
                      backgroundColor: kWhite,
                      child: CircleAvatar(
                        radius: 85,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/2c/c2/38/2cc238bef60a8e147eb5cbcf313e3a40.jpg",
                        ),
                      ),
                    ),
                    kHeight15,

                    //<<<<<Username>>>>>//
                    const Text(
                      "User Name",
                      style: TextStyle(
                        color: kText,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight10,
                    const Text(
                      "+91 86 06 00 4313",
                      style: TextStyle(
                        color: kText,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kHeight20,

                    //<<<<<Details>>>>>//
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            kHeight20,
                            ProfileDetails(
                                size,
                                CupertinoIcons.person,
                                "Edit Profile",
                                () => Get.to(const ProfileForm())),
                            kHeight15,
                            ProfileDetails(
                              size,
                              CupertinoIcons.map_pin_ellipse,
                              "Address",
                              () => Get.to(Addresses()),
                            ),
                            kHeight15,
                            ProfileDetails(
                              size,
                              CupertinoIcons.creditcard,
                              "Payment",
                              () {},
                            ),
                            kHeight15,
                            ProfileDetails(
                              size,
                              CupertinoIcons.lock,
                              "Privacy Policy",
                              () {},
                            ),
                            kHeight15,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: fieldColor,
                                borderRadius: kRadius10,
                              ),
                              child: SizedBox(
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        CupertinoIcons.square_arrow_left,
                                        color: kText,
                                        size: 30,
                                      ),
                                      kWidth25,
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                          color: kRed,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//
//
//
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
//
//
//
//<<<<<Profile_Details>>>>>//
  // ignore: non_constant_identifier_names
  ProfileDetails(
    Size size,
    IconData leadIcon,
    String text,
    VoidCallback trailOnTap,
  ) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: fieldColor, borderRadius: kRadius10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * .15,
            child: Icon(
              leadIcon,
              color: kText,
              size: 30,
            ),
          ),
          SizedBox(
            width: size.width * .5,
            child: Text(
              text,
              style: const TextStyle(
                color: kText,
                fontSize: 22,
              ),
            ),
          ),
          GestureDetector(
            onTap: trailOnTap,
            child: SizedBox(
              width: size.width * .15,
              child: const Icon(
                CupertinoIcons.chevron_forward,
                color: kText,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
