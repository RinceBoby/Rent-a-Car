import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/signup_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class fab_SpeedDial extends StatelessWidget {
  const fab_SpeedDial({
    Key? key,
    required this.carController,
    required this.size,
    required this.orientation,
    required this.signupController,
  }) : super(key: key);

  final CarController carController;
  final Size size;
  final Orientation orientation;
  final SignupController signupController;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: kBlack,
      children: [
        //
        //<<<<<Filter>>>>>//
        SpeedDialChild(
          backgroundColor: kBlack,
          child: const Icon(
            CupertinoIcons.slider_horizontal_3,
            color: kWhite,
          ),
          label: "Filter",
          labelStyle: const TextStyle(color: kWhite),
          labelBackgroundColor: kBlack,
          onTap: () {
            showModalBottomSheet(
              backgroundColor: kWhite,
              shape: RoundedRectangleBorder(borderRadius: kRadius10),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        backgroundColor: kBlack,
                        label: const Text(
                          "FILTER",
                          style: TextStyle(
                            fontSize: 22,
                            color: kWhite,
                          ),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: kRadius05),
                      ),
                      kHeight15,
                      //
                      //<<<<<L2H>>>>>//
                      ElevatedButton.icon(
                        onPressed: () {
                          carController.getCars("/lowtohigh", "sort").then(
                              (value) => carController.allCars.value = value);
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: fieldColor,
                          shape:
                              RoundedRectangleBorder(borderRadius: kRadius05),
                          fixedSize: Size(size.width * .9, 50),
                        ),
                        icon: const Icon(
                          CupertinoIcons.tray_arrow_up_fill,
                          color: kWhite,
                          size: 30,
                        ),
                        label: const Text(
                          "Low to High",
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      kHeight15,

                      //<<<<<H2L>>>>>//
                      ElevatedButton.icon(
                        onPressed: () {
                          carController.getCars("/hightolow", "sorttwo").then(
                              (value) => carController.allCars.value = value);
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: fieldColor,
                          shape:
                              RoundedRectangleBorder(borderRadius: kRadius05),
                          fixedSize: Size(size.width * .9, 50),
                        ),
                        icon: const Icon(
                          CupertinoIcons.tray_arrow_down_fill,
                          color: kWhite,
                          size: 30,
                        ),
                        label: const Text(
                          "High to Low",
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        //<<<<<Sort>>>>>//
        SpeedDialChild(
          backgroundColor: kBlack,
          child: const Icon(
            CupertinoIcons.arrow_up_arrow_down,
            color: kWhite,
          ),
          label: "Sort",
          labelStyle: const TextStyle(color: kWhite),
          labelBackgroundColor: kBlack,
          onTap: () {
            showModalBottomSheet(
              backgroundColor: kBlack,
              shape: RoundedRectangleBorder(
                borderRadius: kRadius10,
              ),
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    kHeight10,
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: kRadius30,
                      ),
                      child: const Center(
                        child: Text(
                          "SORT BY DISTRICT",
                          style: TextStyle(
                              fontSize: 22,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    kHeight15,

                    //<<<<<Filter_By_Districts>>>>>//
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / .25,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 4,
                        ),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: signupController.districtItems.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          
                          child: InkWell(
                            onTap: () {
                              
                              // var place = signupController.dropdownValueChanging(newValue!, checkingValue);
                              // carController.sortCarData(place: place);

                              carController
                                  .getCars("/searchdistrict", "place")
                                  .then((value) =>
                                      carController.allCars.value = value);
                              Get.back();
                            },
                            child: Container(
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                color: fieldColor,
                                borderRadius: kRadius30,
                              ),
                              child: Center(
                                child: Text(
                                  signupController.districtItems[index]
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    kHeight10,
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
