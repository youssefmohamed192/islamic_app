import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: const AppBarTheme(
      color: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 30),
      iconTheme: IconThemeData(color: AppColors.accent)
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 30),
      titleMedium: TextStyle(color: AppColors.accent, fontWeight: FontWeight.w600, fontSize: 25),
      titleSmall: TextStyle(color: AppColors.accent, fontWeight: FontWeight.w400, fontSize: 25),
      bodySmall: TextStyle(color: AppColors.accent, fontWeight: FontWeight.w400, fontSize: 20)
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.primary,
      thickness: 3
    )
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.primary,
    //   selectedItemColor: AppColors.accent,
    //   unselectedItemColor: AppColors.white,
    //   showSelectedLabels: true,
    //   selectedIconTheme: IconThemeData(color: AppColors.accent, size: 42),
    //   unselectedIconTheme: IconThemeData(color: AppColors.white, size: 32),
    // )
  );
}