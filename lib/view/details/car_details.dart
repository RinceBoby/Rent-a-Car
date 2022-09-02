import 'package:carmarket/controllers/car_details_controller.dart';
import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/car/car_model.dart';
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
  DetailsPage({required this.id, Key? key}) : super(key: key);

  WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    // CarController carController = Get.find<CarController>();
    DetailsController detailsController = Get.put(DetailsController());
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
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      id.brand,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: kText,
                                        fontSize: 26,
                                        // fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    kWidth05,
                                    Flexible(
                                      child: Text(
                                        id.model,
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
                                  final userId =
                                      GetLocalStorage.getUserIdAndToken("uId");

                                  return wishlistController.isWish.value != true
                                      ? IconButton(
                                          onPressed: () {
                                            wishlistController
                                                .addToWishlistItem(
                                              carId: id.id,
                                              uId: userId!,
                                            );
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.heart,
                                            color: kWhite,
                                            size: 32,
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            wishlistController
                                                .removeFromWishlistItem(
                                              carId: id.id,
                                              uId: userId!,
                                            );
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.heart_solid,
                                            color: kRed,
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

                          //<<<<<Booking_Date>>>>>//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const TextInLine(
                                  text: "Choose Your Booking Date", size: 22),
                              kHeight20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                                      // fontWeight:
                                                      //     FontWeight.bold,
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
                                                  // fontWeight: FontWeight.bold,
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
                        //<<<<<Rent_Per_day>>>>>//
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Obx(
                            //   () {
                            //     return detailsController.isBooked.value != true
                            //         ? const Text(
                            //             "Rent per Day",
                            //             style: TextStyle(
                            //               color: kText,
                            //               fontSize: 16,
                            //             ),
                            //           )
                            //         :
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
                          onPressed: () => Get.to(BookingDetails(
                            cars: id,
                          )),
                          style: ElevatedButton.styleFrom(
                              primary: kWhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: kRadius30),
                              fixedSize: Size(size.width * .5, 50)),
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
