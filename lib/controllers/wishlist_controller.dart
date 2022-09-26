// ignore_for_file: avoid_print
import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  List<String> wishlistCar = [];

  RxList? wishlistId = [].obs;

  String? userId = GetLocalStorage.getUserIdAndToken('uId');

  RxBool loading = true.obs;

  //
  //<<<<<Add_To_Wishlist>>>>>//
  Future addToWishlistItem(String carId, String uId) async {
    try {
      var response =
          await WishlistServices.addToWishlist(carId: carId, uId: uId);

      return response;
    } catch (e) {
      print(e);
    }
  }

  //<<<<<Remove_From_Wishlist>>>>>//
  Future removeFromWishlistItem(String carId, String uId) async {
    try {
      var response =
          await WishlistServices.removeFromWishlist(carId: carId, uId: uId);
      print(response);
      update();
      return response;
    } catch (e) {
      print(e);
    }
  }

  //<<<<<Data_From_Wishlist>>>>>//
  Future<List<WishlistModel>> getWishListData({required String userId}) async {
    try {
      loading.value = true;
      var data = await WishlistServices.getDataFromWishList(userId: userId);
      loading.value = false;
      print(data);
      update();
      return data!;
    } catch (e) {
      print(e);
      loading.value = false;

      return [];
    }
  }

  Future getWishListDetails({required String userId}) async {
    try {
      var wishListData = await WishlistServices.getWishListData(userId: userId);
      update();
    } catch (e) {
      print(e);
    }
  }

  //<<<<<Wishlist_Data>>>>>//
  Future<void> getWishListId({required String uId}) async {
    try {
      var response = await WishlistServices.getDataFromWishList(userId: uId);
      wishlistId!.value = response!;
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getWishListId(uId: userId!);
    getWishListDetails(userId: userId!);
    getWishListData(userId: userId!);
    super.onInit();
  }
}
