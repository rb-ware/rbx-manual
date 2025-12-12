import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    );

    final colorScheme = baseColorScheme.copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.grey200,
      secondary: AppColors.secondary,
      onSecondary: AppColors.grey200,
      surface: AppColors.surface,
      onSurface: AppColors.neutral,
      background: AppColors.grey200,
      onBackground: AppColors.neutral,
      error: AppColors.primary,
      onError: AppColors.grey200,
    );

    final textTheme = AppTypography.textTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.grey200,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        titleTextStyle: AppTypography.appBarTitle,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          textStyle:
              AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
