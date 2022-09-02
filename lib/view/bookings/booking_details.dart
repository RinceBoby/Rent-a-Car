import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/car_details_controller.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/profile_controller.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({Key? key, this.cars}) : super(key: key);
  carDetails? cars;

  @override
  Widget build(BuildContext context) {
    CarController carController = Get.put(CarController());
    DetailsController detailsController = Get.put(DetailsController());
    ProfileController profileController = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    ProfileModel? userData = profileController.profileModel.value;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: kText,
              size: 30,
            ),
          ),
          title: const Text(
            "Booking Details",
            style: TextStyle(
              color: kText,
              fontSize: 26,
              // fontWeight: FontWeight.bold,
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
                          "Car Name", cars!.brand, CupertinoIcons.car_detailed),
                      BookingDetailsField("Customer Name",
                          userData!.name!.capitalize!, CupertinoIcons.person),
                      BookingDetailsField(
                          "Trip Start",
                          DateFormat("dd-MM-yyyy")
                              .format(detailsController.dateRange.value.start)
                              .toString(),
                          CupertinoIcons.calendar_today),
                      BookingDetailsField(
                          "Trip Ends",
                          DateFormat("dd-MM-yyyy")
                              .format(detailsController.dateRange.value.end)
                              .toString(),
                          CupertinoIcons.calendar_today),
                      BookingDetailsField("Pickup Location", cars!.location,
                          CupertinoIcons.map_pin_ellipse),
                      BookingDetailsField("Our Helpline;", "+918606004313",
                          CupertinoIcons.phone),
                    ],
                  ),
                ),
              ),
              kHeight30,

              //<<<<<Pay>>>>>//
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                  shape: RoundedRectangleBorder(borderRadius: kRadius30),
                  fixedSize: Size(size.width * .9, 50),
                ),
                child: const Text(
                  "Pay",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                  ),
                ),
              ),
              kHeight30,
            ],
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
