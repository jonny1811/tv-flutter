

import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData getTheme(bool darkMode) {
  if (darkMode) {
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.dark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.darkLight,
      canvasColor: AppColors.dark,
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.all(
          Colors.lightBlue.withValues(alpha: 0.5),
        ),
        thumbColor: WidgetStateProperty.all(
          Colors.blue,
        ),
      ),
    );
  }
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.dark,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.dark,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.dark,
    ),
  );
}