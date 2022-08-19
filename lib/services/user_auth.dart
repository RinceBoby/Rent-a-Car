// ignore_for_file: avoid_print

import 'package:carmarket/services/dio_client.dart';
import 'package:dio/dio.dart';

class UserAuthServices {
  //
  //<<<<<User_Login>>>>>//
  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      var response = await DioClient.dio.post("/login", data: {
        "email": email,
        "password": password,
      });
      print("Success");
      print(response.data);

      return "success";
    } on DioError catch (e) {
      print("Dio error");

      print(e.error);

      print(e.response!.data);

      print(e.response!.statusMessage);

      if (e.type == DioErrorType.other) {
        print("no internet");
        return "No internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return "something";
    } catch (e) {
      print(e);
      return "";
    }
  }

  //<<<<<User_Signup>>>>>//
  static Future<String> signupUser({
    required String name,
    required String email,
    required int phone,
    required int age,
    required String gender,
    required String address,
    required String district,
    required String password,
    // required String isBlock,
    // required String token,
  }) async {
    try {
      var response = await DioClient.dio.post("/signup", data: {
        "name": name,
        "email": email,
        "phone": phone,
        "age": age,
        "gender": gender,
        "address": address,
        "district": district,
        "password" : password,
      });
      print("Success");
      print(response.data);

      return "success";
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
    } catch (e) {
      print(e);
      return "";
    }
  }


  // static Future signupUser()async{
  //   Map<String, dynamic> headers = {
  //     "Content-type":"application/json",
  //     "Accept":"application/json",
  //   };

  //   try {
  //     Map signUpData = ProfileModel{}
  //   } catch (e) {
      
  //   }
  // }
}
