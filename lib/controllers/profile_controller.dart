// ignore_for_file: avoid_print

import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/services/user/user_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel?> profileModel = ProfileModel().obs;

  //<<<<<Edit_Profile>>>>>//
  Future updateProfileData(ProfileModel profileData) async {
    try {
      var data = await UserProfileService.updateUserProfileData(profileData);
      return data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
    update();
  }

  //<<<<<Fetch_Details>>>>>//
  Future<ProfileModel?> getUserProfileData() async {
    try {
      var data = await UserProfileService.getUserProfileData();
      return data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
    update();
    return null;
  }

  @override
  void onInit() {
    UserProfileService.getUserProfileData().then(
      (value) {
        return profileModel.value = value;
      },
    );
    super.onInit();
  }
}
