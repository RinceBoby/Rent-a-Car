import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class CompletedCancelledCard extends StatelessWidget {
  CompletedCancelledCard({
    required this.carName,
    required this.sDate,
    required this.eDate,
    required this.amt,
    required this.status,
    required this.btnClr,
    required this.txtClr,
    Key? key,
  }) : super(key: key);
  String carName;
  String sDate;
  String eDate;
  int amt;
  String status;
  Color btnClr;
  Color txtClr;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Car: $carName",
          style: const TextStyle(
            color: kBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight10,
        Text(
          "Trip Starts: $sDate",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        kHeight10,
        Text(
          "Trip Ends: $eDate",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        kHeight15,
        Text(
          "Rent: $amt",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        kHeight15,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: kGrey,
            shape: RoundedRectangleBorder(
              borderRadius: kRadius10,
              side:  BorderSide(
                color: btnClr,
                width: 2,
              ),
            ),
          ),
          child:  Text(
            status,
            style: TextStyle(
              color: txtClr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}