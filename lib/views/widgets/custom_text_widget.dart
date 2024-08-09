import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String lebel;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFieldWidget({
    super.key,
    required this.lebel,
    this.suffixIcon,
    this.obscureText = true,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: lebel,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffixIcon),
    );
  }
}
