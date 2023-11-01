import 'package:flutter/material.dart';

class SpaceDivider extends StatelessWidget {
  const SpaceDivider({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
