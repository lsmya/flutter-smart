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
  final double? borderRadiusAll;
  final BoxBorder? border;
  final Function(String?)? onTap;

  const CachedImage({
    super.key,
    required this.url,
    this.placeholderAssets,
    this.errorAssets,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.borderRadiusAll,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNetImage =
        url != null &&
        (url!.startsWith("http://") || url!.startsWith("https://"));
    final imageChild = url == null
        ? (errorAssets == null
              ? SizedBox(width: width, height: height)
              : Image.asset(
                  errorAssets!,
                  fit: fit,
                  width: width,
                  height: height,
                ))
        : isNetImage
        ? CachedNetworkImage(
            imageUrl: url!,
            height: height,
            width: width,
            fit: fit,
            placeholder: placeholderAssets != null
                ? (context, url) => Image.asset(
                    placeholderAssets!,
                    fit: fit,
                    width: width,
                    height: height,
                  )
                : null,
            errorWidget: errorAssets != null
                ? ((context, url, error) => Image.asset(
                    errorAssets!,
                    fit: fit,
                    width: width,
                    height: height,
                  ))
                : null,
          )
        : Image.file(File(url!), fit: fit, width: width, height: height);

    final clipRRect = (borderRadius != null || borderRadiusAll != null)
        ? ClipRRect(
            borderRadius:
                borderRadius ?? BorderRadius.circular(borderRadiusAll ?? 0),
            child: imageChild,
          )
        : imageChild;

    final body = border == null
        ? clipRRect
        : Container(
            decoration: BoxDecoration(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(borderRadiusAll ?? 0),
              border: border,
            ),
            child: clipRRect,
          );
    if (onTap == null) {
      return body;
    } else {
      return GestureDetector(
        onTap: () {
          onTap!.call(url);
        },
        child: body,
      );
    }
  }
}
