import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  /// light mode
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.whiteColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryLightColor,
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: AppColors.whiteColor,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 33)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 30,
        ),
        labelSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ));
  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.primaryDarkColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryDarkColor,
          selectedItemColor: AppColors.brownColor,
          unselectedItemColor: AppColors.whiteColor,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 33)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 30,
        ),
        labelSmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ));
}
