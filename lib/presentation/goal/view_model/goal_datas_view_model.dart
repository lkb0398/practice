import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/goal_datas_entity.dart';

part 'goal_datas_view_model.g.dart';

@riverpod
class GoalDatasViewModel extends _$GoalDatasViewModel {
  @override
  void build() {}

  Future<void> saveData({
    required String goalId,
    required DateTime dataDate,
    required double dataValue,
  }) async {
    // final userId = ref.read(userIdProvider);
    await ref
        .read(goalDatasRepositoryProvider)
        .saveData(
          GoalDatasEntity(
            goalId: goalId,
            dataDate: dataDate,
            dataValue: dataValue,
          ),
        );
  }

  Future<void> deleteDatas(List<String> dataIds) async {
    await ref.read(goalDatasRepositoryProvider).deleteDatas(dataIds);
  }
}
