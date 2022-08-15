import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTrans,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: kText,
          ),
        ),
        title: const Text(
          "Fill your profile",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight50,
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
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ProfileFormFeild(
                        label: "Name",
                        keyboardType: TextInputType.name,
                        icon: CupertinoIcons.profile_circled,
                      ),
                      kHeight15,
                      ProfileFormFeild(
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        icon: CupertinoIcons.mail,
                      ),
                      kHeight15,
                      ProfileFormFeild(
                        label: "Place",
                        keyboardType: TextInputType.name,
                        icon: CupertinoIcons.map_pin_ellipse,
                      ),
                      kHeight15,
                      ProfileFormFeild(
                        label: "Mobile",
                        keyboardType: TextInputType.number,
                        icon: CupertinoIcons.device_phone_portrait,
                      ),
                      kHeight20,
                    ],
                  ),
                ),
              ),
              kHeight20,

              //<<<<<Submit_Button>>>>>//
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                  shape: RoundedRectangleBorder(borderRadius: kRadius30),
                  fixedSize: Size(size.width * .9, 50),
                ),
                child: const Text(
                  "Submit",
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

  TextFormField ProfileFormFeild({
    required String label,
    required TextInputType keyboardType,
    required IconData icon,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: kWhite.withOpacity(.5)),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          icon,
          color: kWhite.withOpacity(.5),
          size: 30,
        ),
        filled: true,
        fillColor: fieldColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhite),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kRed),
        ),
      ),
    );
  }
}
