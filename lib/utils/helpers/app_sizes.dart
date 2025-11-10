import 'package:flutter/material.dart';

class AppSizes {
  static late double screenWidth;
  static late double screenHeight;

  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  static double width(double percent) => blockWidth * percent;

  static double height(double percent) => blockHeight * percent;

  static double font(double percent) => blockHeight * percent;

  static EdgeInsets paddingAll(double percent) =>
      EdgeInsets.all(blockWidth * percent);

  static EdgeInsets paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) => EdgeInsets.symmetric(
    horizontal: blockWidth * horizontal,
    vertical: blockHeight * vertical,
  );

  static EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: blockWidth * left,
    top: blockHeight * top,
    right: blockWidth * right,
    bottom: blockHeight * bottom,
  );

  static BorderRadius borderRadius(double percent) =>
      BorderRadius.circular(blockWidth * percent);

  static double radius(double percent) => blockWidth * percent;

  static double icon(double percent) => blockHeight * percent;

  // Responsive font size helper
  static double responsiveFont(double baseSize, {double? wideScreenMultiplier}) {
    final isWideScreen = screenWidth > 600;
    if (isWideScreen) {
      final multiplier = wideScreenMultiplier ?? 0.6;
      return font(baseSize * multiplier);
    }
    return font(baseSize);
  }

  // Screen size helpers
  static bool get isWideScreen => screenWidth > 600;

  static bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  static bool get isDesktop => screenWidth >= 1024;

  static bool get isMobile => screenWidth < 600;
}