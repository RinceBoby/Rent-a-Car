import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/checkout/check_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OfferAccepted extends StatelessWidget {
  const OfferAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: kText,
          ),
        ),
        title: const Text(
          "Your offer",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //<<<<<Accepted>>>>>//
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight75,
              SizedBox(
                height: 200,
                width: size.width,
                child: Lottie.asset("assets/accepted.json"),
              ),
              kHeight20,
              const Text(
                "Congrats!\nYour offer has been accepted!",
                style: TextStyle(
                  color: kWhite,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              kHeight40,
              const Text(
                "Your offer has been accepted by the dealer for\n₹ 12 L",
                style: TextStyle(
                  color: kText,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              kHeight150,
              ElevatedButton(
                onPressed: () => Get.to(const CheckoutItem()),
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: kRadius30,
                  ),
                  fixedSize: Size(size.width * .9, 50),
                ),
                child: const Text(
                  "Proceed to checkout!",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
