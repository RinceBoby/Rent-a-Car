// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/profile/profile_model.dart';
import 'package:carmarket/services/user/user_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel?> profileModel = ProfileModel().obs;
  String? userId = GetLocalStorage.getUserIdAndToken("uId");

  //<<<<<Edit_Profile>>>>>//
  Future updateProfileData(ProfileModel profileData, String userId) async {
    try {
      var data =
          await UserProfileService.updateUserProfileData(profileData, userId);
      // return data;
      
      print(data);
      profileModel.value = data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
    update();
  }

  //<<<<<Fetch_Details>>>>>//
  Future<ProfileModel?> getUserProfileData(String userId) async {
    try {
      var data = await UserProfileService.getUserProfileData(userId);
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
    UserProfileService.getUserProfileData(userId!).then(
      (value) {
        return profileModel.value = value;
      },
    );
    super.onInit();
  }
}
