import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_entity.freezed.dart';

@freezed
abstract class GoalsEntity with _$GoalsEntity {
  const factory GoalsEntity({
    String? userId,
    String? goalId,
    required String goalTitle, // 목표명
    required String goalUnit, // 목표 단위
    required double goalValue, // 목표 수치
    required DateTime goalDate, // 목표 날짜
    required bool isDone, // 달성 여부
    required bool isMain, // 대표설정 여부
  }) = _GoalsEntity;
}
