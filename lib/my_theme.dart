import 'package:flutter/material.dart';

ThemeData myTheme() {
  const Color primaryBlack = Color(0xff2C2C2C);
  const Color secondaryBlack = Color(0xff333333);
  const Color tertiaryBlack = Color(0xffE0E0E0);
  const Color primaryWhite = Color(0xffFFFFFF);
  const Color primaryError = Color.fromARGB(255, 141, 4, 4);
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: primaryBlack,
      background: primaryWhite,
      brightness: Brightness.light,
      error: primaryError,
      onBackground: primaryWhite,
      onError: primaryError,
      onPrimary: primaryBlack,
      onSecondary: secondaryBlack,
      onSurface: primaryWhite,
      secondary: secondaryBlack,
      surface: primaryWhite,
      tertiary: tertiaryBlack
    ),
    appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
    textTheme: const TextTheme(
        headline1: TextStyle(
          color: primaryBlack,
          fontFamily: 'Open Sans',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headline2: TextStyle(
          color: primaryBlack,
          fontFamily: 'Open Sans',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        caption: TextStyle(
            color: secondaryBlack,
            fontFamily: 'Open Sans',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12)),
  );
}
