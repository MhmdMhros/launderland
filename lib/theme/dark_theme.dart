import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  static ThemeData buildTheme() {
    return ThemeData().copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        primary: Colors.black,
        secondary: const Color(0xFF212321),
        brightness: Brightness.dark,
        onSecondary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF222a59),
        foregroundColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 70,
        shadowColor: Color(0xFF222a59),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        titleTextStyle: TextStyle(fontFamily: 'Google-Sans', fontSize: 20),
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: Color(0xFF222a59),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,

          // systemNavigationBarColor: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF222a59),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF222a59),
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 12),
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        labelLarge: TextStyle(),
        labelMedium: TextStyle(),
        labelSmall: TextStyle(),
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
        titleSmall: TextStyle(),
      ).apply(
        fontFamily: 'Google-Sans',
        bodyColor: Colors.white,
        displayColor: Colors.white,
        decorationColor: Colors.white,
      ),
    );
  }
}
