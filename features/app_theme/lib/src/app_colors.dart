import 'package:flutter/material.dart';

class AppColorsData {
  const AppColorsData({
    required this.primary,
    required this.onBackground,
    required this.neutral,
    // remains
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.success,
    required this.outline,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.inputBorderColor,
    required this.tabBarBackgroundColor,
  });

  factory AppColorsData.light() => const AppColorsData(
        primary: MaterialColor(
          0xFF347AF6,
          <int, Color>{
            50: Color(0xFFE4F3FF),
            100: Color(0xFFBEE1FF),
            600: Color(0xFF328DFF),
            500: Color(0xFF2B9CFF),
            700: Color(0xFF347AF6),
            900: Color(0xFF3547C4)
          },
        ),
        onPrimary: Colors.white,
        secondary: MaterialColor(
          0xFFF99608,
          <int, Color>{
            50: Color(0xFFFEF3E0),
            100: Color(0xFFFDDFB2),
            500: Color(0xFFF99608),
          },
        ),
        onSecondary: Color(0xFF111A24),
        error: MaterialColor(
          0xFFE8513A,
          <int, Color>{
            50: Color(0xFFFDECEE),
            100: Color(0xFFFBCED2),
            500: Color(0xFFE8513A),
            900: Color(0xFFAA3122),
          },
        ),
        onError: Colors.blue,
        success: MaterialColor(
          0xFF00BF6F,
          <int, Color>{
            50: Color(0xFFE3F6EA),
            100: Color(0xFFBAE8CB),
            400: Color(0xFF00BF6F),
            900: Color(0xFF00611F),
          },
        ),
        outline: Color(0xFFEAF0F5),
        surface: Color(0xFFF6F8FA),
        onSurface: Color(0xFF111A24),
        background: Colors.white,
        onBackground: Color(0xFF1F2D3B),
        inputBorderColor: Color(0xFFDCE5EE),
        neutral: MaterialColor(
          0xFF34475A,
          <int, Color>{
            100: Color(0xFFEAF0F5),
            300: Color(0xFFC4D4E2),
            400: Color(0xFFA3B7CD),
            600: Color(0xFF536E87),
            500: Color(0xFF607C98),
            700: Color(0xFF34475A),
          },
        ),
        tabBarBackgroundColor: Color(0xFFE9E9EA),
      );

  final MaterialColor primary;
  final Color onBackground;
  final MaterialColor neutral;
  final MaterialColor error;
  final MaterialColor success;
  final MaterialColor secondary;

  // remains
  final Color onPrimary;
  final Color onSecondary;
  final Color onError;
  final Color outline;
  final Color surface;
  final Color onSurface;
  final Color background;
  final Color inputBorderColor;
  final Color tabBarBackgroundColor;
}
