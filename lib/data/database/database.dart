import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:vitameal/data/database/dao/meal_dao.dart';
import 'package:vitameal/data/database/dao/outbox_dao.dart';
import 'package:vitameal/data/database/dao/sync_metadata_dao.dart';
import 'package:vitameal/data/database/table/meal_days_table.dart';
import 'package:vitameal/data/database/table/meal_entries_table.dart';
import 'package:vitameal/data/database/table/outbox_table.dart';
import 'package:vitameal/data/database/table/sync_metadata_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [MealDays, MealEntries, Outbox, SyncMetadata],
  daos: [MealDao, OutboxDao, SyncMetadataDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'vitameal.db'));
    return NativeDatabase(file);
  });
}
