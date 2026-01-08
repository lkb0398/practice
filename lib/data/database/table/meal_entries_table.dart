import 'package:drift/drift.dart';

@DataClassName('MealEntryData')
class MealEntries extends Table {
  TextColumn get id => text()();
  TextColumn get mealDayId => text().named('meal_day_id')();
  TextColumn get category => text()();
  TextColumn get content => text().nullable()();
  TextColumn get photoUrl => text().named('photo_url').nullable()();
  DateTimeColumn get eatenAt => dateTime().named('eaten_at').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
