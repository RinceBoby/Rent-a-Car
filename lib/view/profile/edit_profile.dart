import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/services/user/user_profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/signup_controller.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../../models/signup/profile_model.dart';
import '../signup/widget/signup_textfield.dart';

class EditUserProfile extends StatelessWidget {
  EditUserProfile({this.fieldDetail, Key? key}) : super(key: key);

  ProfileModel? fieldDetail;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          initState: (state) {
            nameController.text = fieldDetail!.name!;
            emailController.text = fieldDetail!.email!;
            phoneController.text = fieldDetail!.phone!.toString();
            addressController.text = fieldDetail!.address!;
          },
          builder: (context) {
            return Column(
              children: [
                Form(
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
                          if (value!.isEmpty) {
                            return "Email required";
                          } else if (!value.isEmail) {
                            return "Not a valid email";
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
                    ],
                  ),
                ),

                //<<<<<Button>>>>>//
                ElevatedButton(
                  onPressed: () {
                    ProfileController controller =
                        Get.find<ProfileController>();
                    SignupController sController =
                        Get.find<SignupController>();

                    print("ontap");

                    // if (_formKey.currentState!.validate()) {
                    //   final ProfileModel profileModel = ProfileModel(
                    //     name: nameController.text,
                    //     email: emailController.text,
                    //     phone: int.parse(phoneController.text),
                    //     age: int.parse(sController.ageSelectedValue!),
                    //     gender: sController.genderSelectedValue!,
                    //     address: addressController.text,
                    //     district: sController.districtSelectedValue!,
                    //   );

                    //   UserProfileService.updateUserProfileData(profileModel);

                    //   controller.updateProfileData(profileModel);
                    //   controller.getUserProfileData();
                    // }

                    final ProfileModel profileModel = ProfileModel(
                      name: nameController.text,
                      email: emailController.text,
                      phone: int.parse(phoneController.text),
                      age: int.parse(sController.ageSelectedValue!),
                      gender: sController.genderSelectedValue!,
                      address: addressController.text,
                      district: sController.districtSelectedValue!,
                    );

                    UserProfileService.updateUserProfileData(profileModel);

                    controller.updateProfileData(profileModel);
                    controller.getUserProfileData();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: fieldColor,
                    shape: RoundedRectangleBorder(borderRadius: kRadius30),
                    fixedSize: Size(size.width * .9, 50),
                  ),
                  child: const Text(
                    "Update Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhite,
                    ),
                  ),
                ),
                kHeight15,
              ],
            );
          }),
    );
  }
}
