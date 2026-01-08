import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_entry_dto.freezed.dart';
part 'meal_entry_dto.g.dart';

@freezed
abstract class MealEntryDto with _$MealEntryDto {
  const factory MealEntryDto({
    required String id, // id
    @JsonKey(name: 'meal_day_id') required String mealDayId, // MealDay id (MealEntry이 속해있는 테이블)
    required String category, // 식단 카테고리 (아침,점심,저녁,간식)
    String? content, // 기록 내용
    @JsonKey(name: 'photo_url') String? photoUrl, // 이미지 url
    @JsonKey(name: 'eaten_at') String? eatenAt, // 먹은 시간 (사용자가 설정)
    @JsonKey(name: 'created_at') required String createdAt, // 생성한 날짜
    @JsonKey(name: 'updated_at') required String updatedAt, // 수정한 날짜
    @JsonKey(name: 'deleted_at') String? deletedAt, // 삭제한 날짜 (soft delete 용)
  }) = _MealEntryDto;

  factory MealEntryDto.fromJson(Map<String, dynamic> json) => _$MealEntryDtoFromJson(json);
}
