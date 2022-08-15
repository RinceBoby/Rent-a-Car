import 'package:carmarket/view/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../details/car_details.dart';
import '../top deals/top_deals.dart';
import '../widgets/car_card.dart';
import '../wishlist/wishlist.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int length = 20;
  bool isDrop = false;

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
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: NestedScrollView(
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

                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 15,
                    runSpacing: 20,
                    children: List.generate(
                      isDrop
                          ? length + 1
                          : length > 9
                              ? 10
                              : length,
                      (index) {
                        if (isDrop ? length > index : 9 > index) {
                          return BrandCircle(
                              logo: "assets/1Benz.png", brand: "benz");
                        }
                        return GestureDetector(
                          onTap: () {
                            if (!isDrop) {
                              isDrop = true;
                            } else {
                              isDrop = false;
                            }

                            setState(() {});
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: fieldColor,
                                child: !isDrop
                                    ? Icon(
                                        CupertinoIcons
                                            .arrowtriangle_down_circle,
                                        color: kWhite.withOpacity(.9),
                                        size: 45,
                                      )
                                    : Icon(
                                        CupertinoIcons.arrowtriangle_up_circle,
                                        color: kWhite.withOpacity(.9),
                                        size: 45,
                                      ),
                              ),
                              kHeight10,
                              !isDrop
                                  ? Text(
                                      "More".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: kText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      "Less".toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: kText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  kHeight20,

                  //<<<<<Top_Deals>>>>>//
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Top Deals",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kText,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.to(const TopDeals()),
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight20,

                  //<<<<<Brand_List>>>>>//
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: brands.length,
                      separatorBuilder: (context, index) => kWidth10,
                      itemBuilder: (context, index) {
                        return RoundTabItem(text: brands[index], index: index);
                      },
                    ),
                  ),
                  kHeight20,

                  // <<<<<Car_Card>>>>>//
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
                  ),
                ],
              ),
            ),
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
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      title: Row(
        children: const [
          CircleAvatar(
            backgroundColor: kWhite,
            radius: 27,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/f1/bf/bc/f1bfbce79fc3ce0fae1295e9af9109dd.jpg",),
              radius: 25,
            ),
          ),
          kWidth15,
          Text(
            "User Name",
            style: TextStyle(
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
      bottom: AppBar(
        elevation: 0,
        backgroundColor: kTrans,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: TextFormField(
            onTap: () => Get.to(SearchScreen()),
            enabled: true,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: fieldColor,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: kText.withOpacity(.6),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: kText.withOpacity(.6),
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: kWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //<<<<<Brand_Circle>>>>>//
  BrandCircle({
    required String logo,
    required String brand,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 30,
            backgroundColor: fieldColor,
            backgroundImage: AssetImage(logo),
          ),
        ),
        kHeight10,
        Text(
          brand.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //<<<<<Round_Tab_item>>>>>//
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
