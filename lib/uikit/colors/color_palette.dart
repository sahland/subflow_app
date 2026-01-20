import 'package:flutter/material.dart';

abstract class LightColorPalette {
  static const white = Colors.white;
  static const black = Colors.black;
  static const lightScaffold = Color(0xFFF5F5F5);
  static const lightBar = Color(0xFFFFFFFF);
  static const blackElement = Color(0xFF333333);
  static const textGray = Color(0xFF757575);
  static const lightPrimary = Color(0xFF2196F3);
}

abstract class DarkColorPalette {
  static const white = Colors.white;
  static const black = Colors.black;
  static const darkScaffold = Color.fromARGB(255, 29, 29, 29);
  static const darkBar = Color(0xFF1E1E1E);
  static const whiteElement = Color(0xFFEEEEEE);
  static const textGray = Color(0xFFBDBDBD);
  static const darkPrimary = Color(0xFF64B5F6);
}
