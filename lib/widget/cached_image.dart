import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final String? placeholderAssets;
  final String? errorAssets;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final double borderRadiusAll;
  final Function(String?)? onTap;

  const CachedImage({
    super.key,
    required this.url,
    this.placeholderAssets =
        "packages/flutter_smart/assets/images/placeholder.png",
    this.errorAssets = "packages/flutter_smart/assets/images/placeholder.png",
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.borderRadiusAll = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNetImage =
        url != null &&
        (url!.startsWith("http://") || url!.startsWith("https://"));
    final clipRRect = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusAll),
      child: url == null
          ? Image.asset(errorAssets!, fit: fit, width: width, height: height)
          : isNetImage
          ? CachedNetworkImage(
              imageUrl: url!,
              height: height,
              width: width,
              fit: fit,
              placeholder: (context, url) => placeholderAssets != null
                  ? Image.asset(
                      placeholderAssets!,
                      fit: fit,
                      width: width,
                      height: height,
                    )
                  : SizedBox(),
              errorWidget: (context, url, error) => errorAssets != null
                  ? Image.asset(
                      errorAssets!,
                      fit: fit,
                      width: width,
                      height: height,
                    )
                  : SizedBox(),
            )
          : Image.file(File(url!), fit: fit, width: width, height: height),
    );
    if (onTap == null) {
      return clipRRect;
    } else {
      return GestureDetector(
        onTap: () {
          onTap!.call(url);
        },
        child: clipRRect,
      );
    }
  }
}
