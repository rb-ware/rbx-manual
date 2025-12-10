import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  const AppTypography._();

  static TextTheme textTheme() {
    return GoogleFonts.montserratTextTheme().apply(
      bodyColor: AppColors.neutral,
      displayColor: AppColors.neutral,
    );
  }

  static TextStyle get appBarTitle => GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle get bodyMedium => GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.neutral,
      );

  static TextStyle counter(TextStyle? base) => GoogleFonts.montserrat(
        textStyle: base,
        fontWeight: FontWeight.w700,
      );
}
