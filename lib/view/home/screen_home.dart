import 'package:carmarket/controllers/car_controller.dart';
import 'package:carmarket/controllers/home_controller.dart';
import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/controllers/signup_controller.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/profile/profile_model.dart';
import 'package:carmarket/view/home/widget/details_tile.dart';
import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:carmarket/view/widgets/carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles/colors.dart';
import '../constants/spaces/dimensions.dart';
import '../details/car_details.dart';
import '../wishlist/wishlist.dart';
import 'widget/home_FAB.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarController carController = Get.put(CarController());
    SignupController signupController = Get.put(SignupController());

    TextEditingController searchController = TextEditingController();

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

                    //<<<<<Search_Box>>>>>//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: size.width * .76,
                          child: TextField(
                            controller: searchController,
                            // focusNode: fn1,
                            autofocus: false,

                            style: const TextStyle(color: kWhite),
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: fieldColor,
                              hintText: "Search",
                              hintStyle: const TextStyle(color: kGrey),
                              border:
                                  OutlineInputBorder(borderRadius: kRadius15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: kRadius15,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: kRadius15,
                              ),
                              focusColor: kWhite,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                  carController
                                      .getCars("/getcarData", "data")
                                      .then((value) =>
                                          carController.allCars.value = value);
                                },
                                child: const Icon(
                                  CupertinoIcons.clear_thick_circled,
                                  color: kGrey,
                                ),
                              ),
                            ),
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            carController
                                .getCars("/search", "data",
                                    isSearch: true,
                                    brand: searchController.text)
                                .then((value) =>
                                    carController.allCars.value = value);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: fieldColor,
                            fixedSize: Size(size.width * .15, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: kRadius15,
                            ),
                            side: const BorderSide(color: kWhite),
                          ),
                          child: const Icon(
                            CupertinoIcons.search,
                            color: kGrey,
                            size: 30,
                          ),
                        ),
                      ],
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
                                  DetailsPage(id: data, carId: data.id),
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
                                    kHeight05,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //
                                        //<<<<<Car_Name>>>>>//
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        "${data.brand} ${data.model}",
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kText,
                                                          letterSpacing: 1,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              //<<<<<Price>>>>>//
                                              Chip(
                                                label: Text(
                                                  "₹ ${data.price} / day",
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white70
                                                  .withOpacity(.8),
                                              borderRadius: kRadius10,
                                            ),
                                            child: ExpansionTile(
                                              // trailing: CircleAvatar(
                                              //   backgroundColor: kWhite,
                                              //   child: Center(
                                              //     child: isExpanded == true
                                              //         ? const Icon(
                                              //             CupertinoIcons
                                              //                 .chevron_down,
                                              //             color: kBlack,
                                              //           )
                                              //         : const Icon(
                                              //             CupertinoIcons
                                              //                 .chevron_up,
                                              //             color: kBlack,
                                              //           ),
                                              //   ),
                                              // ),
                                              title: const Text(
                                                "Details",
                                                style: TextStyle(
                                                  color: kBlack,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
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
              ),
            ),
          ],
        );
      }),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(const Wishlist());
          },
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
