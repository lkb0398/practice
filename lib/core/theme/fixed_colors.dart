import 'package:flutter/material.dart';

/// < 테마 변경해도 고정인 색들 : fxc(context).primary100 로 사용 >
class FixedColors extends ThemeExtension<FixedColors> {
  const FixedColors({
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.secondary50,
    required this.secondary100,
    required this.secondary200,
    required this.secondary400,
    required this.textcolor0,
    required this.textcolor50,
    required this.textcolor100,
    required this.textcolor200,
    required this.textcolor300,
    required this.textcolor400,
    required this.textcolor500,
    required this.textcolor600,
    required this.textcolor700,
    required this.textcolor800,
    required this.feelgood,
    required this.feelnormal,
    required this.feelbad,
    required this.accentsgreen,
    required this.yellow,
  });
  final Color? primary100;
  final Color? primary200;
  final Color? primary300;
  final Color? primary400;
  final Color? primary500;
  final Color? primary600;
  final Color? secondary50;
  final Color? secondary100;
  final Color? secondary200;
  final Color? secondary400;
  final Color? textcolor0;
  final Color? textcolor50;
  final Color? textcolor100;
  final Color? textcolor200;
  final Color? textcolor300;
  final Color? textcolor400;
  final Color? textcolor500;
  final Color? textcolor600;
  final Color? textcolor700;
  final Color? textcolor800;
  final Color? feelgood;
  final Color? feelnormal;
  final Color? feelbad;
  final Color? accentsgreen;
  final Color? yellow;

  static const FixedColors constant = FixedColors(
    // 초록색
    primary100: Color(0xFFE9FAC8),
    primary200: Color(0xFFD2F291),
    primary300: Color(0xFFB8E55C),
    primary400: Color(0xFF89CC00),
    primary500: Color(0xFF679900),
    primary600: Color(0xFF456600),
    // 빨간색
    secondary50: Color(0xFFFFF5F6),
    secondary100: Color(0xFFFFEBEE),
    secondary200: Color(0xFFFFB8C2),
    secondary400: Color(0xFFFF516A),
    // 검정/회색
    textcolor0: Color(0xFFFFFFFF),
    textcolor50: Color(0xFFF2F2F2),
    textcolor100: Color(0xFFE6E6E6),
    textcolor200: Color(0xFFD9D9D9),
    textcolor300: Color(0xFFBDBDBD),
    textcolor400: Color(0xFF8D8D8D),
    textcolor500: Color(0xFF737373),
    textcolor600: Color(0xFF595959),
    textcolor700: Color(0xFF333333),
    textcolor800: Color(0xFF262626),
    // 식단 평가 색상
    feelgood: Color(0xFF5CE64A),
    feelnormal: Color(0xFFFEBE10),
    feelbad: Color(0xFFFF729A),
    // 알람 토글 색상
    accentsgreen: Color(0xFF34C759),
    // 온보딩 화살표 색상
    yellow: Color(0xFFFFE032),
  );

  @override
  FixedColors copyWith({
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? secondary50,
    Color? secondary100,
    Color? secondary200,
    Color? secondary400,
    Color? textcolor0,
    Color? textcolor50,
    Color? textcolor100,
    Color? textcolor200,
    Color? textcolor300,
    Color? textcolor400,
    Color? textcolor500,
    Color? textcolor600,
    Color? textcolor700,
    Color? textcolor800,
    Color? feelgood,
    Color? feelnormal,
    Color? feelbad,
    Color? accentsgreen,
    Color? yellow,
  }) => FixedColors(
    primary100: primary100 ?? this.primary100,
    primary200: primary200 ?? this.primary200,
    primary300: primary300 ?? this.primary300,
    primary400: primary400 ?? this.primary400,
    primary500: primary500 ?? this.primary500,
    primary600: primary600 ?? this.primary600,
    secondary50: secondary50 ?? this.secondary50,
    secondary100: secondary100 ?? this.secondary100,
    secondary200: secondary200 ?? this.secondary200,
    secondary400: secondary400 ?? this.secondary400,
    textcolor0: textcolor0 ?? this.textcolor0,
    textcolor50: textcolor50 ?? this.textcolor50,
    textcolor100: textcolor100 ?? this.textcolor100,
    textcolor200: textcolor200 ?? this.textcolor200,
    textcolor300: textcolor300 ?? this.textcolor300,
    textcolor400: textcolor400 ?? this.textcolor400,
    textcolor500: textcolor500 ?? this.textcolor500,
    textcolor600: textcolor600 ?? this.textcolor600,
    textcolor700: textcolor700 ?? this.textcolor700,
    textcolor800: textcolor800 ?? this.textcolor800,
    feelgood: feelgood ?? this.feelgood,
    feelnormal: feelnormal ?? this.feelnormal,
    feelbad: feelbad ?? this.feelbad,
    accentsgreen: accentsgreen ?? this.accentsgreen,
    yellow: yellow ?? this.yellow,
  );

  @override
  FixedColors lerp(ThemeExtension<FixedColors>? other, double t) {
    if (other is! FixedColors) return this;
    return FixedColors(
      primary100: Color.lerp(primary100, other.primary100, t),
      primary200: Color.lerp(primary200, other.primary200, t),
      primary300: Color.lerp(primary300, other.primary300, t),
      primary400: Color.lerp(primary400, other.primary400, t),
      primary500: Color.lerp(primary500, other.primary500, t),
      primary600: Color.lerp(primary600, other.primary600, t),
      secondary50: Color.lerp(secondary50, other.secondary50, t),
      secondary100: Color.lerp(secondary100, other.secondary100, t),
      secondary200: Color.lerp(secondary200, other.secondary200, t),
      secondary400: Color.lerp(secondary400, other.secondary400, t),
      textcolor0: Color.lerp(textcolor0, other.textcolor0, t),
      textcolor50: Color.lerp(textcolor50, other.textcolor50, t),
      textcolor100: Color.lerp(textcolor100, other.textcolor100, t),
      textcolor200: Color.lerp(textcolor200, other.textcolor200, t),
      textcolor300: Color.lerp(textcolor300, other.textcolor300, t),
      textcolor400: Color.lerp(textcolor400, other.textcolor400, t),
      textcolor500: Color.lerp(textcolor500, other.textcolor500, t),
      textcolor600: Color.lerp(textcolor600, other.textcolor600, t),
      textcolor700: Color.lerp(textcolor700, other.textcolor700, t),
      textcolor800: Color.lerp(textcolor800, other.textcolor800, t),
      feelgood: Color.lerp(feelgood, other.feelgood, t),
      feelnormal: Color.lerp(feelnormal, other.feelnormal, t),
      feelbad: Color.lerp(feelbad, other.feelbad, t),
      accentsgreen: Color.lerp(accentsgreen, other.accentsgreen, t),
      yellow: Color.lerp(yellow, other.yellow, t),
    );
  }
}
