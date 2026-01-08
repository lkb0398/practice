import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/fixed_colors.dart';
import 'package:vitameal/core/theme/variable_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color(0xFF89CC00), // primary400
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    extensions: const [VariableColors.light, FixedColors.constant],
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color(0xFF89CC00), // primary400
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF333333),
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: Color(0xFF333333),
    extensions: const [VariableColors.dark, FixedColors.constant],
  );
}

VariableColors vrc(BuildContext context) =>
    Theme.of(context).extension<VariableColors>()!;
FixedColors fxc(BuildContext context) =>
    Theme.of(context).extension<FixedColors>()!;
