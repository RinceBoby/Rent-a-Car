import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/colors.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Lottie.asset("assets/order_success_1.json"),
            ),
            kHeight15,
            const Text(
              "Order Successful !",
              style: TextStyle(
                color: kWhite,
                fontSize: 32,
              ),
            ),
            kHeight30,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: kWhite,
                shape: RoundedRectangleBorder(borderRadius: kRadius30),
                fixedSize: Size(size.width * .5, 50),
              ),
              child: const Text(
                "View Order",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
