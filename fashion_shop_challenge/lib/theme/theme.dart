import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      onSurface: Colors.black,
      primary: Colors.grey.shade200,
      onPrimary: Colors.black54,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade800,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      surface: Colors.black87,
      onSurface: Colors.white,
      primary: Colors.grey.shade900,
      onPrimary: Colors.white70,
      secondary: Colors.grey.shade800,
    ));
