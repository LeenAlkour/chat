import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldbg,
       primaryColor: AppColors.primary,
        textTheme: TextTheme(titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: AppColors.whiteText,
        ),titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.medium,
          color: AppColors.whiteText,
        ),bodyLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: AppColors.whiteText,
        ),bodyMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.medium,
          color: AppColors.whiteText,
        ), 
        bodySmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: AppColors.whiteText,
        ),)
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        
      );
}
