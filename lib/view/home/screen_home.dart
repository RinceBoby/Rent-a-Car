import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/controllers/signup_controller.dart';
import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:carmarket/view/widgets/carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../details/car_details.dart';
import '../wishlist/wishlist.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarController carController = Get.put(CarController());
    SignupController signupController = Get.put(SignupController());
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            HomeSliverAppBar(),
          ],
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    kHeight10,

                    //<<<<<Carousel>>>>>//
                    const CarCarousel(),
                    kHeight15,

                    //<<<<<Choose_Your_Car>>>>>//
                    const TextInLine(
                      text: "CHOOSE YOUR CAR",
                      size: 24,
                      thickness: 3,
                    ),
                    kHeight20,

                    //<<<<<Car_Card>>>>>//
                    Obx(() {
                      if (carController.loading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: carController.allCars.length,
                        itemBuilder: (context, index) {
                          final data = carController.allCars[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailsPage(id: data),
                                );
                              },
                              child: Container(
                                height: 340,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kWhite),
                                  color: fieldColor,
                                  borderRadius: kRadius20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: size.width * .99,
                                      decoration: BoxDecoration(
                                        color: fieldColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(data.imgUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    kHeight10,

                                    //<<<<<Bottom>>>>>//
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //<<<<<Car_Name>>>>>//
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data.brand,
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: kText,
                                                  letterSpacing: 1,
                                                ),
                                              ),

                                              //<<<<<Price>>>>>//
                                              Chip(
                                                avatar: const Icon(Icons
                                                    .currency_rupee_rounded),
                                                label: Text(
                                                  "${data.price} / day",
                                                  style: const TextStyle(
                                                    color: kBlack,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        kHeight05,

                                        //<<<<<Divider>>>>>//
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Divider(
                                            thickness: 1,
                                            color: kWhite,
                                          ),
                                        ),
                                        kHeight05,

                                        //<<<<<Details>>>>>//
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                            height: 45,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 1,
                                              separatorBuilder:
                                                  (context, index) => kWidth05,
                                              itemBuilder: (context, index) =>
                                                  Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  //
                                                  //<<<<Seats>>>>//
                                                  DetailChip(
                                                    data,
                                                    data.seats.toString(),
                                                    Icons
                                                        .airline_seat_recline_extra_sharp,
                                                  ),
                                                  kWidth10,

                                                  //<<<<<Fuel>>>>>//
                                                  DetailChip(
                                                    data,
                                                    data.fueltype.name,
                                                    Icons
                                                        .local_gas_station_rounded,
                                                  ),
                                                  kWidth10,

                                                  //<<<<<Mileage>>>>>//
                                                  DetailChip(
                                                    data,
                                                    "${data.mileage} / Km",
                                                    CupertinoIcons.drop_fill,
                                                  ),
                                                  kWidth10,

                                                  //<<<<<Location>>>>>//
                                                  DetailChip(
                                                    data,
                                                    data.location,
                                                    CupertinoIcons
                                                        .map_pin_ellipse,
                                                  ),
                                                  kWidth10,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),

        //<<<<<FAB>>>>>//
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: kBlack,
          children: [
            //
            //<<<<<Search>>>>>//
            SpeedDialChild(
              backgroundColor: kBlack,
              child: const Icon(
                CupertinoIcons.search,
                color: kWhite,
              ),
              label: "Search",
              labelStyle: const TextStyle(color: kWhite),
              labelBackgroundColor: kBlack,
              onTap: () {},
            ),

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
                            shape:
                                RoundedRectangleBorder(borderRadius: kRadius05),
                          ),
                          kHeight15,
                          //
                          //<<<<<L2H>>>>>//
                          ElevatedButton.icon(
                            onPressed: () {
                              carController.getCars("/lowtohigh", "sort").then(
                                  (value) => carController.allCars = value);
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: fieldColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: kRadius05),
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
                              carController
                                  .getCars("/hightolow", "sorttwo")
                                  .then(
                                      (value) => carController.allCars = value);
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: fieldColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: kRadius05),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  carController
                                      .getCars("/searchdistrict", "location")
                                      .then((value) =>
                                          carController.allCars = value);
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
        ),
      ),
    );
  }

  //
  //
  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  //
  //<<<<<App_Bar>>>>>//
  // ignore: non_constant_identifier_names
  SliverAppBar HomeSliverAppBar() {
    ProfileController profileController = Get.put(ProfileController());
    // ProfileModel? userData = profileController.profileModel.value;
    // if(userData ==null){
    //   return "";
    // }
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: false,
      automaticallyImplyLeading: false,
      title: Obx(() {
        ProfileModel? userData = profileController.profileModel.value;
        if (userData!.name == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Row(
          children: [
            const CircleAvatar(
              backgroundColor: kWhite,
              radius: 27,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pinimg.com/564x/20/5a/c8/205ac833d83d23c76ccb74f591cb6000.jpg",
                ),
                radius: 25,
              ),
            ),
            kWidth15,
            Text(
              userData.name!.capitalize!,
              style: const TextStyle(
                color: kText,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }),
      actions: [
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
        kWidth15,
      ],
    );
  }

  //<<<<<<<<<<<<<Detail_chip>>>>>>>>>>>>>//
  // ignore: non_constant_identifier_names
  DetailChip(
    carDetails data,
    String text,
    IconData icon,
  ) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: kBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      avatar: Icon(icon),
    );
  }
}
