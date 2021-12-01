import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get dark => ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.black,
          onPrimary: Colors.black,
          primaryVariant: Colors.black,
          background: Colors.black,
          onBackground: Colors.white,
          secondary: Colors.purple,
          onSecondary: Colors.white,
          secondaryVariant: Colors.deepPurple,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.purple,
          onSurface: Colors.white,
          brightness: Brightness.dark,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
      );
}
