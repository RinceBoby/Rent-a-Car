// ignore_for_file: avoid_print

import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  List<String> wishlistCar = [];

  String? userId = GetLocalStorage.getUserIdAndToken('uId');

  RxBool loading = true.obs;
  // RxBool isWish = false.obs;
  //
  //<<<<<Add_To_Wishlist>>>>>//
  Future addToWishlistItem(String carId, String uId) async {
    try {
      var response =
          await WishlistServices.addToWishlist(carId: carId, uId: uId);
      // isWish.value = true;
      return response;
    } catch (e) {
      print(e);
      // isWish.value = false;
    }
  }

  //<<<<<Remove_From_Wishlist>>>>>//
  Future removeFromWishlistItem(String carId, String uId) async {
    // isWish.value = true;
    try {
      var response =
          await WishlistServices.removeFromWishlist(carId: carId, uId: uId);
      // isWish.value = false;
      return response;
    } catch (e) {
      // isWish.value = true;
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
    } catch (e) {
      print(e);
      loading.value = false;

      return [];
    }
  }

  Future getWishListDetails({required String userId}) async {
    try {
      var wishListData = await WishlistServices.getWishListData(userId: userId);
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void onInit() {
  //   var value = GetLocalStorage.getUserIdAndToken("uId");
  //   getWishListData(value!).then((value) {
  //     print("abcd");
  //     print(value);
  //     allWishlist = value;
  //   });
  //   print("all wish list");
  //   print(allWishlist);
  //   super.onInit();
  //   update();
  // }
}
