import 'package:flutter/material.dart';

enum AppTheme {
  nargacuga(
    theme: CustomThemeData(
        primaryColor: Color.fromARGB(255, 12, 5, 42),
        secondaryColor: Color.fromARGB(255, 143, 46, 46),
        tertiaryColor: Color.fromARGB(255, 223, 217, 45),
        isDarkMode: true),
    themeName: 'Nargacuga Theme',
  ),
  zinogre(
    theme: CustomThemeData(
        primaryColor: Color.fromARGB(255, 54, 128, 15),
        secondaryColor: Color.fromARGB(255, 201, 192, 28),
        tertiaryColor: Color(0xff7df9ff)),
    themeName: 'Zinogre Theme',
  ),
  mizutsune(
    theme: CustomThemeData(
        secondaryColor: Color.fromARGB(255, 241, 104, 156),
        tertiaryColor: Color.fromARGB(255, 82, 11, 59),
        primaryColor: Color.fromARGB(255, 244, 240, 187)),
    themeName: 'Mizutsune Theme',
  ),
  kushala(
    theme: CustomThemeData(
        primaryColor: Color.fromARGB(255, 87, 87, 87),
        secondaryColor: Color(0xffafafaf),
        tertiaryColor: Color.fromARGB(255, 178, 112, 42),
        isDarkMode: true),
    themeName: 'Kushala Daora Theme',
  );

  final CustomThemeData theme;
  final String themeName;

  const AppTheme({required this.theme, required this.themeName});
}

class CustomThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final bool isDarkMode;
  const CustomThemeData(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.tertiaryColor,
      this.isDarkMode = false});


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
        onSurface: (isDarkMode) ? Colors.white : Colors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: tertiaryColor,
          splashColor: secondaryColor,
          foregroundColor: primaryColor),
      scrollbarTheme: const ScrollbarThemeData(radius: Radius.circular(50)));
}