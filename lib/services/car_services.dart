// ignore_for_file: avoid_print

import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/services/dio_client.dart';
import 'package:dio/dio.dart';

class carServices {
  static Future<List<carDetails>?> carDetailsService(String url) async {
    try {
      var response = await DioClient.dio.get(url);
      CarModel allCarDetails = CarModel.fromJson(response.data);
      return allCarDetails.data;
    } on DioError catch (e) {
      print("Dio Error");
      print(e.error);
      print(e.response!.statusMessage);
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
