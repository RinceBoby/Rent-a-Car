import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class TextInLine extends StatelessWidget {
  const TextInLine({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: kGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              text,
              style: const TextStyle(
                color: kWhite,
                fontSize: 18,
              ),
            ),
          ),
          const Expanded(
            child:  Divider(
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}