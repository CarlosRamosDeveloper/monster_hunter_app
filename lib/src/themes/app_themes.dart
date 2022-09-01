import 'package:flutter/material.dart';

class CustomThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final bool isDarkMode;

  CustomThemeData(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.tertiaryColor,
      required this.isDarkMode});

  ThemeData get appThemeData => ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      splashColor: secondaryColor,
      scaffoldBackgroundColor: primaryColor,
      colorScheme: ColorScheme(
          brightness: (isDarkMode) ? Brightness.dark : Brightness.light,
          primary: primaryColor,
          onPrimary: (isDarkMode) ? Colors.white : Colors.black,
          secondary: secondaryColor,
          onSecondary: tertiaryColor,
          error: Colors.black,
          onError: Colors.red,
          background: secondaryColor,
          onBackground: (isDarkMode) ? Colors.white : Colors.black,
          surface: primaryColor,
          onSurface: (isDarkMode) ? Colors.white : Colors.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: tertiaryColor,
          splashColor: secondaryColor,
          foregroundColor: primaryColor),
      scrollbarTheme: const ScrollbarThemeData(radius: Radius.circular(50)));
}
