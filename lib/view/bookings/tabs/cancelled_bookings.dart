import 'package:carmarket/controllers/bookings_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelledBooking extends StatelessWidget {
  CancelledBooking({Key? key}) : super(key: key);

  BookingsController bookingsController = Get.find<BookingsController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: bookingsController.cancelledTrips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: kRadius10,
                                side: const BorderSide(
                                  color: kRed,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Cancelled",
                              style: TextStyle(
                                color: kRed,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
