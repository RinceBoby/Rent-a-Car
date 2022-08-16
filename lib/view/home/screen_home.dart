import 'package:carmarket/view/login/widgets/line_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../details/car_details.dart';
import '../widgets/car_card.dart';
import '../wishlist/wishlist.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int activeIndex = 0;
  final urlImages = [
    "https://wallpaperaccess.com/full/1465186.jpg",
    "https://wallpaperaccess.com/full/156869.jpg",
    "https://wallpaperaccess.com/full/950124.jpg",
    "https://www.bmw.in/content/dam/bmw/marketIN/bmw_in/all-models/m-series/m5-sedan/2021/Home_Header_Banner_1680x756_02%20(1).jpg/jcr:content/renditions/cq5dam.resized.img.1680.large.time1625117918034.jpg",
    "https://wallpaperaccess.com/full/1288141.jpg",
  ];

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
                  Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 10 / 6,
                          pageSnapping: true,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                        ),
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index];
                          return carouselImage(size, urlImage, index);
                        },
                      ),
                      kHeight05,
                      carouselIndiactor(),
                    ],
                  ),
                  kHeight15,
                  //
                  //<<<<<Choose_Your_Car>>>>>//
                  const TextInLine(
                    text: "CHOOSE YOUR CAR",
                    size: 24,
                    thickness: 3,
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
                        childAspectRatio: 1.1 / 1.75,
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
      pinned: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: const [
          CircleAvatar(
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
    );
  }

  Widget carouselImage(Size size, String urlImage, int index) => Container(
        width: size.width * .95,
        color: kGrey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget carouselIndiactor() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const JumpingDotEffect(
          activeDotColor: kWhite,
          dotWidth: 6,
          dotHeight: 6,
        ),
      );
}
