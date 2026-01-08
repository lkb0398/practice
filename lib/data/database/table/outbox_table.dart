import 'package:drift/drift.dart';

@DataClassName('OutboxData')
class Outbox extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get operation => text()(); // 'insert', 'update', 'delete'
  TextColumn get targetTable => text().named('table_name')(); // 'meal_days', 'meal_entries'
  TextColumn get recordId => text().named('record_id')();
  TextColumn get payload => text()(); // JSON string
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  IntColumn get retryCount => integer().named('retry_count').withDefault(const Constant(0))();
  TextColumn get lastError => text().named('last_error').nullable()();
}
