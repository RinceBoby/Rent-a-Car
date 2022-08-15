import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/details/car_details.dart';
import 'package:carmarket/view/widgets/car_card.dart';
import 'package:carmarket/view/widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

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
                kHeight05,
                //<<<<<App_Bar>>>>>//
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomAppBar(
                    leadIcon: CupertinoIcons.arrow_left,
                    leadOnTap: () => Get.back(),
                    title: "Wishlist",
                    trailIcon: CupertinoIcons.search,
                    trailOnTap: () {},
                  ),
                ),

                //<<<<<Car_List>>>>>//
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.1 / 1.5,
                      crossAxisSpacing: 10,
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 4,
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
}
