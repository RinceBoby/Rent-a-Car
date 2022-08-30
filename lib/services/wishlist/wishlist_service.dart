// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:dio/dio.dart';

class WishlistServices {
  //
  //<<<<<Add_To_Wishlist>>>>>//
  static Future addToWishlist({
    required String carId,
    required String uId,
  }) async {
    try {
      var response = await DioClient.dio
          .post("/dataTowishlist/$carId", data: {"USERID": uId});
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);
    }
  }

  //<<<<<Remove_From_Wishlist>>>>>//
  static Future removeFromWishlist({
    required String carId,
    required String uId,
  }) async {
    try {
      var response = await DioClient.dio
          .post("/removefromwishlist/$carId", data: {"USERID": uId});
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.error);
      print(e.response);
      print(e.response!.statusMessage);
    }
  }

  //<<<<<Data_From_Wishlist>>>>>//
  static Future<List<WishlistModel>?> getDataFromWishList(
      {required String userId}) async {
    try {
      var response = await DioClient.dio
          .post("/getallwishlistdata", data: {"USERID": userId});
     
       print("function called");


      String json = jsonEncode(response.data);
    List<WishlistModel> wishlistDetails =
          wishlistModelFromJson(json);
      return wishlistDetails;
      
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.statusMessage);
    }
    return null;
  }
}
