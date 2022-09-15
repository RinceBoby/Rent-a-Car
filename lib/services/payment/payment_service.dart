// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carmarket/models/booking/booking_model.dart';
import 'package:carmarket/services/dio/dio_client.dart';
import 'package:carmarket/view/home/bottom_nav.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../models/local_storage/local_storage.dart';

class PaymentService {
  static Future razorpayService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');

    try {
      var response = await DioClient.dio.post('/razorpay');
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }

  //<<<<<Razorpay_Success>>>>>//
  static Future razorpaySuccess(BookingModel bookingModel) async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    String? userName = GetLocalStorage.getUserIdAndToken('name');
    String? userEmail = GetLocalStorage.getUserIdAndToken('email');

    Map payload = {
      'USERMAIL': userEmail,
      'USERID': userId,
      'USERNAME': userName,
      'amount': bookingModel.amount,
      'carName': bookingModel.carName,
      'end': bookingModel.tripEnd,
      'start': bookingModel.tripStart,
    };

    try {
      var response = await DioClient.dio.post(
        '/razorpaysuccess/${bookingModel.id!}',
        data: jsonEncode(payload),
      );
      print("sdhfgbjkhsbdfvkasv");

      Get.offAll(const BottomNavBar());

      return response.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
