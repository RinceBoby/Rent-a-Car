// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carmarket/controllers/car_details_controller.dart';
import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WishlistServices {
  //
  //<<<<<Add_To_Wishlist>>>>>//
  static Future addToWishlist(
      {required String carId, required String uId}) async {
    try {
      DetailsController detailsController =
          Get.put(DetailsController(carId: carId));
      WishlistController wishlistController = Get.put(WishlistController());

      var response = await DioClient.dio
          .post("/dataTowishlist/$carId", data: {"USERID": uId});

      // detailsController.getWishListId(uId: uId);
      wishlistController.getWishListId(uId: uId);

      print(response.data);

      Get.snackbar(
        "Success",
        response.data['message'],
        backgroundColor: kWhite,
      );
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);

      Get.snackbar(
        "Warning",
        e.response!.data['message'],
        backgroundColor: kWhite,
      );
    }
  }

  //<<<<<Remove_From_Wishlist>>>>>//
  static Future removeFromWishlist(
      {required String carId, required String uId}) async {
    try {
      DetailsController detailsController = Get.find<DetailsController>();
      WishlistController wishlistController = Get.put(WishlistController());

      var response = await DioClient.dio
          .post("/removefromwishlist/$carId", data: {"USERID": uId});
      print(response.data);

      // detailsController.getWishListId(uId: uId);
      wishlistController.getWishListId(uId: uId);

      Get.snackbar(
        "Success",
        response.data['message'],
        backgroundColor: kWhite,
      );
      return response.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response);
      print(e.response!.statusMessage);

      Get.snackbar(
        "Warning",
        e.response!.data['message'],
        backgroundColor: kWhite,
      );
    }
  }

  //<<<<<Data_From_Wishlist>>>>>//
  static Future<List<WishlistModel>?> getDataFromWishList(
      {required String userId}) async {
    try {
      var response = await DioClient.dio
          .post("/getallwishlistdata", data: {"USERID": userId});

      print(response.data);

      String json = jsonEncode(response.data);
      List<WishlistModel> wishlistDetails = wishlistModelFromJson(json);

      return wishlistDetails;
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  //<<<<<Wishlist_Data>>>>>//
  static Future<List<dynamic>?> getWishListData(
      {required String userId}) async {
    try {
      var response = await DioClient.dio
          .post('/getdatafromwishlist', data: {'USERID': userId});

      return response.data['wishlist'];
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }
}
