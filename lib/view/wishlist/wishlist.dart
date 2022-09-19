import 'package:carmarket/controllers/car_details_controller.dart';
import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/models/wishlist/wishlist_model.dart';
import 'package:carmarket/services/wishlist/wishlist_service.dart';
import 'package:carmarket/view/details/car_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/car_controller.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    carDetails? details;
    final orientation = MediaQuery.of(context).orientation;
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          title: const Text(
            "Wishlist",
            style: TextStyle(
              color: kText,
              fontSize: 26,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                CupertinoIcons.search,
                color: kText,
                size: 30,
              ),
            ),
          ],
        ),
        //
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FutureBuilder<List<WishlistModel>?>(
              future: WishlistServices.getDataFromWishList(userId: userId!),
              builder: (context, AsyncSnapshot<List<WishlistModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<WishlistModel>? wishListData = snapshot.data;

                if (wishListData == null) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 350),
                      child: Text(
                        "No Item in Wishlist",
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  );
                }
                return GetBuilder<WishlistController>(
                  init: WishlistController(),
                  builder: (controller) {
                    return GridView.builder(
                      itemCount: wishListData.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1 / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 4,
                      ),
                      itemBuilder: (context, index) {
                        var data = wishListData[index];

                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: fieldColor,
                            borderRadius: kRadius10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(data.imgUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              kHeight10,
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data.brand!,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              kHeight10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      CarController carController =
                                          Get.put(CarController());
                                      final carData =
                                          carController.allCars[index];
                                      Get.to(DetailsPage(
                                          id: carData, carId: data.id!));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(72, 40),
                                    ),
                                    child: const Text(
                                      "VIEW",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  kWidth05,
                                  //<<<<<Remove>>>>>//
                                  ElevatedButton(
                                    onPressed: () {
                                      DetailsController detailsController =
                                          Get.put(DetailsController(
                                              carId: data.id));
                                      String? userId =
                                          GetLocalStorage.getUserIdAndToken(
                                              'uId');
                                      controller.removeFromWishlistItem(
                                          data.id!, userId!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: kRed,
                                      fixedSize: const Size(92, 40),
                                    ),
                                    child: const Text(
                                      "REMOVE",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
