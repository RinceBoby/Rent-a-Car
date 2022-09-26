// ignore_for_file: avoid_print

import 'package:carmarket/models/booking/bookings_model.dart';
import 'package:carmarket/services/booking/bookings_service.dart';
import 'package:get/get.dart';

class BookingsController extends GetxController {
  final loading = false.obs;
  RxList<BookingData> pendingTrips = <BookingData>[].obs;
  RxList<BookingData> completedTrips = <BookingData>[].obs;
  RxList<BookingData> cancelledTrips = <BookingData>[].obs;

  //<<<<<Pending_Trips>>>>>//
  Future<List<BookingData>> pendingTripData() async {
    try {
      var response = await BookingsServices.pendingTripsService();
      pendingTrips.value = response!;
      print("Trip pending!");
      return pendingTrips.value;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //<<<<<Completed_Trips>>>>>//
  Future<List<BookingData>> completedTripData() async {
    try {
      var response = await BookingsServices.completedTripsService();
      print("Trip completed!");
      return response!;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //<<<<<Cancelled_Trips>>>>>//
  Future<List<BookingData>> cancelledTripsData() async {
    try {
      var response = await BookingsServices.cancelledTripsService();
      print("Trip cancelled!");
      return response!;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //<<<<<Cancel_Trip_Data>>>>>//
  Future cancelTripData(String carId) async {
    try {
      var response = await BookingsServices.cancelTripService(carId);
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    pendingTripData().then((value) => pendingTrips.value = value);
    completedTripData().then((value) => completedTrips.value = value);
    cancelledTripsData().then((value) => cancelledTrips.value = value);
    super.onInit();
  }
}
