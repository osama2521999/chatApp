import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefix;

  final TextInputType? keyboardType;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.color,
      this.textColor,
      this.hintColor,
      this.hintText,
      this.validator,
      this.onFieldSubmitted,
      this.keyboardType,
      this.obscureText,
      this.suffix,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      controller: controller,
      style: TextStyle(color: textColor ?? Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        prefix: prefix,
        suffix: suffix
      ),
    );
  }
}
