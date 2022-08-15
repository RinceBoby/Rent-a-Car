import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  const FieldText({
    Key? key,
    required this.text,
    required this.textColor,
    this.fw,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final FontWeight? fw;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fw,
        fontSize: 18,
        color: textColor,
      ),
    );
  }
}
