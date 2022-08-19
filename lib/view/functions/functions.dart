import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

getSnackBar(String value) {
  Get
    ..closeAllSnackbars()
    ..showSnackbar(
      GetSnackBar(
        // backgroundColor: kWhite,
        borderRadius: 30,
        title: "Warning",
        message: value,
        duration: const Duration(seconds: 3),
      ),
    );
}
