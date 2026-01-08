import 'package:drift/drift.dart';

@DataClassName('MealDayData')
class MealDays extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().named('user_id')();
  DateTimeColumn get mealDate => dateTime().named('meal_date')();
  TextColumn get adherence => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  IntColumn get dataVersion => integer().named('data_version').withDefault(const Constant(0))();
  DateTimeColumn get lastEntryUpdatedAt => dateTime().named('last_entry_updated_at').nullable()();
  BoolColumn get needsAiRefresh => boolean().named('needs_ai_refresh').withDefault(const Constant(true))();
  TextColumn get latestAiSummary => text().named('latest_ai_summary').nullable()();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {userId, mealDate}
      ];
}
