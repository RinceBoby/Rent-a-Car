import 'package:flutter/material.dart';

import '../../constants/styles/colors.dart';

class SignupTextFormField extends StatelessWidget {
  const SignupTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    required this.keyboardType,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: const TextStyle(color: kWhite),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: kWhite.withOpacity(.5)),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon, color: kWhite.withOpacity(.5)),
        filled: true,
        fillColor: fieldColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhite),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kRed),
        ),
      ),
    );
  }
}
