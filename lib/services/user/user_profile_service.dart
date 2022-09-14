// ignore_for_file: avoid_print

import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/profile/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../dio/dio_client.dart';

class UserProfileService {
  static Dio dio = DioClient.dio;

  //<<<<<Fetch_User_Details>>>>>//
  static Future<ProfileModel?> getUserProfileData(String userId) async {
    // String? userId = GetLocalStorage.getUserIdAndToken("uId");

    try {
      var response = await dio.get("/getprofileuserdata/$userId");
      ProfileModel profileModel = ProfileModel.fromJson(response.data['user']);
      print(response.data);

      return profileModel;
    } on DioError catch (e) {
      print(e);
      print(e.response!.data);
      return null;
    }
  }

  //<<<<<Edit_Profile_Data>>>>>//
  static Future<ProfileModel?> updateUserProfileData(
      ProfileModel profileModelData, String userId) async {
    ProfileController profileController = Get.find<ProfileController>();
    // String? userId = GetLocalStorage.getUserIdAndToken('uId');

    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      Map updateProfileData = ProfileModel(
        name: profileModelData.name,
        email: profileModelData.email,
        phone: profileModelData.phone,
        age: profileModelData.age,
        gender: profileModelData.gender,
        address: profileModelData.address,
        district: profileModelData.district,
      ).toJson();

      final response = await dio.patch(
        "/userupdate/$userId",
        data: updateProfileData,
        options: Options(followRedirects: false, headers: headers),
      );

      ProfileModel? updatedProfileModel = await profileController.getUserProfileData(userId);

      Get.snackbar(
        "Success",
        response.data['message'],
        backgroundColor: kWhite,
      );
      return updatedProfileModel;
      //
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.statusMessage);

      Get.snackbar(
        "Warning",
        e.response!.data['message'],
        backgroundColor: kWhite,
      );
      return null;
    }
  }

  //<<<<<Reset_Password>>>>>//
  static Future<ProfileModel?> resetPassword(
      ProfileModel profileData, String newPassword) async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');

    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    try {
      final response = await dio.patch(
        "/passwordreset/$userId",
        data: {'password': newPassword},
        options: Options(followRedirects: false, headers: headers),
      );
      print(response.data);
      Get.snackbar(
        "Success",
        response.data['message'],
        backgroundColor: kWhite,
      );

      // return response.data;

    } on DioError catch (e) {
      print(e);
      print(e.response!.statusMessage);
      print(e.message);

      Get.snackbar("Warning", e.response!.data['message']);
      return null;
    }
  }
}
