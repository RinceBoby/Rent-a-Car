import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/profile_controller.dart';
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

                    // <<<<<Car_Card>>>>>//
                    Obx(() {
                      if (carController.loading.value) {
                        return const Center(child: CircularProgressIndicator());
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
                                    Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: size.width * .99,
                                          decoration: BoxDecoration(
                                            color: fieldColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(data.imgUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                          //<<<<<Fav_Icon>>>>>//
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                right: 10,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Image.asset(
                                                  "assets/fav-icon.png",
                                                  height: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
            SpeedDialChild(
              backgroundColor: kBlack,
              child: const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: kWhite,
              ),
              label: "Filter",
              labelStyle: const TextStyle(color: kWhite),
              labelBackgroundColor: kBlack,
              onTap: () {},
            ),
            SpeedDialChild(
              backgroundColor: kBlack,
              child: const Icon(
                CupertinoIcons.arrow_up_arrow_down,
                color: kWhite,
              ),
              label: "Sort",
              labelStyle: const TextStyle(color: kWhite),
              labelBackgroundColor: kBlack,
              onTap: () {},
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
    ProfileModel? userData = profileController.profileModel.value;
    // if(userData ==null){
    //   return "";
    // }
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: kWhite,
            radius: 27,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pinimg.com/736x/f1/bf/bc/f1bfbce79fc3ce0fae1295e9af9109dd.jpg",
              ),
              radius: 25,
            ),
          ),
          kWidth15,
          Text(
            userData!.name!.capitalize!,
            style: const TextStyle(
              color: kText,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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
