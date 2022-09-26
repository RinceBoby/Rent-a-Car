import 'package:carmarket/controllers/bookings_controller.dart';
import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:carmarket/view/constants/spaces/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/completed_cancel_card.dart';

class CancelledBooking extends StatelessWidget {
  CancelledBooking({Key? key}) : super(key: key);

  BookingsController cancelledController = Get.find<BookingsController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(
              () {
                return cancelledController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : cancelledController.pendingTrips.isEmpty
                        ? const Center(
                            child: Text(
                              "No cancelled trips!",
                              style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                cancelledController.cancelledTrips.length,
                            itemBuilder: (context, index) {
                              var data =
                                  cancelledController.cancelledTrips[index];
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
                                    child: CompletedCancelledCard(
                                      carName: data.carname!,
                                      sDate: data.startDate!,
                                      eDate: data.endDate!,
                                      amt: data.payedAmount!,
                                      status: "Cancelled",
                                      btnClr: kRed,
                                      txtClr: kRed,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}
