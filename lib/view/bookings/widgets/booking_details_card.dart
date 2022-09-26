import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:carmarket/view/constants/spaces/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsCard extends StatelessWidget {
  BookingDetailsCard({
    Key? key,
    required this.size,
    required this.carname,
    required this.start,
    required this.end,
    required this.amount,
    this.snackbar,
    this.button,
  }) : super(key: key);

  final Size size;
  String carname;
  String start;
  String end;
  int amount;
  VoidCallback? button;
  SnackbarController? snackbar;

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
            Text(
              "Car: $carname",
              style: const TextStyle(
                color: kBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight10,
            Text(
              "Trip Starts: $start",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            kHeight10,
            Text(
              "Trip Ends: $end",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            kHeight15,
            Text(
              "Rent: $amount",
              style: const TextStyle(
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
                button;
                snackbar;
              },
            ),
          ],
        ),
      ),
    );
  }
}
