import 'package:drift/drift.dart';
import 'package:vitameal/data/database/database.dart';
import 'package:vitameal/data/database/table/sync_metadata_table.dart';

part 'sync_metadata_dao.g.dart';

/// 증분 동기화를 위한 메타데이터 DAO
@DriftAccessor(tables: [SyncMetadata])
class SyncMetadataDao extends DatabaseAccessor<AppDatabase> with _$SyncMetadataDaoMixin {
  SyncMetadataDao(AppDatabase db) : super(db);

  /// 특정 테이블의 마지막 동기화 시간 조회
  Future<DateTime?> getLastSyncAt({
    required String userId,
    required String targetTable,
  }) async {
    final result = await (select(syncMetadata)
          ..where((t) => t.userId.equals(userId))
          ..where((t) => t.targetTable.equals(targetTable)))
        .getSingleOrNull();
    return result?.lastSyncAt;
  }

  /// 마지막 동기화 시간 업데이트
  Future<void> updateLastSyncAt({
    required String userId,
    required String targetTable,
    required DateTime lastSyncAt,
  }) {
    return into(syncMetadata).insertOnConflictUpdate(
      SyncMetadataCompanion(
        userId: Value(userId),
        targetTable: Value(targetTable),
        lastSyncAt: Value(lastSyncAt),
      ),
    );
  }

  /// 모든 동기화 메타데이터 조회
  Future<List<SyncMetadataData>> getAllSyncMetadata({
    required String userId,
  }) {
    return (select(syncMetadata)..where((t) => t.userId.equals(userId))).get();
  }
}
