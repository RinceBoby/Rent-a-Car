import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';

class TextInLine extends StatelessWidget {
  const TextInLine({
    Key? key,
    required this.text,
    required this.size,
    this.thickness,
  }) : super(key: key);
  final String text;
  final double size;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: kGrey,
              thickness: thickness,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              text,
              style: TextStyle(
                color: kWhite,
                fontSize: size,
              ),
            ),
          ),
           Expanded(
            child: Divider(
              thickness: thickness,
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
