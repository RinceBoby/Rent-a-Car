import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/details/car_details.dart';
import 'package:carmarket/view/widgets/car_card.dart';
import 'package:carmarket/view/widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';

class TopDeals extends StatefulWidget {
  const TopDeals({Key? key}) : super(key: key);

  @override
  State<TopDeals> createState() => _TopDealsState();
}

class _TopDealsState extends State<TopDeals> {
  
  List<String> brands = [
    "All",
    "Mercedes",
    "Volvo",
    "BMW",
    "Tesla",
    "Land Rover",
    "Toyota",
    "Rolls Royce",
    "Audi",
    "Lexus",
  ];

  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                kHeight10,
                CustomAppBar(
                  leadIcon: CupertinoIcons.arrow_left,
                  leadOnTap: () => Get.back(),
                  title: "Top Deals",
                  trailIcon: CupertinoIcons.search,
                  trailOnTap: () {},
                ),
                kHeight10,

                //<<<<<Brand_List>>>>>//
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    separatorBuilder: (context, index) => kWidth10,
                    itemBuilder: (context, index) =>
                        RoundTabItem(text: brands[index], index: index),
                  ),
                ),
                kHeight15,

                //<<<<<Car_List>>>>>//
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GridView.builder(
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 4,
                      childAspectRatio: 1.1 / 1.5,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => CarCard(
                      ontap: () => Get.to(DetailsPage()),
                    ),
                  ),
                )
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
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  RoundTabItem({required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tappedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: tappedIndex == index
              ? Border.all(color: Colors.transparent)
              : Border.all(color: kGrey),
          borderRadius: kRadius30,
          color: tappedIndex == index ? fieldColor : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
