// ignore_for_file: must_be_immutable

import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/profile/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../constants/styles/colors.dart';
import '../constants/spaces/dimensions.dart';
import '../signup/widget/signup_textfield.dart';

class EditUserProfile extends StatelessWidget {
  EditUserProfile({required this.fieldDetail, Key? key}) : super(key: key);

  ProfileModel fieldDetail;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();
    SignupController signupController = Get.find<SignupController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: const Text(
          "Update Profile",
          style: TextStyle(
            color: kText,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () {
          ProfileModel? userData = profileController.profileModel.value;
          if (userData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: GetBuilder<ProfileController>(
              // init: ProfileController(),
              initState: (state) {
                nameController.text = fieldDetail.name!;
                emailController.text = fieldDetail.email!;
                phoneController.text = fieldDetail.phone.toString();
                ageController.text = fieldDetail.age.toString();
                genderController.text = fieldDetail.gender!;
                districtController.text = fieldDetail.district!;
                addressController.text = fieldDetail.address!;
              },
              builder: (controller) {
                return Padding(
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
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formKey,
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
                                          hint: const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Age",
                                              style: TextStyle(
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
                                                padding: const EdgeInsets.only(
                                                    left: 10),
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
                                          hint: const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Gender",
                                              style: TextStyle(
                                                color: kGrey,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          value: controller.genderSelectedValue,
                                          style: const TextStyle(color: kBlack),
                                          items: List.generate(
                                            controller.genderItems.length,
                                            (index) => DropdownMenuItem(
                                              value:
                                                  controller.genderItems[index],
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  controller.genderItems[index],
                                                  style: const TextStyle(
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
                                      width: size.width * .32,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          menuMaxHeight: 200,
                                          value:
                                              controller.districtSelectedValue,
                                          // focusColor: fieldColor,
                                          dropdownColor: fieldColor,
                                          hint: const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "District",
                                              style: TextStyle(color: kGrey),
                                            ),
                                          ),
                                          items: List.generate(
                                            controller.districtItems.length,
                                            (index) => DropdownMenuItem(
                                              value: controller
                                                  .districtItems[index],
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  controller
                                                      .districtItems[index],
                                                  style: const TextStyle(
                                                      color: kWhite),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                          String? userId =
                              GetLocalStorage.getUserIdAndToken('uId');
                          ProfileController controller =
                              Get.find<ProfileController>();

                          print("ontap");

                          if (formKey.currentState!.validate()) {
                            final ProfileModel profileModel = ProfileModel(
                              name: nameController.text,
                              email: emailController.text,
                              phone: int.parse(phoneController.text),
                              age: int.parse(ageController.text),
                              gender: genderController.text,
                              address: addressController.text,
                              district: districtController.text,
                            );

                            controller.updateProfileData(profileModel, userId!);

                            print(profileModel);
                          }
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: fieldColor,
                          shape:
                              RoundedRectangleBorder(borderRadius: kRadius30),
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
