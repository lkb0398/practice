import 'package:drift/drift.dart';

@DataClassName('SyncMetadataData')
class SyncMetadata extends Table {
  TextColumn get userId => text().named('user_id')();
  TextColumn get targetTable => text().named('table_name')();
  DateTimeColumn get lastSyncAt => dateTime().named('last_sync_at')();

  @override
  Set<Column> get primaryKey => {userId, targetTable};
}
