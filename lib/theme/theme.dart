import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

ThemeData lightTheme() => ThemeData(
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
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.cardTitleLarge),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.cardTitleMedium),
        headlineLarge: TextStyle(
          fontSize: 28,
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.w700,
          color: AppColors.headlineColor,
        ),
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(
            color: AppColors.primary,
            fontSize: 14,
            letterSpacing: -0.5,
            height: 1.3),
      ),
    );
