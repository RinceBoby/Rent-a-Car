import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxBool isBooked = false.obs;

  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: 
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day+1,
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
}
