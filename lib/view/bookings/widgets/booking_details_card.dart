import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: size.width,
      decoration: BoxDecoration(
        color: kGrey,
        borderRadius: kRadius05,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Car: " + "Car Name",
              style: TextStyle(
                color: kBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight10,
            const Text(
              "Trip Starts: " + "Start Date",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            kHeight10,
            const Text(
              "Trip Ends: " + "End Date",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            kHeight15,
            const Text(
              "Rent: " + "Total Amount",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            kHeight15,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white60,
                shape: RoundedRectangleBorder(
                  borderRadius: kRadius10,
                  side: const BorderSide(
                    color: kRed,
                    width: 2,
                  ),
                ),
              ),
              label: const Text(
                "Cancel Booking",
                style: TextStyle(
                  color: kRed,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(
                CupertinoIcons.clear_circled,
                color: kRed,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
