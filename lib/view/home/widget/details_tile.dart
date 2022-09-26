// ignore_for_file: must_be_immutable

import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:carmarket/view/constants/spaces/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../models/car/car_model.dart';

class DetailsTileWidget extends StatelessWidget {
  DetailsTileWidget({
    Key? key,
    required this.data,
    required this.title,
    required this.subTitle,
    required this.leadIcon,
    this.tailIcon,
  }) : super(key: key);

  String title;
  dynamic subTitle;
  IconData leadIcon;
  IconData? tailIcon;

  final carDetails data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(leadIcon, size: 25, color: kBlack),
          kWidth05,
          SizedBox(
            width: size.width * .33,
            child: Text(
              title,
              style: const TextStyle(
                color: kBlack,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            child: Text(
              ": ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
          ),
          SizedBox(
            width: size.width * .35,
            child: Text(
              subTitle,
              style: const TextStyle(
                fontSize: 18,
                color: kBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
