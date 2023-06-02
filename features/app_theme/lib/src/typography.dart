import 'size_ext.dart';
import 'package:flutter/material.dart';

abstract class TextSizes {
  TextStyle get title;
  TextStyle get subtitle;
}

extension FontWeightExt on TextStyle {
  TextStyle get w400 {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get w500 {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get w700 {
    return copyWith(fontWeight: FontWeight.w700);
  }
}

class WebTypographyData {
  const WebTypographyData({
    required this.sp10,
    required this.sp12,
    required this.sp14,
    required this.sp16,
    required this.sp18,
    required this.sp20,
    required this.sp22,
    required this.sp24,
    required this.sp28,
    required this.sp32,
    required this.sp36,
  });

  factory WebTypographyData.regular() {
    return const WebTypographyData(
      sp10: TextStyle(fontSize: 10),
      sp12: TextStyle(fontSize: 12),
      sp14: TextStyle(fontSize: 14),
      sp16: TextStyle(fontSize: 16),
      sp18: TextStyle(fontSize: 18),
      sp20: TextStyle(fontSize: 20),
      sp22: TextStyle(fontSize: 22),
      sp24: TextStyle(fontSize: 24),
      sp28: TextStyle(fontSize: 28),
      sp32: TextStyle(fontSize: 32),
      sp36: TextStyle(fontSize: 36),
    );
  }

  final TextStyle sp10;
  final TextStyle sp12;
  final TextStyle sp14;
  final TextStyle sp16;
  final TextStyle sp18;
  final TextStyle sp20;
  final TextStyle sp22;
  final TextStyle sp24;
  final TextStyle sp28;
  final TextStyle sp32;
  final TextStyle sp36;
}

class AppTypographyData {
  const AppTypographyData({
    required this.sp10,
    required this.sp12,
    required this.sp14,
    required this.sp16,
    required this.sp18,
    required this.sp20,
    required this.sp22,
    required this.sp28,
    required this.sp32,
    required this.sp36,
  });

  factory AppTypographyData.regular() {
    return AppTypographyData(
      sp10: TextStyle(fontSize: 10.h),
      sp12: TextStyle(fontSize: 12.h),
      sp14: TextStyle(fontSize: 14.h),
      sp16: TextStyle(fontSize: 16.h),
      sp18: TextStyle(fontSize: 18.h),
      sp20: TextStyle(fontSize: 20.h),
      sp22: TextStyle(fontSize: 22.h),
      sp28: TextStyle(fontSize: 28.h),
      sp32: TextStyle(fontSize: 32.h),
      sp36: TextStyle(fontSize: 36.h),
    );
  }

  final TextStyle sp10;
  final TextStyle sp12;
  final TextStyle sp14;
  final TextStyle sp16;
  final TextStyle sp18;
  final TextStyle sp20;
  final TextStyle sp22;
  final TextStyle sp28;
  final TextStyle sp32;
  final TextStyle sp36;
}
