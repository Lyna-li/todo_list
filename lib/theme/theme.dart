import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFEEEFF5),
    primary: Colors.white,
    secondary: Color(0xFFBA83DE),
    onPrimary: Colors.grey.shade700,
  ),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Color(0xFF020206),
      primary: Color(0xFF1F1F1F),
     onPrimary: Colors.white,
 
      secondary:Color(0xFFBA83DE),
    ));
