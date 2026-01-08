import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_datas_entity.freezed.dart';

@freezed
abstract class GoalDatasEntity with _$GoalDatasEntity {
  const factory GoalDatasEntity({
    String? goalId,
    String? dataId,
    required DateTime dataDate, // 데이터 날짜
    required double dataValue, // 데이터 수치
  }) = _GoalDatasEntity;
}
