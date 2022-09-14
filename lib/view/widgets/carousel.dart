import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';

class CarCarousel extends StatefulWidget {
  const CarCarousel({Key? key}) : super(key: key);

  @override
  State<CarCarousel> createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
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
    final size = MediaQuery.of(context).size;
    return Column(
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
    );
  }

  Widget carouselImage(
    Size size,
    String urlImage,
    int index,
  ) =>
      Container(
        width: size.width * .95,
        decoration: BoxDecoration(borderRadius: kRadius05),
        // color: kGrey,
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
