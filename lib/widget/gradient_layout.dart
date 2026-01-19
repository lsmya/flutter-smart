import 'package:flutter/material.dart';
import 'package:flutter_smart/extension/extension.dart';

/// 自定义渐变背景
class GradientLayout extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final double? width;
  final double? height;

  const GradientLayout({
    super.key,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: gradientColors.isNullOrEmpty() ? backgroundColor : null,
      decoration: gradientColors.isNullOrEmpty()
          ? null
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors!,
              ),
            ),
      child: child,
    );
  }
}
