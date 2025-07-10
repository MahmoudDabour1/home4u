import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home4u/core/theming/app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  fontFamily: "IBM Plex Sans Arabic",
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  ),
);
