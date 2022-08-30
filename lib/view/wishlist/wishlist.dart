import 'package:carmarket/controllers/wishlist_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
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
              fontWeight: FontWeight.bold,
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
            child: Obx(
              () {
                if (wishlistController.loading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (wishlistController.allWishlist.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Item in Wishlist",
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: 10,
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
                                image: NetworkImage(
                                  wishlistController.allWishlist[index].imgUrl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          kHeight10,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              wishlistController.allWishlist[index].brand!,
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
                                  fixedSize: const Size(75, 40),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: kRed,
                                  fixedSize: const Size(90, 40),
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
