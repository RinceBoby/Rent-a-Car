import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/controllers/signup_controller.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/signup/profile_model.dart';
import 'package:carmarket/view/home/widget/details_tile.dart';
import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:carmarket/view/widgets/carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../details/car_details.dart';
import '../wishlist/wishlist.dart';
import 'widget/home_FAB.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarController carController = Get.put(CarController());
    SignupController signupController = Get.put(SignupController());
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    bool isExpanded = true;
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
                                // height: 440,
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
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      data.brand,
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: kText,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                    kWidth05,
                                                    Flexible(
                                                      child: Text(
                                                        data.model,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kText,
                                                          letterSpacing: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              //<<<<<Price>>>>>//
                                              Chip(
                                                avatar: const Icon(
                                                    Icons
                                                        .currency_rupee_rounded,
                                                    size: 18),
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

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white70
                                                  .withOpacity(.8),
                                              borderRadius: kRadius10,
                                            ),
                                            child: ExpansionTile(
                                              trailing: CircleAvatar(
                                                backgroundColor: kWhite,
                                                child: Center(
                                                  child: isExpanded == true
                                                      ? const Icon(
                                                          CupertinoIcons
                                                              .chevron_down,
                                                          color: kBlack,
                                                        )
                                                      : const Icon(
                                                          CupertinoIcons
                                                              .chevron_up,
                                                          color: kBlack,
                                                        ),
                                                ),
                                              ),
                                              title: const Text(
                                                "Details",
                                                style: TextStyle(
                                                  color: kBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              children: [
                                                DetailsTileWidget(
                                                  data: data,
                                                  title: "Location",
                                                  subTitle: data.location,
                                                  leadIcon: CupertinoIcons
                                                      .map_pin_ellipse,
                                                  tailIcon: CupertinoIcons
                                                      .paperplane_fill,
                                                ),
                                                DetailsTileWidget(
                                                    data: data,
                                                    title: "Seats",
                                                    subTitle:
                                                        data.seats.toString(),
                                                    leadIcon: Icons
                                                        .airline_seat_recline_extra_sharp),
                                                DetailsTileWidget(
                                                    data: data,
                                                    title: "Petrol",
                                                    subTitle: data.fueltype.name
                                                        .toString(),
                                                    leadIcon: Icons
                                                        .local_gas_station_rounded),
                                                DetailsTileWidget(
                                                    data: data,
                                                    title: "Mileage",
                                                    subTitle:
                                                        "${data.mileage} kmpl",
                                                    leadIcon: CupertinoIcons
                                                        .drop_fill),
                                                DetailsTileWidget(
                                                    data: data,
                                                    title: "Vehicel no",
                                                    subTitle:
                                                        data.regNo.toString(),
                                                    leadIcon: CupertinoIcons
                                                        .number_circle),
                                                DetailsTileWidget(
                                                    data: data,
                                                    title: "Registred Date",
                                                    subTitle: data.register
                                                        .toString(),
                                                    leadIcon: CupertinoIcons
                                                        .calendar_today),
                                              ],
                                            ),
                                          ),
                                        ),
                                        kHeight10,

                                        // //<<<<<Details>>>>>//
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 10),
                                        //   child: SizedBox(
                                        //     height: 45,
                                        //     child: ListView.separated(
                                        //       shrinkWrap: true,
                                        //       physics:
                                        //           const BouncingScrollPhysics(),
                                        //       scrollDirection: Axis.horizontal,
                                        //       itemCount: 1,
                                        //       separatorBuilder:
                                        //           (context, index) => kWidth05,
                                        //       itemBuilder: (context, index) =>
                                        //           Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceBetween,
                                        //         children: [
                                        //           //
                                        //           //<<<<<Location>>>>>//
                                        //           DetailChip(
                                        //             data,
                                        //             data.location,
                                        //             CupertinoIcons
                                        //                 .map_pin_ellipse,
                                        //           ),
                                        //           kWidth10,

                                        //           //<<<<Seats>>>>//
                                        //           DetailChip(
                                        //             data,
                                        //             data.seats.toString(),
                                        // Icons
                                        //     .airline_seat_recline_extra_sharp,
                                        //           ),
                                        //           kWidth10,

                                        //           //<<<<<Fuel>>>>>//
                                        //           DetailChip(
                                        //             data,
                                        //             data.fueltype.name,
                                        // Icons
                                        //     .local_gas_station_rounded,
                                        //           ),
                                        //           kWidth10,

                                        //           //<<<<<Mileage>>>>>//
                                        //           DetailChip(
                                        //             data,
                                        //             "${data.mileage} / Km",
                                        //             CupertinoIcons.drop_fill,
                                        //           ),
                                        //           kWidth10,
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
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
        floatingActionButton: fab_SpeedDial(
          carController: carController,
          size: size,
          orientation: orientation,
          signupController: signupController,
        ),
      ),
    );
  }

  //
  //
  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  //
  //<<<<<App_Bar>>>>>//
  // ignore: non_constant_identifier_names
  SliverAppBar HomeSliverAppBar() {
    ProfileController profileController = Get.put(ProfileController());
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.search,
            color: kWhite.withOpacity(.8),
            size: 32,
          ),
        ),
        kWidth05,
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
