// ignore_for_file: avoid_print

import 'package:carmarket/controllers/bookings_controller.dart';
import 'package:carmarket/models/booking/bookings_model.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookingsServices {
  //
  //<<<<<Pending_Trips>>>>>//
  static Future<List<BookingData>?> pendingTripsService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');

    try {
      var response =
          await DioClient.dio.post('/bookingdata', data: {'userId': userId});
      BookingsModel bookingsData = BookingsModel.fromJson(response.data);
      print("Pending trips are here!");
      return bookingsData.bookingData;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      print("Pending trips error!");
      return null;
    }
  }

  //<<<<<Completed_Trips>>>>>//
  static Future<List<BookingData>?> completedTripsService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    try {
      var response =
          await DioClient.dio.post('/completedtrips', data: {'userId': userId});
      BookingsModel bookingsData = BookingsModel.fromJson(response.data);
      print("Completed bookings are here!");
      return bookingsData.bookingData;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      print("Completed trips error!");
      return null;
    }
  }

  //<<<<<Cancelled_Trips>>>>>//
  static Future<List<BookingData>?> cancelledTripsService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    try {
      var response =
          await DioClient.dio.post('/cancelledtrips', data: {'userId': userId});
      BookingsModel bookingsData = BookingsModel.fromJson(response.data);
      print("Cancelled bookings are here!");
      return bookingsData.bookingData;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      print("Cancelled trips error!");
      return null;
    }
  }

  //<<<<<Cancell_Trip>>>>>//
  static Future cancelTripService(String carId) async {
    try {
      BookingsController bookingsController = Get.find<BookingsController>();
      var response = await DioClient.dio.post('/cancel/$carId');
      bookingsController.pendingTripData();
      Get.snackbar("Message", response.data);
      return response.data!;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
