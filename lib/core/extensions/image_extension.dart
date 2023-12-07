import 'package:base_app/core/utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

extension ImageEtention on String {
  Widget imageFromAsset({double? width, double? height, Color? color}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppImages.placeHolderImage,
          width: width,
          height: height,
        );
      },
    );
  }

  Widget imageFromNetwork({double? width, double? height, Color? color}) {
    return CachedNetworkImage(
      imageUrl: this,
      width: width,
      height: height,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
