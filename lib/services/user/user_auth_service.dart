// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserAuthServices {
  //
  //<<<<<User_Login>>>>>//
  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    print(email);
    print(password);
    try {
      var response = await DioClient.dio.post("/login", data: {
        "email": email,
        "password": password,
      });

      print(response.data);

      //<<<<<Saving_Id_Token>>>>>//
      Map<String, String> user = {
        "uId": response.data['_id'],
        "token": response.data['token'],
      };
      GetLocalStorage.saveToken(user);

      Get.offAll(const BottomNavBar());
      return "success";

      //<<<<<Dio_Error>>>>>//
    } on DioError catch (e) {
      print("Dio error");
      print(e.response!.data);
      print(e.response!.statusMessage);

      Get.snackbar('Warning', e.response!.data['message']);

      if (e.type == DioErrorType.other) {
        print("no internet");
        return "No internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return "";
    }
  }

  //<<<<<User_Signup>>>>>//
  static Future<String> signupUser(ProfileModel profileModelData

      //   {
      //   required String name,
      //   required String email,
      //   required int phone,
      //   required int age,
      //   required String gender,
      //   required String address,
      //   required String district,
      //   required String password,
      //   // required String isBlock,
      //   // required String token,
      // }

      ) async {
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    try {
      Map signupData = ProfileModel(
        name: profileModelData.name,
        email: profileModelData.email,
        phone: profileModelData.phone,
        age: profileModelData.age,
        gender: profileModelData.gender,
        address: profileModelData.address,
        district: profileModelData.district,
        password: profileModelData.password,
      ).toJson();

      // var response = await DioClient.dio.post("/signup", data: {
      //   "name": name,
      //   "email": email,
      //   "phone": phone,
      //   "age": age,
      //   "gender": gender,
      //   "address": address,
      //   "district": district,
      //   "password": password,
      // });

      final response = await DioClient.dio.post(
        "/signup",
        data: signupData,
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );

      //<<<<<Registering_User_Details>>>>>//
      Map<String, String> user = {
        "uId": response.data['user'],
        "token": response.data['token'],
      };
      GetLocalStorage.saveToken(user);

      print("Success");
      print(response.data);

      return "success";
      //
      //<<<<<Dio_Error>>>>>//
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);

      if (e.type == DioErrorType.other) {
        print("no internet");
        return "no internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return 'something went wrong';
    }
  }
}
