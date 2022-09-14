// ignore_for_file: avoid_print

import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:dio/dio.dart';

class CarServices {
  static Future<List<carDetails>?> carDetailsService(String url, String key,
      {bool isSearch = false, String? brand}) async {
    try {
      var response = isSearch
          ? await DioClient.dio.post(url, data: {'searchText': brand})
          : await DioClient.dio.get(url);

      //<<<<<Json_Decode>>>>>//
      CarModel allCarDetails = CarModel.fromJson(response.data, key);
      // print(allCarDetails.data);
      return allCarDetails.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  //<<<<<Sort_Car>>>>>//
  static Future<List<carDetails>?> sortCarServices(
      {required String place}) async {
    try {
      var response = await DioClient.dio.post('/searchdistrict', data: {
        'place': place,
      });

      //<<<<<Json_Decode>>>>>//
      CarModel filterCarModel = CarModel.fromJson(response.data, 'data');
      return filterCarModel.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  //<<<<<Single_Car>>>>>//
  static Future<carDetails?> getSingleCarDetails(
      {required String carId}) async {
    try {
      var response = await DioClient.dio.post('/GetSingleCar/$carId');
      print(response.data);
      carDetails? singleCarDetails = carDetails.fromJson(response.data);
      print(singleCarDetails.brand);
      return singleCarDetails;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  //<<<<<Car_Search>>>>>//

}
