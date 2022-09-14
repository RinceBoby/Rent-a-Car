import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/view/login/login_account.dart';
import 'package:carmarket/view/profile/user_details.dart';
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
          CupertinoIcons.gear_alt,
          color: kText,
          size: 30,
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            // fontWeight: FontWeight.bold,
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
              kHeight100,
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
                          "https://i.pinimg.com/564x/20/5a/c8/205ac833d83d23c76ccb74f591cb6000.jpg",
                        ),
                      ),
                    ),
                    kHeight15,

                    //<<<<<Details>>>>>//
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            kHeight20,
                            ProfileDetails(size, CupertinoIcons.person,
                                "User Details", () => Get.to(UserDetails())),
                            kHeight15,
                            ProfileDetails(
                              size,
                              CupertinoIcons.lock,
                              "Privacy Policy",
                              () {},
                            ),
                            kHeight15,
                            ProfileDetails(
                              size,
                              CupertinoIcons.square_line_vertical_square_fill,
                              "Terms and conditions",
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
                                  child: GestureDetector(
                                    onTap: () {
                                      GetLocalStorage.removeUser('token');
                                      Get.to(LoginAccount());
                                    },
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
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
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
            width: size.width * .52,
            child: Text(
              text,
              style: const TextStyle(
                color: kText,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: trailOnTap,
            child: SizedBox(
              width: size.width * .13,
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
