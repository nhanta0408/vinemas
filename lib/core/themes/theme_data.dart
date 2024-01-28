import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: const TextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF8036),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xFF14CC52),
    onSecondary: Color(0xffffffff),
    background: Color(0xFF1A2232),
    onBackground: Color(0xffffffff),
    error: Colors.red,
    onError: Color(0xffffffff),
    surface: Color(0xFF1F293D),
    onSurface: Color(0xffffffff),
    outline: Color(0x1A6D9EFF),
    primaryContainer: Color(0xFF637394),
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: const TextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF8036),
    onPrimary: Color(0xFF1A2232),
    secondary: Color(0xFF14CC52),
    onSecondary: Color(0xFF1A2232),
    background: Colors.white,
    onBackground: Color(0xFF1A2232),
    error: Colors.red,
    onError: Color(0xFF1A2232),
    surface: Color(0xFFDCDCDC),
    onSurface: Color(0xFF1A2232),
    outline: Color(0x1A6D9EFF),
    primaryContainer: Color(0xFF637394),
    onPrimaryContainer: Color(0xFF1A2232),
  ),
);
