import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // Main App Colors
  static const Color kPrimaryColor = Color(0xFF01012C);
  static const Color kDarkPrimaryColor = Color(0xFF01012C);
  static const Color kSecondaryColor = Color(0xFF040519);
  static const Color kThirdColor = Color(0xFFC71E27);
  static const Color kDarkBlueColor = Color(0xFF01012C);

  // Text Colors
  static const Color kTextLight = Color(0xFFeceff4);
  static const Color kRicherBlue = Color(0xFF5e81ac);

  // Gradients & UI Elements
  static LinearGradient kCardGradient(BuildContext context) => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimaryColor,
      kSecondaryColor,
    ],
  );

  static Border kCardBorder(BuildContext context, bool value) {
    return Border.all(
      color: value
          ? kThirdColor
          : kSecondaryColor.withOpacity(0.3),
    );
  }

  static LinearGradient kAppBarGradient(BuildContext context) => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimaryColor,
      kThirdColor,
      kRicherBlue,
    ],
  );

  static Color kSheetColor(BuildContext context) => kSecondaryColor;
}
