// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  List<WishlistModel> allWishlist = [];

  RxBool loading = true.obs;
  RxBool isWish = false.obs;
  //
  //<<<<<Add_To_Wishlist>>>>>//
  Future addToWishlistItem({required String carId, required String uId}) async {
    try {
      var data = await WishlistServices.addToWishlist(carId: carId, uId: uId);
      isWish.value = true;
      return data!;
    } catch (e) {
      print(e);
      isWish.value = false;
    }
    return allWishlist;
  }

  //<<<<<Remove_From_Wishlist>>>>>//
  Future removeFromWishlistItem(
      {required String carId, required String uId}) async {
    //  isWish.value = true;
    try {
      var data =
          await WishlistServices.removeFromWishlist(carId: carId, uId: uId);
      isWish.value = false;
      return data;
    } catch (e) {
      isWish.value = true;
      print(e);
    }
  }

  //<<<<<Data_From_Wishlist>>>>>//
  Future<List<WishlistModel>> getWishListData(String userId) async {
    try {
      loading.value = true;
      var data = await WishlistServices.getDataFromWishList(userId: userId);
      loading.value = false;
      print(data);
      return data!;
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.data);
      loading.value = false;

      return [];
    }
  }

  @override
  void onInit() {
    var value = GetLocalStorage.getUserIdAndToken("uId");
    getWishListData(value!).then((value) {
      print("abcd");
      print(value);
      allWishlist = value;
    });
    print("all wish list");
    print(allWishlist);
    super.onInit();
    update();
  }
}
