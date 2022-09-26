// ignore_for_file: must_be_immutable

import 'package:carmarket/models/booking/booking_model.dart';
import 'package:carmarket/view/payment/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/styles/colors.dart';
import '../constants/spaces/dimensions.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({required this.bookingModel, Key? key}) : super(key: key);

  BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Booking Details",
            style: TextStyle(
              color: kText,
              fontSize: 26,
            ),
          ),
          actions: const [
            Icon(
              CupertinoIcons.ellipsis_circle,
              size: 30,
              color: kText,
            ),
            kWidth10,
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: size.width * .95,
                    height: 550,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: kRadius25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookingDetailsField(
                          "Car Name",
                          bookingModel.carName,
                          CupertinoIcons.car_detailed,
                        ),
                        BookingDetailsField(
                          "Trip Start",
                          bookingModel.tripStart,
                          CupertinoIcons.calendar_today,
                        ),
                        BookingDetailsField(
                          "Trip Ends",
                          bookingModel.tripEnd,
                          CupertinoIcons.calendar_today,
                        ),
                        BookingDetailsField(
                          "Pickup Location",
                          bookingModel.location!,
                          CupertinoIcons.map_pin_ellipse,
                        ),
                        BookingDetailsField(
                          "Amount",
                          bookingModel.amount.toString(),
                          CupertinoIcons.creditcard,
                        ),
                        BookingDetailsField(
                          "Contact No",
                          "+918606004313",
                          CupertinoIcons.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight30,

                //<<<<<Payment>>>>>//
                RazorPay(bookingModel: bookingModel),

                kHeight30,
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  //
  //
  //
  BookingDetailsField(
    String title,
    String subTitle,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight20,
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Icon(icon, size: 35),
              ),
              kWidth20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kGrey,
                    ),
                  ),
                  kHeight10,
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                    ),
                  ),
                ],
              )
            ],
          ),
          kHeight15,
        ],
      ),
    );
  }
}
