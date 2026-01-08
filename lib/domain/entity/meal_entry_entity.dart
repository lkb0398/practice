import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';

part 'meal_entry_entity.freezed.dart';

@freezed
abstract class MealEntryEntity with _$MealEntryEntity {
  const factory MealEntryEntity({
    required String id, // id
    required String mealDayId, // MealDay id (MealEntry이 속해있는 테이블)
    required MealCategory category, // 식단 카테고리 (아침,점심,저녁,간식)
    String? content, // 기록 내용
    String? photoUrl, // 이미지 url
    DateTime? eatenAt, // 먹은 시간 (사용자가 설정)
    required DateTime createdAt, // 생성한 날짜
    required DateTime updatedAt, // 수정한 날짜
    DateTime? deletedAt, // 삭제한 날짜 (soft delete 용)
  }) = _MealEntryEntity;
}
