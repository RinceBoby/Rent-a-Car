import 'package:carmarket/controllers/bookings_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingBookings extends StatelessWidget {
  PendingBookings({Key? key}) : super(key: key);

  BookingsController pendingController = Get.put(BookingsController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () {
            return pendingController.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : pendingController.pendingTrips.isEmpty
                    ? const Center(
                        child: Text(
                          "No pending trips!",
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: pendingController.pendingTrips.length,
                            itemBuilder: (context, index) {
                              var data = pendingController.pendingTrips[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: bookingDetailsCard(
                                  size: size,
                                  carname: data.carname!,
                                  start: data.startDate!,
                                  end: data.endDate!,
                                  amount: data.payedAmount!,
                                  onPressed: () {
                                    BookingsController bookingsController =
                                        Get.find<BookingsController>();
                                    bookingsController
                                        .cancelTripData(data.sId!);
                                    Get.snackbar(
                                        "Message", "Booking Cancelled!");
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }

  //
  /////////////////////
  //-----WIDGET-----//
  /////////////////////
  //
  bookingDetailsCard({
    required Size size,
    required String carname,
    required String start,
    required String end,
    required int amount,
    required VoidCallback onPressed,
  }) {
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
            kHeight05,
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
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
