import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/data/database/table/outbox_table.dart';

part 'outbox_dao.g.dart';

/// 로컬 > 서버 동기화를 위한 Outbox
@DriftAccessor(tables: [Outbox])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(AppDatabase db) : super(db);

  /// Outbox에 작업 추가
  Future<int> insertOutbox(OutboxCompanion companion) async {
    debugPrint('📦 Outbox에 작업 추가 [operation=${companion.operation.value}, table=${companion.targetTable.value}, recordId=${companion.recordId.value}]');
    // debugPrint('📦 Payload [${companion.payload.value}]');
    final id = await into(outbox).insert(companion);
    debugPrint('📦 Outbox에 추가 완료 [id=$id]');
    return id;
  }

  /// 대기 중인 모든 Outbox 작업 조회
  Future<List<OutboxData>> getAllPendingOutbox() async {
    final tasks = await (select(outbox)..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).get(); // 오래된순 정렬
    debugPrint('📦 대기 중인 모든 Outbox 작업 조회 [${tasks.length}개] ${tasks.map((t) => '${t.operation}@${t.targetTable}[${t.recordId.substring(0, 8)}]').join(', ')}');
    return tasks;
  }

  /// Outbox 작업 삭제 (동기화 성공 시)
  Future<int> deleteOutbox(int outboxId) async {
    final count = await (delete(outbox)..where((t) => t.id.equals(outboxId))).go();
    debugPrint('📦 Outbox 작업 삭제 (동기화 성공) [id=$outboxId]');
    return count;
  }

  /// Outbox 재시도 횟수 및 에러 업데이트
  Future<int> updateOutboxRetry({
    required int outboxId,
    required String error,
  }) async {
    final count = await customUpdate(
      'UPDATE outbox SET retry_count = retry_count + 1, last_error = ? WHERE id = ?',
      variables: [Variable.withString(error), Variable.withInt(outboxId)],
      updates: {outbox},
    );
    debugPrint('📦 Outbox 재시도 [id=$outboxId], 재시도 횟수 [$count]');
    return count;
  }
}
