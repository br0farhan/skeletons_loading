import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';


class SkeletonWidget extends StatelessWidget {
  final double ? width;
  final double ? height;
  final BorderRadius borderRadius;

  const SkeletonWidget._({
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    Key ? key,
  }) : super(key: key);

  const SkeletonWidget.square({
    double ? width,
    double ? height,
  }) : this._(width: width, height: height);

  const SkeletonWidget.rounded({
    double ? width,
    double ? height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  const SkeletonWidget.circular({
    double ? width,
    double? height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(80)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: borderRadius,
          ),
        ),
      );
}