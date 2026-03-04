import 'package:flutter/material.dart';

import '../extension/extension_list.dart';

/// 自定义渐变背景
class GradientLayout extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;

  const GradientLayout({
    super.key,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.gradientColors,
    this.margin,
    this.begin,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      color: gradientColors.isNullOrEmpty() ? backgroundColor : null,
      decoration: gradientColors.isNullOrEmpty()
          ? null
          : BoxDecoration(
              gradient: LinearGradient(
                begin: begin ?? Alignment.topCenter,
                end: end ?? Alignment.bottomCenter,
                colors: gradientColors!,
              ),
            ),
      child: child,
    );
  }
}
