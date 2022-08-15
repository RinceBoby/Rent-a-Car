import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.leadIcon,
    this.leadOnTap,
    this.title,
    this.trailIcon,
    this.trailOnTap,
  }) : super(key: key);

  final IconData? leadIcon;
  final VoidCallback? leadOnTap;
  final String? title;
  final IconData? trailIcon;
  final VoidCallback? trailOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //kHeight05,
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            children: [
              kWidth10,
              GestureDetector(
                onTap: leadOnTap,
                child: Icon(
                  leadIcon,
                  color: kText,
                ),
              ),
              kWidth25,
              Text(
                title!,
                style: const TextStyle(
                  color: kText,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: trailOnTap,
                child: Icon(
                  trailIcon,
                  color: kText,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        kHeight15,
      ],
    );
  }
}
