import 'package:base_app/core/extensions/image_extension.dart';
import 'package:base_app/core/extensions/size_extension.dart';
import 'package:base_app/core/extensions/text_style_extension.dart';

import 'package:base_app/core/utils/app_consts.dart';
import 'package:base_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

extension AlertDialogExtension on BuildContext {
  errorDialog(String error, {bool isDismissible = false}) {
    showDialog(
        context: this,
        barrierDismissible: isDismissible,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defualtPadding),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.defualtRadius))),
            content: Column(
              children: [
                context.emptyHeightBox((context.height * 0.02)),
                AppImages.errorImage.imageFromAsset(
                    width: context.width * 0.2, height: context.height * 0.15),
                context.emptyHeightBox((context.height * 0.02)),
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: context.textStyleSmall(),
                ),
                context.emptyHeightBox((context.height * 0.02)),
              ],
            ),
          );
        });
  }
}
