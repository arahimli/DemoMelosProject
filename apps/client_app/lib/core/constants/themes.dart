import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

ColorScheme lightColorScheme(AppTheme appTheme) {
  final AppColorsData appColors = appTheme.colors;

  return ColorScheme(
    brightness: Brightness.light,
    primary: appColors.primary,
    onPrimary: appColors.onPrimary,
    secondary: appColors.secondary,
    onSecondary: appColors.onSecondary,
    surface: appColors.surface,
    onSurface: appColors.onSurface,
    background: appColors.background,
    onBackground: appColors.onBackground,
    outline: appColors.outline,
    error: appColors.error,
    onError: appColors.onError,
  );
}
