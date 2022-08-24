// ignore_for_file: avoid_print

import 'package:carmarket/services/car/car_services.dart';
import 'package:get/get.dart';

import '../models/car/car_model.dart';

class CarController extends GetxController {
  List<carDetails> allCars = [];

  RxBool loading = true.obs;
  Future<List<carDetails>> getCars(String url, String key) async {
    loading.value = true;

    try {
      var data = await CarServices.carDetailsService(url,key);
      loading.value = false;
      return data!;
    } catch (e) {
      loading.value = false;
      print(e);

      return [];
    }
  }

  @override
  void onInit() {
    getCars("/getcarData","data").then((value) => allCars = value);
    super.onInit();
    // update();
  }
}
