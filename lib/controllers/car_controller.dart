import 'package:carmarket/services/car_services.dart';
import 'package:get/get.dart';

import '../models/car/car_model.dart';

class CarController extends GetxController {
  List<carDetails> allCars = [];

  RxBool loading = true.obs;
  Future<List<carDetails>> getCars(String url) async {
    loading.value = true;
    try {
      var data = await carServices.carDetailsService(url);
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
    getCars("/getcarData").then((value) => allCars = value);
    super.onInit();
    // update();
  }
}
