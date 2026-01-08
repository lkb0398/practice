import 'package:flutter/material.dart';
import 'package:vitameal/domain/entity/meal_day_entity.dart';
import 'package:vitameal/domain/enum/adherence_level_enum.dart';
import 'package:vitameal/core/util/date_time_utils.dart';

/// AdherenceLevel - Color 매핑 유틸
class AdherenceColorUtils {
  AdherenceColorUtils._();

  /// AdherenceLevel > Color 변환
  static Color? adherenceToColor(AdherenceLevel? adherence) {
    if (adherence == null) return null;

    switch (adherence) {
      case AdherenceLevel.notFollowed:
        return Colors.redAccent;
      case AdherenceLevel.partial:
        return Colors.orangeAccent;
      case AdherenceLevel.followed:
        return Colors.green;
    }
  }

  /// Color > AdherenceLevel 변환
  static AdherenceLevel colorToAdherence(Color color) {
    if (color == Colors.redAccent) {
      return AdherenceLevel.notFollowed;
    } else if (color == Colors.orangeAccent) {
      return AdherenceLevel.partial;
    } else if (color == Colors.green) {
      return AdherenceLevel.followed;
    }
    return AdherenceLevel.notFollowed;
  }

  /// MealDay 목록 > 날짜별 Color Map 생성
  static Map<DateTime, Color> buildColorMap(List<MealDayEntity> mealDays) {
    final Map<DateTime, Color> colorMap = {};

    for (final mealDay in mealDays) {
      final date = mealDay.mealDate;
      final adherence = mealDay.adherence;

      final color = adherenceToColor(adherence);
      if (color != null) {
        final dateOnly = date.dateOnly;
        colorMap[dateOnly] = color;
      }
    }
    return colorMap;
  }
}
