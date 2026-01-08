import 'package:drift/drift.dart';
import 'package:vitameal/data/dto/meal_entry_dto.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/domain/entity/meal_entry_entity.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';

/// DTO(Supabase) > Domain(entity)
extension MealEntryDtoMapper on MealEntryDto {
  MealEntryEntity toEntity() {
    return MealEntryEntity(
      id: id,
      mealDayId: mealDayId,
      category: MealCategory.fromString(category),
      content: content,
      photoUrl: photoUrl,
      eatenAt: eatenAt != null ? DateTime.parse(eatenAt!) : null,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      deletedAt: deletedAt != null ? DateTime.parse(deletedAt!) : null,
    );
  }
}

/// Domain(entity) > DTO(Supabase)
extension MealEntryEntityToDto on MealEntryEntity {
  MealEntryDto toDto() {
    return MealEntryDto(
      id: id,
      mealDayId: mealDayId,
      category: category.value,
      content: content,
      photoUrl: photoUrl,
      eatenAt: eatenAt?.toIso8601String(),
      createdAt: createdAt.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
      deletedAt: deletedAt?.toIso8601String(),
    );
  }
}

/// DriftData > Domain(entity)
extension MealEntryDataMapper on MealEntryData {
  MealEntryEntity toEntity() {
    return MealEntryEntity(
      id: id,
      mealDayId: mealDayId,
      category: MealCategory.fromString(category),
      content: content,
      photoUrl: photoUrl,
      eatenAt: eatenAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

/// Domain(entity) > DriftCompanion
extension MealEntryEntityToCompanion on MealEntryEntity {
  MealEntriesCompanion toCompanion() {
    return MealEntriesCompanion(
      id: Value(id),
      mealDayId: Value(mealDayId),
      category: Value(category.value),
      content: Value(content),
      photoUrl: Value(photoUrl),
      eatenAt: Value(eatenAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
  }
}
