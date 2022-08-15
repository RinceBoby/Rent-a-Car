import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/offer/processed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeAnOffer extends StatelessWidget {
  const MakeAnOffer({Key? key}) : super(key: key);

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
          "Make an Offer",
          style: TextStyle(
            color: kText,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //<<<<<Send_Offer>>>>>//
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kHeight20,
                const Text(
                  "Enter your offer amount",
                  style: TextStyle(
                    color: kText,
                    fontSize: 20,
                  ),
                ),
                kHeight20,
                const TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: fieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: kText),
                    ),
                  ),
                  style: TextStyle(
                    color: kText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                kHeight30,
                // Container(),
                ElevatedButton(
                  onPressed: () => Get.to(const OfferProcessed()),
                  style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: kRadius30,
                      ),
                      fixedSize: Size(size.width * .85, 50)),
                  child: const Text(
                    "Send Offer",
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
