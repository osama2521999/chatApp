import 'dart:math';

import 'package:flutter/material.dart';

extension ScreenDimensions on BuildContext {
  double heightRatio() => MediaQuery.sizeOf(this).height / 928;

  double widthRatio() => MediaQuery.sizeOf(this).width / 426;

  double height() => MediaQuery.sizeOf(this).height;

  double width() => MediaQuery.sizeOf(this).width;

  double fontRatio() {
    double diagonalSize = sqrt(
        (MediaQuery.sizeOf(this).width * MediaQuery.sizeOf(this).width) +
            (MediaQuery.sizeOf(this).height * MediaQuery.sizeOf(this).height));
    // Define a base diagonal size for reference (e.g., 800 for a typical device)
    double baseDiagonalSize = 800.0;

    return diagonalSize / baseDiagonalSize;
  }
}
