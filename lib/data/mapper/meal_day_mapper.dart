import 'package:drift/drift.dart';
import 'package:vitameal/data/dto/meal_day_dto.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/domain/entity/meal_day_entity.dart';
import 'package:vitameal/domain/enum/adherence_level_enum.dart';

/// DTO(Supabase) > Domain(entity)
extension MealDayDtoMapper on MealDayDto {
  MealDayEntity toEntity() {
    return MealDayEntity(
      id: id,
      userId: userId,
      mealDate: DateTime.parse(mealDate),
      adherence: adherence != null
          ? AdherenceLevel.fromString(adherence!)
          : null,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      dataVersion: dataVersion,
      lastEntryUpdatedAt: lastEntryUpdatedAt != null
          ? DateTime.parse(lastEntryUpdatedAt!)
          : null,
      needsAiRefresh: needsAiRefresh,
      latestAiSummary: latestAiSummary,
      deletedAt: deletedAt != null ? DateTime.parse(deletedAt!) : null,
    );
  }
}

/// Domain(entity) > DTO(Supabase)
extension MealDayEntityToDto on MealDayEntity {
  MealDayDto toDto() {
    return MealDayDto(
      id: id,
      userId: userId,
      mealDate: mealDate.toIso8601String(),
      adherence: adherence?.value,
      createdAt: createdAt.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
      dataVersion: dataVersion,
      lastEntryUpdatedAt: lastEntryUpdatedAt?.toIso8601String(),
      needsAiRefresh: needsAiRefresh,
      latestAiSummary: latestAiSummary,
      deletedAt: deletedAt?.toIso8601String(),
    );
  }
}

/// DriftData > Domain(entity)
extension MealDayDataMapper on MealDayData {
  MealDayEntity toEntity() {
    return MealDayEntity(
      id: id,
      userId: userId,
      mealDate: mealDate,
      adherence: adherence != null
          ? AdherenceLevel.fromString(adherence!)
          : null,
      createdAt: createdAt,
      updatedAt: updatedAt,
      dataVersion: dataVersion,
      lastEntryUpdatedAt: lastEntryUpdatedAt,
      needsAiRefresh: needsAiRefresh,
      latestAiSummary: latestAiSummary,
      deletedAt: deletedAt,
    );
  }
}

/// Domain(entity) > DriftCompanion
extension MealDayEntityToCompanion on MealDayEntity {
  MealDaysCompanion toCompanion() {
    return MealDaysCompanion(
      id: Value(id),
      userId: Value(userId),
      mealDate: Value(mealDate),
      adherence: Value(adherence?.value),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      dataVersion: Value(dataVersion),
      lastEntryUpdatedAt: Value(lastEntryUpdatedAt),
      needsAiRefresh: Value(needsAiRefresh),
      latestAiSummary: Value(latestAiSummary),
      deletedAt: Value(deletedAt),
    );
  }
}
