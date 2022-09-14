import 'package:carmarket/controllers/car_details_controller.dart';
import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/booking/booking_model.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/services/booking/booking_service.dart';
import 'package:carmarket/view/bookings/booking_details.dart';
import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../models/local_storage/local_storage.dart';

class DetailsPage extends StatelessWidget {
  carDetails id;
  String carId;
  DetailsPage({required this.id, required this.carId, Key? key})
      : super(key: key);

  WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    // CarController carController = Get.find<CarController>();

    DetailsController detailsController =
        Get.put(DetailsController(carId: carId));
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          //
                          //<<<<<Car_Image>>>>>//
                          Container(
                            height: 230,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: kRadius05,
                              image: DecorationImage(
                                image: NetworkImage(id.imgUrl.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          kHeight20,

                          //<<<<<Car_Name>>>>>//
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${id.brand} ${id.model}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: kText,
                                          fontSize: 26,
                                          // fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //<<<<<Fav_Icon>>>>>//
                              Obx(
                                () {
                                  List wishList =
                                      detailsController.wishlistId!.value;

                                  bool isWish = wishList
                                      .any((element) => element == carId);

                                  return IconButton(
                                    onPressed: () {
                                      String? userId =
                                          GetLocalStorage.getUserIdAndToken(
                                              'uId');

                                      if (!isWish) {
                                        wishlistController.addToWishlistItem(
                                            id.id, userId!);
                                      } else {
                                        wishlistController
                                            .removeFromWishlistItem(
                                                id.id, userId!);
                                      }
                                    },
                                    icon: isWish
                                        ? const Icon(
                                            CupertinoIcons.heart_solid,
                                            color: kRed,
                                            size: 32,
                                          )
                                        : const Icon(
                                            CupertinoIcons.heart,
                                            color: kWhite,
                                            size: 32,
                                          ),
                                  );
                                },
                              ),
                            ],
                          ),
                          kHeight15,

                          //<<<<<Description>>>>>//
                          Container(
                            decoration: BoxDecoration(
                              color: fieldColor,
                              borderRadius: kRadius05,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                      color: kText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  kHeight05,
                                  ReadMoreText(
                                    id.description,
                                    trimLines: 3,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: "Show more",
                                    trimExpandedText: "Show less",
                                    style: const TextStyle(
                                      color: kText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    moreStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: kText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          kHeight25,

                          //<<<<<Booking_Dates>>>>>//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const TextInLine(
                                  text: "Choose Your Booking Date", size: 22),
                              kHeight20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //
                                  //<<<<<From>>>>>//
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Start :",
                                          style: TextStyle(
                                            color: kGrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      kHeight05,
                                      InkWell(
                                        onTap: () {
                                          detailsController
                                              .chooseDateRangePicker();
                                        },
                                        child: SizedBox(
                                          width: size.width * .41,
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: fieldColor,
                                              borderRadius: kRadius20,
                                            ),
                                            child: Center(
                                              child: Obx(
                                                () {
                                                  return Text(
                                                    DateFormat("dd-MM-yyyy")
                                                        .format(
                                                            detailsController
                                                                .dateRange
                                                                .value
                                                                .start)
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: kWhite,
                                                      fontSize: 20,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //<<<<<To_Icon>>>>>//
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      width: size.width * .1,
                                      child: const Icon(
                                        CupertinoIcons.arrow_right_square_fill,
                                        color: kWhite,
                                      ),
                                    ),
                                  ),

                                  //<<<<<Until>>>>>//
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "End :",
                                          style: TextStyle(
                                            color: kGrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      kHeight05,
                                      SizedBox(
                                        width: size.width * .41,
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: fieldColor,
                                            borderRadius: kRadius20,
                                          ),
                                          child: Center(
                                            child: Obx(() {
                                              return Text(
                                                DateFormat("dd-MM-yyyy")
                                                    .format(detailsController
                                                        .dateRange.value.end)
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: kWhite,
                                                  fontSize: 20,
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              kHeight25,

                              //<<<<<Total_Days>>>>>//
                              Container(
                                height: 50,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: fieldColor, borderRadius: kRadius20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        "Total Days: ${detailsController.totalDays()}",
                                        style: const TextStyle(
                                          color: kWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          kHeight15,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //<<<<<Bottom_Bar>>>>>//
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Container(
                    color: kBlack,
                    height: 60,
                    child: Row(
                      children: [
                        //<<<<<Total_Amount>>>>>//
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total amount",
                              style: TextStyle(
                                color: kText,
                                fontSize: 16,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                "₹ ${id.price * detailsController.totalDays()}",
                                style: const TextStyle(
                                  color: kText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              );
                            }),
                          ],
                        ),
                        const Spacer(),

                        //<<<<<Book_Now>>>>//
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kWhite,
                            shape:
                                RoundedRectangleBorder(borderRadius: kRadius30),
                            fixedSize: Size(size.width * .5, 50),
                          ),
                          onPressed: () {
                            if (detailsController.totalDays() == 0) {
                              Get.snackbar(
                                "Warning",
                                "Pick a date to book.",
                                backgroundColor: kWhite,
                              );
                              return;
                            }
                            carDetails carModel =
                                detailsController.carDetail.value!;
                            var date = detailsController.dateRange.value;
                            BookingServices.bookCarService(
                              carModel.id,
                              "${date.start}",
                              "${date.end}",
                            );

                            BookingModel bookingModelDetails = BookingModel(
                              carName: "${carModel.brand}${carModel.model}",
                              id: carModel.id,
                              tripStart: "${date.start}",
                              tripEnd: "${date.end}",
                              amount:
                                  "${carModel.price * detailsController.totalDays()}",
                              location: carModel.location,
                            );

                            Get.to(BookingDetails(
                                bookingModel: bookingModelDetails));
                          },
                          child: const Text(
                            "Book Now",
                            style: TextStyle(
                              fontSize: 20,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
//
//
//Vehicle_Details_card//
VehicleDetailsCard(
  Size size,
  String ques,
  String ans,
) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: fieldColor,
      borderRadius: kRadius10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * .4,
          child: Text(
            ques,
            style: const TextStyle(
              color: kWhite,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: size.width * .1,
          child: const Text(
            ":",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ),
        ),
        SizedBox(
          width: size.width * .42,
          child: Text(
            ans,
            style: const TextStyle(
              fontSize: 18,
              color: kWhite,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
