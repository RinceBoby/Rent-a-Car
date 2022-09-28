// ignore_for_file: avoid_print
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  //
  String? userId = GetLocalStorage.getUserIdAndToken('uId');
  List<String> wishlistCar = [];
  RxList? wishlistId = [].obs;
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
  Future getWishListData({required String userId}) async {
    try {
      var response = await WishlistServices.getWishListData(userId: userId);
      wishlistId!.value = response!;
      print(response);
      // update();
    } catch (e) {
      print(e);

      return [];
    }
  }

  @override
  void onInit() {
    getWishListData(userId: userId!);
    super.onInit();
  }
}
