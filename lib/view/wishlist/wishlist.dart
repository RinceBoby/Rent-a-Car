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

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    WishlistController wishlistController = Get.put(WishlistController());
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
            child: Obx(
              () {
                if (wishlistController.loading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (wishlistController.wishlistCar.isEmpty) {
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
                return GridView.builder(
                  itemCount: wishlistController.wishlistCar.length,
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
                    WishlistModel wishItems = WishlistModel();

                    var wishData = wishlistController.wishlistCar[index];

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
                                image: NetworkImage(wishItems.imgUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          kHeight10,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              wishItems.brand!,
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
                                onPressed: () {},
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
                                  String? userId =
                                      GetLocalStorage.getUserIdAndToken('uId');
                                  wishlistController.removeFromWishlistItem(
                                      wishItems.id!, userId!);
                                  Get.snackbar(
                                    "Message",
                                    "Removed successfully",
                                    backgroundColor: kWhite,
                                  );
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
            ),
          ),
        ),
      ),
    );
  }
}
