import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class ThemeStyles {
  // Global
  static const AppFonts _fontFamily = AppFonts.montserrat;

  // Light Theme Colors
  static const Color primaryColor = AppColors.primary500;
  static const Color secondaryColor = AppColors.purple500;
  static const Color errorColor = AppColors.red500;
  static const Color background = AppColors.primary25;
  static const Color surface = AppColors.white;
  static const Color onPrimary = AppColors.white;
  static const Color onSecondary = AppColors.white;
  static const Color onBackground = AppColors.primary900;
  static const Color onSurface = AppColors.gray900;
  static const Color outline = AppColors.gray300;

  // Dark Theme Colors
  static const Color darkPrimaryColor = AppColors.primary500;
  static const Color darkSecondaryColor = AppColors.purple500;
  static const Color darkErrorColor = AppColors.red500;
  static const Color darkBackground = AppColors.primary900;
  static const Color darkSurface = AppColors.primary800;
  static const Color darkOnPrimary = AppColors.white;
  static const Color darkOnSecondary = AppColors.white;
  static const Color darkOnBackground = AppColors.primary25;
  static const Color darkOnSurface = AppColors.gray100;
  static const Color darkOutline = AppColors.gray700;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: _fontFamily.name,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: onPrimary,
          secondary: secondaryColor,
          onSecondary: onSecondary,
          error: errorColor,
          onError: onPrimary,
          surface: surface,
          onSurface: onSurface,
          outline: outline,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: background,
          foregroundColor: onBackground,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: onBackground,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: _fontFamily.name,
          ),
          iconTheme: IconThemeData(color: onBackground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: outline, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outline, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: _fontFamily.name,
        primaryColor: darkPrimaryColor,
        scaffoldBackgroundColor: darkBackground,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkPrimaryColor,
          onPrimary: darkOnPrimary,
          secondary: darkSecondaryColor,
          onSecondary: darkOnSecondary,
          error: darkErrorColor,
          onError: darkOnPrimary,
          surface: darkSurface,
          onSurface: darkOnSurface,
          outline: darkOutline,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkBackground,
          foregroundColor: darkOnBackground,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: darkOnBackground,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: _fontFamily.name,
          ),
          iconTheme: IconThemeData(color: darkOnBackground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: darkOutline, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkOutline, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
