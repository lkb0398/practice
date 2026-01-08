import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_datas_dto.freezed.dart';
part 'goal_datas_dto.g.dart';

@freezed
abstract class GoalDatasDto with _$GoalDatasDto {
  const factory GoalDatasDto({
    @JsonKey(name: 'goal_id') String? goalId,
    @JsonKey(name: 'data_id') String? dataId,
    @JsonKey(name: 'data_date') required String dataDate,
    @JsonKey(name: 'data_value') required double dataValue,
  }) = _GoalDatasDto;

  factory GoalDatasDto.fromJson(Map<String, dynamic> json) =>
      _$GoalDatasDtoFromJson(json);
}
