// ignore_for_file: avoid_print

import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/services/car/car_services.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxBool isBooked = false.obs;
  Rx<carDetails?> carDetail = Rxn<carDetails>();
  String? carId;
  RxList? wishlistId = [].obs;

  DetailsController({required this.carId});
  
  String? userId = GetLocalStorage.getUserIdAndToken('uId');

  //<<<<<Date_&_Time>>>>>//
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    ),
  ).obs;

  Future chooseDateRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDateRange: dateRange.value,
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );
    if (picked != null && picked != dateRange.value) {
      dateRange.value = picked;
    }
    update();
  }

  totalDays() {
    DateTime startDate = dateRange.value.start;
    DateTime endDate = dateRange.value.end;

    int totalDays = endDate.difference(startDate).inDays;
    update();
    return totalDays;
  }

  
  getSingleCarDetails(String carId) async {
    carDetail.value = await CarServices.getSingleCarDetails(carId: carId);
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
    getSingleCarDetails(carId!);
    super.onInit();
  }
}
