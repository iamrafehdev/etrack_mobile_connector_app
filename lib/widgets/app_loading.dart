import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoading extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const AppLoading({
    Key? key,
    required this.width,
    required this.height, this.radius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
