import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/offer/make_an_offer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../widgets/custom_appBar.dart';
import '../wishlist/wishlist.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
  }) : super(key: key);
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                          //<<<<<App_Bar>>>>>//
                          CustomAppBar(
                            leadOnTap: () => Get.back(),
                            leadIcon: CupertinoIcons.arrow_left,
                            title: "",
                          ),

                          //<<<<<Car_Image>>>>>//
                          Container(
                            height: 300,
                            width: size.width,
                            color: Colors.amberAccent,
                          ),
                          kHeight20,
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //<<<<<Car_Name>>>>>//
                                  const Text(
                                    "Lamborgini",
                                    style: TextStyle(
                                      color: kText,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  kHeight10,

                                  // //<<<<<Rating>>>>>//
                                  // Row(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     SizedBox(
                                  //       width: 120,
                                  //       child: RatingBar.builder(
                                  //         initialRating: 3,
                                  //         minRating: 1,
                                  //         direction: Axis.horizontal,
                                  //         allowHalfRating: true,
                                  //         itemCount: 5,
                                  //         itemSize: 20,
                                  //         itemPadding:
                                  //             const EdgeInsets.only(right: 4),
                                  //         itemBuilder: (context, index) =>
                                  //             const Icon(
                                  //           CupertinoIcons.star_fill,
                                  //           color: kStar,
                                  //         ),
                                  //         onRatingUpdate: (rating) {},
                                  //         // setState(() {
                                  //         //   this.rating = rating;
                                  //         // }),
                                  //       ),
                                  //     ),
                                  //     kWidth15,
                                  //     Text(
                                  //       "$rating",
                                  //       style: const TextStyle(
                                  //         color: kText,
                                  //         fontSize: 20,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              const Spacer(),

                              ////
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.chat_bubble_text,
                                  color: kText,
                                  size: 32,
                                ),
                              ),
                              kWidth20,

                              //<<<<<Fav_Icon>>>>>//
                              GestureDetector(
                                onTap: () => Get.to(const Wishlist()),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                    "assets/fav-icon.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // kWidth10,
                            ],
                          ),
                          kHeight15,

                          //<<<<<Details>>>>>//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //<<<<<Seat>>>>>//
                              DetailCard(size, "Seats: ", "4"),
                              //<<<<<Fuel_Type>>>>>//
                              DetailCard(size, "Fuel: ", "P"),
                              //<<<<<Milage>>>>>//
                              DetailCard(size, "Milage: ", "12"),
                            ],
                          ),
                          kHeight10,

                          //<<<<<Location>>>>>//
                          VehicleDetailsCard(
                            size,
                            "Pick Up Location",
                            "Cochin",
                          ),
                          kHeight10,
                          //<<<<<Vehicle_Number>>>>>//
                          VehicleDetailsCard(
                            size,
                            "Vehicle Number",
                            "KL 38 G 7571",
                          ),
                          kHeight10,
                          VehicleDetailsCard(
                            size,
                            "Registred Date",
                            "11-Nov-2021",
                          ),
                          kHeight15,

                          //<<<<<Booking_Date>>>>>//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Choose Your Booking Date",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kHeight10,
                              SizedBox(),
                            ],
                          ),
                          kHeight15,

                          //<<<<<Description>>>>>//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Description",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kHeight05,
                              ReadMoreText(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
                                trimLines: 3,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Show more",
                                trimExpandedText: "Show less",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                                moreStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: kText,
                                ),
                              ),
                            ],
                          ),
                          kHeight15,

                          //<<<<<Details>>>>>//
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rent per Day",
                              style: TextStyle(
                                color: kText,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "₹ 56,000",
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),

                        //<<<<<Book_Now>>>>//
                        ElevatedButton(
                          onPressed: () => Get.to(const MakeAnOffer()),
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

//
//
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<a>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
//
//
  Container DetailCard(
    Size size,
    String title,
    String subtitle,
  ) {
    return Container(
      height: 40,
      width: size.width * .305,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: kRadius05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: kWhite,
            ),
          ),
          kHeight05,
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 22,
              color: kWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//Vehicle_Details_card//
Container VehicleDetailsCard(
  Size size,
  String ques,
  String ans,
) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: fieldColor,
      borderRadius: kRadius05,
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
          width: size.width * .4,
          child: Text(
            ans,
            style: const TextStyle(
              fontSize: 22,
              color: kWhite,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

//<<<<<Appbar_Widget>>>>>//
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.leadIcon,
    required this.trailIcon,
    required this.leadOnTap,
  }) : super(key: key);

  final String trailIcon;
  final IconData leadIcon;
  final VoidCallback leadOnTap;

  @override
  Size get preferredSize => const Size.fromRadius(30);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: leadOnTap, icon: Icon(leadIcon)),
      actions: [
        SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(
            "assets/fav-icon.png",
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}
