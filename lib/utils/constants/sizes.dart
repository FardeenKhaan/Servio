import 'package:flutter/material.dart';

/// Central responsive layout sizes and design tokens for Servio.
class FkSizes {
  FkSizes._();

  // ---------------------------------------------------------------------------
  // Reference Design Dimensions (Standard mobile viewport: 390x844)
  // ---------------------------------------------------------------------------
  static const double designWidth = 390.0;
  static const double designHeight = 844.0;

  // ---------------------------------------------------------------------------
  // Standard Spacing & Size Tokens
  // ---------------------------------------------------------------------------
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  // ---------------------------------------------------------------------------
  // Icon Sizes
  // ---------------------------------------------------------------------------
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconCategoryBack = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 40.0;

  // ---------------------------------------------------------------------------
  // Font Sizes
  // ---------------------------------------------------------------------------
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeTitle = 19.0;
  static const double fontSizeXl = 20.0;
  static const double fontSizeH2 = 24.0;
  static const double fontSizeH1 = 28.0;

  // ---------------------------------------------------------------------------
  // Servio Component Tokens
  // ---------------------------------------------------------------------------
  static const double headerRadius = 32.0;
  static const double cardRadius = 16.0;
  static const double cardRadiusSm = 12.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusLg = 16.0;
  static const double backButtonSize = 44.0;
  static const double backButtonRadius = 24.0;
  static const double searchBarHeight = 52.0;
  static const double searchFieldHeight = 48.0;
  static const double userAvatarSize = 52.0;
  static const double categoryCircleSize = 66.0;
  static const double navBarHeight = 65.0;
  static const double navBarRadius = 28.0;
  static const double buttonHeight = 52.0;
  static const double buttonRadius = 14.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;
  static const double inputFieldRadius = 12.0;
  static const double inputFieldHeight = 14.0;
  static const double spaceBtwInputFields = 16.0;
  static const double cardElevation = 2.0;
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 16.0;

  // ---------------------------------------------------------------------------
  // Responsive Measurement Helpers
  // ---------------------------------------------------------------------------
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  /// Responsive **width** proportional to designWidth (390).
  static double w(BuildContext context, num size) =>
      screenWidth(context) / designWidth * size.toDouble();

  /// Responsive **height** proportional to designHeight (844).
  static double h(BuildContext context, num size) =>
      screenHeight(context) / designHeight * size.toDouble();

  /// Responsive **radius/scale** taking both axes into account.
  static double r(BuildContext context, num size) {
    final scale =
        (screenWidth(context) / designWidth +
            screenHeight(context) / designHeight) /
        2;
    return size.toDouble() * scale;
  }

  /// Responsive **font size** (width-based scaling with clamp protection).
  static double sp(BuildContext context, num size) =>
      w(context, size).clamp(size * 0.85, size * 1.25);

  // ---------------------------------------------------------------------------
  // Responsive Padding & Margin Shortcuts
  // ---------------------------------------------------------------------------
  static EdgeInsets paddingAll(BuildContext context, num size) =>
      EdgeInsets.all(r(context, size));

  static EdgeInsets paddingH(BuildContext context, num size) =>
      EdgeInsets.symmetric(horizontal: w(context, size));

  static EdgeInsets paddingV(BuildContext context, num size) =>
      EdgeInsets.symmetric(vertical: h(context, size));

  static EdgeInsets paddingSymmetric(
    BuildContext context, {
    num horizontal = 0,
    num vertical = 0,
  }) => EdgeInsets.symmetric(
    horizontal: w(context, horizontal),
    vertical: h(context, vertical),
  );

  static BorderRadius radius(BuildContext context, num size) =>
      BorderRadius.circular(r(context, size));
}
