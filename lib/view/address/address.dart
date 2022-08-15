import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';

class Addresses extends StatelessWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          title: const Text(
            "Address",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              CupertinoIcons.arrow_left,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              kHeight15,
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: fieldColor,
                  borderRadius: kRadius15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kWidth10,
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: kWhite.withOpacity(.08),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: kText,
                        child: Icon(
                          CupertinoIcons.location_solid,
                          color: kBlack,
                          size: 30,
                        ),
                      ),
                    ),
                    kWidth10,
                    SizedBox(
                      width: size.width * .55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Home",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Address",
                            style: TextStyle(color: kText),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.edit_location_alt_rounded,
                        color: kText,
                        size: 30,
                      ),
                    ),
                    kWidth10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
