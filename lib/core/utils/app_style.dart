import 'package:base_app/core/extensions/color_extension.dart';
import 'package:base_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData defualtTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade200,
    cardColor: Colors.white,
    primarySwatch: AppColors.primaryColor.toMaterialColor(),
    brightness: Brightness.light,
  );
}
