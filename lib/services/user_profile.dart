// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';

class UserProfileService {
  static Dio dio = DioClient.dio;
  static Future<ProfileModel?> getUserProfileData() async {
    String? userId = GetLocalStorage.getUserIdAndToken("uId");

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
}
