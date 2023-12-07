import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get screenSize => MediaQuery.of(this).size;
  Size get appbarSize => Size(
      MediaQuery.of(this).size.width, MediaQuery.of(this).size.height * 0.05);
  Widget get emptyBox => const SizedBox.shrink();
  Widget emptyHeightBox(double value) => SizedBox(
        height: value,
      );
  Widget emptyWidthBox(double value) => SizedBox(
        width: value,
      );
}
