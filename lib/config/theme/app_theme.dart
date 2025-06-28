import 'package:flutter/material.dart';
import 'package:photofiy/core/constants/app_color.dart';
import 'package:photofiy/core/constants/app_fonts.dart';

class AppTheme {

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.kDarkPrimaryColor,
    scaffoldBackgroundColor: AppColor.kDarkBlueColor,
    dividerColor: Colors.black54,
    fontFamily: AppFonts.defaultFont,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.kDarkPrimaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: AppFonts.defaultFont,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    tabBarTheme: const TabBarThemeData(
      labelColor: AppColor.kTextLight,
      unselectedLabelColor: Colors.white70,
      labelStyle: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.defaultFont,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.defaultFont,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColor.kDarkBlueColor,
          width: 2.0,
        ),
        insets: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColor.kDarkPrimaryColor,
      secondary: AppColor.kDarkBlueColor,
      onPrimary: Colors.white,
      onSecondary: AppColor.kTextLight,
    ),
  );
}
