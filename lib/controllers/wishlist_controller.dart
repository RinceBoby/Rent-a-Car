// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  List<WishlistModel> allWishlist = [];
  RxBool loading = true.obs;
  Future wishlistItem({required String carId, required String uId}) async {
    loading.value = true;
    try {
      var data =
          await WishlistServices.removeFromWishlist(carId: carId, uId: uId);
      loading.value = false;
      return data!;
    } catch (e) {
      loading.value = false;
      print(e);
    }
  }

  Future<List<WishlistModel>> getWishListData(String userId) async {
    try {
      var data = await WishlistServices.getDataFromWishList(userId: userId);
      return data!;
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.data);
      return [];
    }
  }

  @override
  void onInit() {
    var value = GetLocalStorage.getUserIdAndToken("uId");
    getWishListData(value!).then((value) => allWishlist = value);
    super.onInit();
    update();
  }
}
