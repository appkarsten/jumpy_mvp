import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

ThemeData lightTheme() => ThemeData(
      appBarTheme: AppBarTheme(
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
