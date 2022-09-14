// ignore_for_file: avoid_print

import 'package:carmarket/services/dio/dio_client.dart';
import 'package:dio/dio.dart';

class BookingServices {
  static Future bookCarService(
      String carId, String tripStart, String tripEnd) async {
    try {
      var response = await DioClient.dio.post('/checkdate',
          data: {'id': carId, 'val': tripStart, 'val2': tripEnd});
          print(response.data);
    }on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
