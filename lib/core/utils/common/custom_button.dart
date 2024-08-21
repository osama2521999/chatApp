import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;

  final String? text;

  final TextInputType? keyboardType;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.keyboardType,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 100,
        height: height ?? 100,
        decoration: BoxDecoration(
            color: color ?? const Color(0Xff303030),
            borderRadius: BorderRadius.circular(
                radius ?? AppConstants.buttonsBorderRadius,
            ),
          border: Border.all(color: borderColor ?? const Color(0Xff303030))
        ),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text ?? '',
              style: TextStyle(color: textColor ?? Colors.white),
            )));
  }
}
