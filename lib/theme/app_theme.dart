import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class AppTheme {
  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.mainBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.mainBackground,
          titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.headlineColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: AppColors.cardTitleLarge),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.cardTitleMedium),
          titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
          headlineLarge: TextStyle(
            fontSize: 28,
            // fontWeight: FontWeight.bold,
            fontWeight: FontWeight.w700,
            color: AppColors.headlineColor,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            // fontWeight: FontWeight.bold,
            fontWeight: FontWeight.w500,
            color: AppColors.headlineColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 19,
            // fontWeight: FontWeight.bold,
            fontWeight: FontWeight.w400,
            color: AppColors.headlineColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 28,
            color: AppColors.textColor,
          ),
          bodyMedium: TextStyle(
              color: AppColors.textColor,
              fontSize: 14,
              letterSpacing: -0.5,
              height: 1.3),
        ),
      );
}
