import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget(
      {super.key, required this.child, required this.enableShimmer});
  final Widget child;
  final bool enableShimmer;

  @override
  Widget build(BuildContext context) {
    return enableShimmer
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: enableShimmer,
            child: child,
          )
        : child;
  }
}
