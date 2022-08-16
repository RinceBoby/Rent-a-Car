import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/bookings/booking_details.dart';
import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../widgets/custom_appBar.dart';
import '../wishlist/wishlist.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController dateController = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              CupertinoIcons.arrow_left,
              size: 25,
            ),
          ),
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
                            height: 300,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: kRadius05,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://wallpaperaccess.com/full/1288141.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          kHeight20,
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  //
                                  //<<<<<Car_Name>>>>>//
                                  Text(
                                    "Lamborgini",
                                    style: TextStyle(
                                      color: kText,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  kHeight10,
                                ],
                              ),
                              const Spacer(),

                              //<<<<<Review>>>>>//
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

                          //<<<<<Seat_Fuel_Milage>>>>>//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DetailCard(size, "Seats: ", "4"),
                              DetailCard(size, "Fuel: ", "P"),
                              DetailCard(size, "Milage: ", "12"),
                            ],
                          ),
                          kHeight10,

                          //<<<<<Location_Number_Date>>>>>//
                          VehicleDetailsCard(
                              size, "Pick Up Location", "Cochin"),
                          kHeight10,
                          VehicleDetailsCard(
                              size, "Vehicle Number", "KL 38 G 7571"),
                          kHeight10,
                          VehicleDetailsCard(
                              size, "Registred Date", "11-Nov-2021"),
                          kHeight15,

                          //<<<<<Booking_Date>>>>>//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const TextInLine(
                                  text: "Choose Your Booking Date", size: 22),
                              kHeight15,
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: size.width * .4,
                                      child: DateField(
                                        "Trip Start",
                                        () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('dd/mm/yyyy')
                                                    .format(pickedDate);
                                            setState(
                                              () {
                                                dateController.text =
                                                    formattedDate;
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  kWidth05,
                                  const Text(
                                    "to",
                                    style: TextStyle(
                                      color: kWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  kWidth05,
                                  Expanded(
                                    child: SizedBox(
                                      width: size.width * .4,
                                      child: DateField(
                                        "Trip End",
                                        () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('dd/mm/yyyy')
                                                    .format(pickedDate);
                                            setState(
                                              () {
                                                dateController.text =
                                                    formattedDate;
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight15,
                              Container(
                                height: 55,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: fieldColor, borderRadius: kRadius30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Total Days: 0 Days",
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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
                                children: const [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      color: kText,
                                      fontSize: 22,
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
                            ),
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
                          onPressed: () => Get.to(BookingDetails()),
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
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  //
  //<<<<<Date_Field>>>>>//
  DateField(
    String label,
    VoidCallback ontap,
  ) {
    return TextField(
      controller: dateController,
      onTap: ontap,
      style: const TextStyle(
        color: kWhite,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: "dd/dd/yyyy",
        hintStyle: const TextStyle(color: kGrey),
        labelStyle: TextStyle(color: kWhite.withOpacity(.5)),
        border: const OutlineInputBorder(),
        prefixIcon:
            Icon(CupertinoIcons.calendar_today, color: kWhite.withOpacity(.5)),
        filled: true,
        fillColor: fieldColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhite),
        ),
      ),
    );
  }

  //<<<<Seat_Fuel_Milage>>>>//
  DetailCard(
    Size size,
    String title,
    String subtitle,
  ) {
    return Container(
      height: 40,
      width: size.width * .305,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: kRadius30,
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
VehicleDetailsCard(
  Size size,
  String ques,
  String ans,
) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: fieldColor,
      borderRadius: kRadius30,
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
