import 'package:chat_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class GapH extends StatelessWidget {
  final double height;

  const GapH({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height() / height,
    );
  }
}

class GapW extends StatelessWidget {
  final double width;

  const GapW({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() / width,
    );
  }
}
