import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final String? placeholderAssets;
  final String? errorAssets;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final double borderRadiusAll;

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
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusAll),
      child: CachedNetworkImage(
        imageUrl: url,
        height: height,
        fit: fit,
        placeholder: (context, url) => placeholderAssets != null
            ? Image.asset(placeholderAssets!, fit: fit)
            : SizedBox(),
        errorWidget: (context, url, error) => errorAssets != null
            ? Image.asset(errorAssets!, fit: fit)
            : SizedBox(),
      ),
    );
  }
}
