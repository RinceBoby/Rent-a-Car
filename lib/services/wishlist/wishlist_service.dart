// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carmarket/models/local_storage/local_storage.dart';
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
    } on DioError catch (e) {
      print("Dio Error");
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
    } on DioError catch (e) {
      print("Dio Error");
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
          .post("/getdatafromwishlist", data: {"USERID": userId});
      print(response.data);

      List<WishlistModel> wishlistDetails =
          wishlistModelFromJson(jsonEncode(response.data));
      return wishlistDetails;
      
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.data);
    }
    return null;
  }
}
