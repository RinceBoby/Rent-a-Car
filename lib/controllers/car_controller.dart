// ignore_for_file: avoid_print

import 'package:carmarket/services/car/car_services.dart';
import 'package:get/get.dart';

import '../models/car/car_model.dart';

class CarController extends GetxController {
  RxList<carDetails> allCars = <carDetails>[].obs;

  RxBool loading = true.obs;
  Future<List<carDetails>> getCars(String url, String key,
      {bool isSearch = false, String? brand}) async {
    loading.value = true;
    try {
      var data = await CarServices.carDetailsService(
        url,
        key,
        isSearch: isSearch,
        brand: brand,
      );
      loading.value = false;
      return data!;
    } catch (e) {
      loading.value = false;
      print(e);
      return [];
    }
  }

  //<<<<<Sort_Car>>>>>//
  Future<List<carDetails>?> sortCarData({required String place}) async {
    loading.value = true;
    try {
      var response = await CarServices.sortCarServices(place: place);

      loading.value = false;
      return response;
    } catch (e) {
      print(e);
      loading.value = false;
      return [];
    }
  }

  @override
  void onInit() {
    getCars("/getcarData", "data").then((value) => allCars.value = value);
    super.onInit();
  }
}
